clear;close all;inputImage = imread('Fig0441(a)(characters_test_pattern).tif');[M, N] = size(inputImage);f=zeros(M,N);ff=fft2(inputImage);m=M/2;n=N/2;for x=1:m    for y=1:n        f(x,y) = ff(x+m,y+n);    endendfor x=m+1:M    for y=n+1:N        f(x,y) = ff(x-m,y-n);    endendfor x=m+1:M    for y=1:n        f(x,y) = ff(x-m,y+n);    endendfor x=1:m    for y=n+1:N        f(x,y) = ff(x+m,y-n);    endendfl=log(1+abs(f));average_from_ff00 = ff(1,1) / M / N; sum=double(0);for i=1:M    for j=1:N        sum = sum + abs(double(inputImage(i,j)));    endendsum = sum / M / N;subplot(1,2,1), imshow(inputImage);subplot(1,2,2), imshow(abs(fl),[]);