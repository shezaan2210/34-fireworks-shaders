float sizeOpening = remap(progress, 0.0, 0.125, 0.0, 1.0);
     float sizeClosing = remap(progress, 0.125, 1.0, 1.0, 0.0);
     float sizeProgress = min(sizeOpening, sizeClosing);
     sizeProgress = clamp(sizeProgress, 0.0, 1.0);