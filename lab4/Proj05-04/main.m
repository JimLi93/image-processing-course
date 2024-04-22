clear;
close all;
original_image = imread('Fig0526(a)(original_DIP).tif');
input_f = im2single(original_image);

T=1;
a=0.1;
b=0.1;
[motionImage, H] = addMotionBlur(input_f, T, a, b);
motionImageInt = im2uint8(motionImage);
noiseImageInt = addGaussianNoise(motionImageInt,0,5);
noiseImageSingle = im2single(noiseImageInt);
output1 = wienerFiltering(noiseImageSingle, H, 0.1);
output2 = wienerFiltering(noiseImageSingle, H, 0.01);
output3 = wienerFiltering(noiseImageSingle, H, 0.001);

psnr1 = computePSNR(output1, input_f);
psnr2 = computePSNR(output2, input_f);
psnr3 = computePSNR(output3, input_f);
psnr4 = computePSNR(input_f, input_f);
psnr5 = computePSNR(motionImage, input_f);
psnr6 = computePSNR(noiseImageSingle, input_f);



subplot(2,3,1);imshow(input_f);title('original/psnr='+string(psnr4));
subplot(2,3,2);imshow(motionImage);title('motionImage/psnr='+string(psnr5));
subplot(2,3,3);imshow(noiseImageSingle);title('noiseImage/psnr='+string(psnr6));
subplot(2,3,4);imshow(output1);title('k=0.1/psnr='+string(psnr1));
subplot(2,3,5);imshow(output2);title('k=0.01/psnr='+string(psnr2));
subplot(2,3,6);imshow(output3);title('k=0.001/psnr='+string(psnr3));








