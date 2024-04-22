function psnr = computePSNR(input1_s, input2_s)


[M,N] = size(input1_s);

newInput1 = im2single(mat2gray(abs(input1_s)));
newInput2 = im2single(mat2gray(abs(input2_s)));

sum = 0;
for x=1:M
    for y=1:N
        sum = sum + power(newInput1(x,y) - newInput2(x,y),2);
    end
end

psnr = 10*log10(M*N/sum);

