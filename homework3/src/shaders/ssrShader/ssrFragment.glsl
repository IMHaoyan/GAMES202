#ifdef GL_ES
precision highp float;
#endif

uniform vec3 uLightDir;
uniform vec3 uCameraPos;
uniform vec3 uLightRadiance;
uniform sampler2D uGDiffuse;
uniform sampler2D uGDepth;
uniform sampler2D uGNormalWorld;
uniform sampler2D uGShadow;
uniform sampler2D uGPosWorld;

varying mat4 vWorldToScreen;
varying highp vec4 vPosWorld;

#define M_PI 3.1415926535897932384626433832795
#define TWO_PI 6.283185307
#define INV_PI 0.31830988618
#define INV_TWO_PI 0.15915494309

float Rand1(inout float p) {
  p = fract(p * .1031);
  p *= p + 33.33;
  p *= p + p;
  return fract(p);
}

vec2 Rand2(inout float p) {
  return vec2(Rand1(p), Rand1(p));
}

float InitRand(vec2 uv) {
	vec3 p3  = fract(vec3(uv.xyx) * .1031);
  p3 += dot(p3, p3.yzx + 33.33);
  return fract((p3.x + p3.y) * p3.z);
}

vec3 SampleHemisphereUniform(inout float s, out float pdf) {
  vec2 uv = Rand2(s);
  float z = uv.x;
  float phi = uv.y * TWO_PI;
  float sinTheta = sqrt(1.0 - z*z);
  vec3 dir = vec3(sinTheta * cos(phi), sinTheta * sin(phi), z);
  pdf = INV_TWO_PI;
  return dir;
}

vec3 SampleHemisphereCos(inout float s, out float pdf) {
  vec2 uv = Rand2(s);
  float z = sqrt(1.0 - uv.x);
  float phi = uv.y * TWO_PI;
  float sinTheta = sqrt(uv.x);
  vec3 dir = vec3(sinTheta * cos(phi), sinTheta * sin(phi), z);
  pdf = z * INV_PI;
  return dir;
}

void LocalBasis(vec3 n, out vec3 b1, out vec3 b2) {
  float sign_ = sign(n.z);
  if (n.z == 0.0) {
    sign_ = 1.0;
  }
  float a = -1.0 / (sign_ + n.z);
  float b = n.x * n.y * a;
  b1 = vec3(1.0 + sign_ * n.x * n.x * a, sign_ * b, -sign_ * n.x);
  b2 = vec3(b, sign_ + n.y * n.y * a, -n.y);
}

vec4 Project(vec4 a) {
  return a / a.w;
}

float GetDepth(vec3 posWorld) {
  float depth = (vWorldToScreen * vec4(posWorld, 1.0)).w;
  return depth;
}

/*
 * Transform point from world space to screen space([0, 1] x [0, 1])
 *
 */
vec2 GetScreenCoordinate(vec3 posWorld) {
  vec2 uv = Project(vWorldToScreen * vec4(posWorld, 1.0)).xy * 0.5 + 0.5;
  return uv;
}

float GetGBufferDepth(vec2 uv) {
  float depth = texture2D(uGDepth, uv).x;
  if (depth < 1e-2) {
    depth = 1000.0;
  }
  return depth;
}

vec3 GetGBufferNormalWorld(vec2 uv) {
  vec3 normal = texture2D(uGNormalWorld, uv).xyz;
  return normal;
}

vec3 GetGBufferPosWorld(vec2 uv) {
  vec3 posWorld = texture2D(uGPosWorld, uv).xyz;
  return posWorld;
}

float GetGBufferuShadow(vec2 uv) {
  float visibility = texture2D(uGShadow, uv).x;
  return visibility;
}

vec3 GetGBufferDiffuse(vec2 uv) {
  vec3 diffuse = texture2D(uGDiffuse, uv).xyz;
  diffuse = pow(diffuse, vec3(2.2));
  return diffuse;
}

/*
 * Evaluate diffuse bsdf value.
 *
 * wi, wo are all in world space.
 * uv is in screen space, [0, 1] x [0, 1].
 *
 */
