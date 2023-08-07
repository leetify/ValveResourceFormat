#version 460

#include "common/animation.glsl"

in vec3 vPOSITION;
in vec2 vTEXCOORD;

out vec2 vTexCoordOut;
out vec4 vTexCoordOut;

#include "common/ViewConstants.glsl"
uniform mat4 transform;

void main(void) {
    vTexCoordOut = vTEXCOORD;
    mat4 skinTransform = transform * getSkinMatrix();
    vec4 fragPosition = skinTransform * vec4(vPOSITION, 1.0);
    gl_Position = g_matViewToProjection * fragPosition;
}
