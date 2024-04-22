clear;
close all;
original_image = imread('Fig0526(a)(original_DIP).tif');
input_s = im2single(original_image);

[M,N] = size(input_s);
A = 0.5;
u0 = 0.3*M;
v0 = 0.3*N;


noiseImage = addSinNoise(input_s, A, u0, v0);
noiseImageFFT = fft2(noiseImage);

D0 = 200;
u0 = 0.15*M;
v0 = 0.15*N;

[finalOutput, Notch] = notchFiltering(noiseImage, D0, u0, v0);
notchFFT = noiseImageFFT.*Notch;

psnr1 = computePSNR(input_s, input_s);
psnr2 = computePSNR(noiseImage, input_s);
psnr3 = computePSNR(noiseImageFFT, input_s);
psnr4 = computePSNR(Notch, input_s);
psnr5 = computePSNR(notchFFT, input_s);
psnr6 = computePSNR(finalOutput, input_s);


subplot(2,3,1);imshow(input_s);title('original/psnr='+string(psnr1));
subplot(2,3,2);imshow(noiseImage);title('sinNoise/psnr='+string(psnr2));
subplot(2,3,3);imshow(abs(noiseImageFFT));title('sinNoise+fft/psnr='+string(psnr3));
subplot(2,3,4);imshow(Notch);title('notch/psnr='+string(psnr4));
subplot(2,3,5);imshow(abs(notchFFT));title('fft*notch/psnr='+string(psnr5));
subplot(2,3,6);imshow(finalOutput);title('final output/psnr='+string(psnr6));






