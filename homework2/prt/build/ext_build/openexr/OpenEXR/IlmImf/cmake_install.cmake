# Install script for directory: /home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/haoyan/GAMES202/homework2/prt/build/ext_build/openexr/OpenEXR/IlmImf/libIlmImf.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenEXR" TYPE FILE FILES
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfForward.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfExport.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfBoxAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfCRgbaFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfChannelList.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfChannelListAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompressionAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDoubleAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfFloatAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfFrameBuffer.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfHeader.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfIO.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfInputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfIntAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfLineOrderAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMatrixAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfOpaqueAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfOutputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgbaFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfStringAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfVecAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfHuf.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfWav.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfLut.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfArray.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompression.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfLineOrder.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfName.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPixelType.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfVersion.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfXdr.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfConvert.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPreviewImage.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPreviewImageAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfChromaticities.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfChromaticitiesAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfKeyCode.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfKeyCodeAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTimeCode.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTimeCodeAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRational.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRationalAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfFramesPerSecond.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfStandardAttributes.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfEnvmap.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfEnvmapAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfInt64.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgba.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTileDescription.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTileDescriptionAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledInputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledOutputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledRgbaFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgbaYca.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTestFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfThreading.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfB44Compressor.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfStringVectorAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiView.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfAcesFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiPartOutputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfGenericOutputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiPartInputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfGenericInputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPartType.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPartHelper.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfOutputPart.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledOutputPart.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfInputPart.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledInputPart.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineOutputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineOutputPart.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineInputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineInputPart.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledInputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledInputPart.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledOutputFile.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledOutputPart.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepFrameBuffer.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepCompositing.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompositeDeepScanLine.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfNamespace.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMisc.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepImageState.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepImageStateAttribute.h"
    "/home/haoyan/GAMES202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfFloatVectorAttribute.h"
    )
endif()

