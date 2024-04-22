function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)


scaledLaplacian = single(laplacianMask * scale);
output_temp = spatialFiltering(input, scaledLaplacian);
output = input + output_temp;

