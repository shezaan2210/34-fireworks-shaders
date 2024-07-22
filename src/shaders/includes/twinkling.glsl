 float twinkling = remap(progress, 0.2, 0.8, 0.0, 1.0);
     twinkling = clamp(twinkling, 0.0, 1.0);
     float sizeTwinkling = sin(progress * 30.0) * .5 + .5;
     sizeTwinkling = 1.0 - sizeTwinkling * twinkling;