function psnr = computePSNR(input1_s, input2_s)


[M,N] = size(input1_s);

sum = 0;
for x=1:M
    for y=1:N
        sum = sum + power(abs(input1_s(x,y) - input2_s(x,y)),2);
    end
end

psnr = 10*log10(M*N/sum);

