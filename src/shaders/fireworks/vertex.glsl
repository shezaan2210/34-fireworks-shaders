uniform float uSize;
uniform vec2 uResolution;
uniform float uProgress;

attribute float aSize;
attribute float aTime;

#include ../includes/remap.glsl

void main () {

    vec3 newPosition = position;
    float progress = uProgress * aTime;

    // exploding
   #include ../includes/exploding.glsl

     // falling
    #include ../includes/falling.glsl

     // scaling
     #include ../includes/scaling.glsl

     // twinkling
    #include ../includes/twinkling.glsl

    vec4 modelPosition = modelMatrix * vec4(newPosition , 1.0);
    vec4 viewPosition = viewMatrix * modelPosition;

    gl_Position = projectionMatrix * viewPosition;

    gl_PointSize = uSize * uResolution.y * aSize * sizeProgress * sizeTwinkling;
    gl_PointSize *= 1.0  / - viewPosition.z;

    if(gl_PointSize < 1.0)
        gl_Position = vec4(9999.9);
}