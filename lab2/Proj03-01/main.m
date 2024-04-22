clear;
close all;
originalImage = imread('Fig0308(a)(fractured_spine).tif');
type = input('1 for logTransform, else powerlawTransform\n');
c= input('');
inputImage = im2single(originalImage);
i=1;
if(type==1) 
    output = logTransform(inputImage, c);
    subplot(1,2,1);imshow(originalImage);title('original');
    subplot(1,2,2);imshow(output);title('logTransform');
else 
    subplot(2,3,1);imshow(originalImage);title('original');
    r = single(0.3);
    output = powerlawTransform(inputImage, c, r);
    subplot(2,3,2);imshow(output);title('r=0.3');
    r = single(0.4);
    output = powerlawTransform(inputImage, c, r);
    subplot(2,3,3);imshow(output);title('r=0.4');
    r = single(0.6);
    output = powerlawTransform(inputImage, c, r);
    subplot(2,3,4);imshow(output);title('r=0.6');
    r = single(1.2);
    output = powerlawTransform(inputImage, c, r);
    subplot(2,3,5);imshow(output);title('r=1.2');
    r = single(1.5);
    output = powerlawTransform(inputImage, c, r);
    subplot(2,3,6);imshow(output);title('r=1.5');
end



