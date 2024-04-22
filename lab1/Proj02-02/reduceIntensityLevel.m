function [quantizedImage] = reduceIntensityLevel(originalImage, intensityLevel)

[M,N] = size(originalImage);
quantizedImage = zeros(M,N, 'uint8');

length = 256 / intensityLevel;

for x = 1:M
    for y = 1:N
        num = floor(double(originalImage(x,y)) / length);
        quantizedImage(x,y) = num * round(255 / (intensityLevel - 1));
    end
end
end
