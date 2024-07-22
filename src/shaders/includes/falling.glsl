 float fallingProgress = remap(progress, 0.1, 1.0, 0.0, 1.0);
     fallingProgress = clamp(fallingProgress, 0.0, 1.0);
     fallingProgress = 1.0 - pow(1.0 - fallingProgress, 3.0);
     newPosition.y -= fallingProgress * .2;