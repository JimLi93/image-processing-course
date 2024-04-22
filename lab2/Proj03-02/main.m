clear;
close all;
input = imread('Fig0308(a)(fractured_spine).tif');
histVector = imageHist(input);
[output, T] = histEqualization(input);


x = single(0:255);
hih = imageHist(output);

subplot(2,3,1);imshow(input);
subplot(2,3,4);bar(x,histVector);
subplot(2,3,2);imshow(output);
subplot(2,3,5);bar(x,hih);
subplot(2,3,3);stairs(x,T);