clear;
close all;
originalImage = imread('Fig0338(a)(blurry_moon).tif');
input = im2single(originalImage);

laplacianMask1 = [[0 1 0]; [1 -5 1] ;[0 1 0]];
laplacianMask2 = [[0 1 0]; [1 -4 1] ;[0 1 0]];
laplacianMask3 = [[1 1 1]; [1 -8 1] ;[1 1 1]];

laplacianMask1 = single(laplacianMask1);
laplacianMask2 = single(laplacianMask2);
laplacianMask3 = single(laplacianMask3);


[output1, scaledLaplacian1] = laplacianFiltering(input, laplacianMask2 , -1);
[output2, scaledLaplacian2] = laplacianFiltering(input, laplacianMask2 , -3);
[output3, scaledLaplacian3] = laplacianFiltering(input, laplacianMask2 , -5);

subplot(2,2,1);imshow(input);title('original');
subplot(2,2,2);imshow(output1);title('scale = -1');
subplot(2,2,3);imshow(output2);title('scale = -3');
subplot(2,2,4);imshow(output3);title('scale = -5');

%[output1, scaledLaplacian1] = laplacianFiltering(input, laplacianMask1 , 1);
%[output2, scaledLaplacian2] = laplacianFiltering(input, laplacianMask2 , -1);
%[output3, scaledLaplacian3] = laplacianFiltering(input, laplacianMask3 , 1);

%subplot(2,2,1);imshow(input);title('original');
%subplot(2,2,2);imshow(output1);title('1');
%subplot(2,2,3);imshow(output2);title('2');
%subplot(2,2,4);imshow(output3);title('3');


