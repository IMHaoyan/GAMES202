#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>
#include <sstream>
#include <fstream>
#include <random>
#include "./ext/vec.h"

#define STB_IMAGE_WRITE_IMPLEMENTATION

#include "./ext/stb_image_write.h"
using namespace std;
const int resolution = 128;

typedef struct samplePoints {
    std::vector<Vec3f> directions;
	std::vector<float> PDFs;
}samplePoints;

samplePoints squareToCosineHemisphere(int sample_count){
    samplePoints samlpeList;
    const int sample_side = static_cast<int>(floor(sqrt(sample_count)));

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<> rng(0.0, 1.0);
    for (int t = 0; t < sample_side; t++) {
        for (int p = 0; p < sample_side; p++) {
            double samplex = (t + rng(gen)) / sample_side;
            double sampley = (p + rng(gen)) / sample_side;
            
            double theta = 0.5f * acos(1 - 2*samplex);
            double phi =  2 * M_PI * sampley;
            Vec3f wi = Vec3f(sin(theta) * cos(phi), sin(theta) * sin(phi), cos(theta));
            float pdf = wi.z / PI;
            
            samlpeList.directions.push_back(wi);
            samlpeList.PDFs.push_back(pdf);
        }
    }
    return samlpeList;
}

float DistributionGGX(Vec3f N, Vec3f H, float roughness)
{
    float a = roughness*roughness;
    float NdotH = max(dot(N, H), 0.0f);

    float nom   = a*a;
    float denom = (NdotH*NdotH * (a*a - 1.0) + 1.0);
    denom = PI * denom * denom;

    return nom / max(denom, 0.0001f);
}

float GeometrySchlickGGX(float NdotV, float roughness) {
    float k = (roughness * roughness) / 2.0f;
    return NdotV / (NdotV * (1.0f - k) + k);
}

float GeometrySmith(float roughness, float NoV, float NoL) {
    float ggx2 = GeometrySchlickGGX(NoV, roughness);
    float ggx1 = GeometrySchlickGGX(NoL, roughness);
    return ggx1 * ggx2;
}

Vec3f IntegrateBRDF(Vec3f V, float roughness, float NdotV) {
    const int sample_count = 1024;
    Vec3f N = Vec3f(0.0, 0.0, 1.0);
    Vec3f res = {0.0,0.0,0.0};
    samplePoints sampleList = squareToCosineHemisphere(sample_count);
    for (int i = 0; i < sample_count; i++) {

        Vec3f L = normalize(sampleList.directions[i]);
        Vec3f H = normalize(V + L);

        float NdotL = dot(N, L);    //采样入射光方向 i

        Vec3f F = {1.0, 1.0, 1.0};
        float D = DistributionGGX(N, H, roughness);
        float G = GeometrySmith(roughness, NdotV, NdotL);
        Vec3f brdf = F*D*G / (4 *NdotV*NdotL); 
        
        res += brdf * NdotL / sampleList.PDFs[i];
    }
    return res / sample_count;
}

int main() {
    uint8_t data[resolution * resolution * 3];
    float step = 1.0 / resolution;
    for (int i = 0; i < resolution; i++) {
        for (int j = 0; j < resolution; j++) {
            float roughness = step * (static_cast<float>(i) + 0.5f);
            float NdotV = step * (static_cast<float>(j) + 0.5f);
            Vec3f V = Vec3f(std::sqrt(1.f - NdotV * NdotV), 0.f, NdotV);

            Vec3f irr = IntegrateBRDF(V, roughness, NdotV);

            data[(i * resolution + j) * 3 + 0] = uint8_t(irr.x * 255.0);
            data[(i * resolution + j) * 3 + 1] = uint8_t(irr.y * 255.0);
            data[(i * resolution + j) * 3 + 2] = uint8_t(irr.z * 255.0);
        }
    }
    stbi_flip_vertically_on_write(true);
    stbi_write_png("GGX_E_MC_LUT.png", resolution, resolution, 3, data, resolution * 3);
    
    std::cout << "Finished precomputed!" << std::endl;
    return 0;
}