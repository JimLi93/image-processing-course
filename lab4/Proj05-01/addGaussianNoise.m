function output_s = addGaussianNoise(input_s, mu, sigma)

[M,N] = size(input_s);
gaussianNoise = mu + randn(M,N) * sigma;
output_s = im2uint8(mat2gray(single(input_s) + gaussianNoise));