vec3 EvalDiffuse(vec3 wi, vec3 wo, vec2 uv) {
  vec3 diff = GetGBufferDiffuse(uv);
  vec3 norm = GetGBufferNormalWorld(uv);
  float NdotL = clamp(dot(norm, wi), 0.0, 1.0);
  return NdotL * diff;
}
/*
 * Evaluate directional light with shadow map
 * uv is in screen space, [0, 1] x [0, 1].
 */
vec3 EvalDirectionalLight(vec2 uv) {
  vec3 posW = GetGBufferPosWorld(uv);
  vec3 wi = normalize(uLightDir);
  vec3 wo = normalize(uCameraPos - posW);
  vec3 bsdf = EvalDiffuse(wi, wo, uv);
  return uLightRadiance * bsdf * GetGBufferuShadow(uv);
}

bool outScreen(vec3 pos){
  vec2 uv = GetScreenCoordinate(pos);
  return any(bvec4(lessThan(uv, vec2(0.0)), greaterThan(uv, vec2(1.0))));
}
// 光线前进走到了深度图的物体前面，并没有产生碰撞
bool atFront(vec3 pos){
  return GetDepth(pos) < GetGBufferDepth(GetScreenCoordinate(pos));
}

bool RayMarch(vec3 ori, vec3 dir, out vec3 hitPos) {
  float step = 0.8;
  vec3 pos = ori;
  bool intersect = false;
  for (int i = 0;i < 20;i ++){
    vec2 uv = GetScreenCoordinate(pos);
    float depth = GetGBufferDepth(uv);
    float distance_ray = GetDepth(pos); 
    if (outScreen(pos)){
      break;
    }
    if (atFront(pos + dir * step)){
      intersect = false;
      pos += dir * step;
      //step *= 2.0;
    }
    else {//下一步有交点
      intersect = true;
      // 步子已经离得很近了 
      if (step < 1e-2){
        // d1判断当前在深度图前面   d2判断下一步在深度图后面
        float d1 = GetGBufferDepth(GetScreenCoordinate(pos)) - GetDepth(pos); // + 1e-2;
        float d2 = GetDepth(pos + dir * step) - GetGBufferDepth(GetScreenCoordinate(pos + dir * step)); // + 1e-2
        if(d1 > 0.0 && d2 > 0.0){
          hitPos = pos + dir * step ;//* d1 / (d1 + d2);
          return true;
        }
      }
    }
    // 探测到下一步会走进去，开始慢慢走
    if(intersect){
      step *= 0.5;
    }
  }
  return false;
}

#define SAMPLE_NUM 10
vec3 EvalIndirectLight(vec3 pos){
  float pdf, seed = dot(pos, vec3(100.0));
  vec3 Li = vec3(0.0), dir, hitPos;
  vec3 normal = GetGBufferNormalWorld(GetScreenCoordinate(pos)), b1, b2;
  LocalBasis(normal, b1, b2);
  mat3 TBN = mat3(b1, b2, normal);
  for(int i = 0; i < SAMPLE_NUM;i++){
    vec3 light2Cam = uCameraPos - pos;//
    //dir = normalize(reflect(-light2Cam, normal));
    dir = normalize(TBN * SampleHemisphereCos(seed, pdf));//按照cos加权采样上半球
    if(RayMarch(pos, dir, hitPos)){ //SSR经典思想：如果打出光线有交点，则着色
      vec3 lightReflect = pos - hitPos;//
      vec2 uvReflect = GetScreenCoordinate(hitPos);//
      vec3 wo = normalize(uCameraPos - pos);
      vec3 wi = normalize(uLightDir);
      //vec3 L = EvalDirectionalLight(uvReflect);
      vec3 L = EvalDiffuse(dir, wo, GetScreenCoordinate(pos)) / pdf * EvalDiffuse(wi, wo, GetScreenCoordinate(hitPos)) * EvalDirectionalLight(GetScreenCoordinate(hitPos));
      Li += L;
    }
  }
  return Li / float(SAMPLE_NUM);
}

void main() {
  float s = InitRand(gl_FragCoord.xy);
  vec3 L = EvalDirectionalLight(GetScreenCoordinate(vPosWorld.xyz));
  vec3 Li = EvalIndirectLight(vPosWorld.xyz);
  L += Li;
  vec3 color = pow(clamp(L, vec3(0.0), vec3(1.0)), vec3(1.0 / 2.2));
  gl_FragColor = vec4(vec3(color.rgb), 1.0);
}