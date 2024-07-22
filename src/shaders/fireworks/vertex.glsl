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
    float explodingProgress = remap(progress, 0.0, 0.1, 0.0, 1.0);
    explodingProgress = clamp(explodingProgress, 0.0, 1.0);
    explodingProgress = 1.0 - pow(1.0 - explodingProgress, 3.0);
    newPosition *= explodingProgress;

     // falling
     float fallingProgress = remap(progress, 0.1, 1.0, 0.0, 1.0);
     fallingProgress = clamp(fallingProgress, 0.0, 1.0);
     fallingProgress = 1.0 - pow(1.0 - fallingProgress, 3.0);
     newPosition.y -= fallingProgress * .2;

     // scaling
     float sizeOpening = remap(progress, 0.0, 0.125, 0.0, 1.0);
     float sizeClosing = remap(progress, 0.125, 1.0, 1.0, 0.0);
     float sizeProgress = min(sizeOpening, sizeClosing);
     sizeProgress = clamp(sizeProgress, 0.0, 1.0);

     // twinkling
     float twinkling = remap(progress, 0.2, 0.8, 0.0, 1.0);
     twinkling = clamp(twinkling, 0.0, 1.0);
     float sizeTwinkling = sin(progress * 30.0) * .5 + .5;
     sizeTwinkling = 1.0 - sizeTwinkling * twinkling;

    vec4 modelPosition = modelMatrix * vec4(newPosition , 1.0);
    vec4 viewPosition = viewMatrix * modelPosition;

    gl_Position = projectionMatrix * viewPosition;

    gl_PointSize = uSize * uResolution.y * aSize * sizeProgress * sizeTwinkling;
    gl_PointSize *= 1.0  / - viewPosition.z;

    if(gl_PointSize < 1.0)
        gl_Position = vec4(9999.9);
}