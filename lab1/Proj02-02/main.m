clear;
close all;
originalImage = imread('Fig0221(a)(ctskull-256).tif');
intensityLevel = input('');
quantizedImage = reduceIntensityLevel(originalImage, intensityLevel);

subplot(1,2,1);imshow(originalImage);title('original');
subplot(1,2,2);imshow(quantizedImage);title('quantized');
