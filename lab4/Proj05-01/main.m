clear;
close all;
input_s = imread('Fig0507(a)(ckt-board-orig).tif');


output1 = addGaussianNoise(input_s, 0, 20);
output2 = addImpulseNoise(input_s, 0, 0.1);
output3 = addImpulseNoise(input_s, 0.1, 0);
output4 = addImpulseNoise(input_s, 0.1, 0.1);

psnr1 = computePSNR(output1, input_s);
psnr2 = computePSNR(output2, input_s);
psnr3 = computePSNR(output3, input_s);
psnr4 = computePSNR(output4, input_s);

subplot(2,3,1);imshow(input_s);title('original');
subplot(2,3,2);imshow(output1);title('gaussian noise');
subplot(2,3,3);imshow(output2);title('salt&pepper(Pp=0.1)');
subplot(2,3,4);imshow(output3);title('salt&pepper(Ps=0.1)');
subplot(2,3,5);imshow(output4);title('salt&pepper(Pp=Ps=0.1)');




