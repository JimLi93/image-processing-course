clear;
close all;
originalImage = imread('Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif');
scalingFactor = input('');
resizedImage = resizedImage_replication(originalImage,scalingFactor);
comparedImage = resizedImage_replication(resizedImage,1/scalingFactor);

  
subplot(1,3,1);imshow(originalImage);title('original');
subplot(1,3,2);imshow(resizedImage);title('resized');
subplot(1,3,3);imshow(comparedImage);title('compared');

