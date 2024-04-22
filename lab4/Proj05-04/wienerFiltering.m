function output_f = wienerFiltering(input_f, H, K)


[M,N] = size(input_f);

newH = ones(M,N,'single');

for u=1:M
    for v=1:N
        powerH = abs(H(u,v))*abs(H(u,v));
        newH(u,v) = ((powerH/(powerH+K))) / H(u,v);
         if(H(u,v)==0)
            newH(u,v) = 1;
         end
    end
end

temp1 = fftshift(fft2(input_f));
temp2 = newH.*temp1;
output_f = abs(ifft2(ifftshift(temp2)));
output_f(output_f>1) = 1;
output_f(output_f<0) = 0;

% output_f = im2single(mat2gray(abs(ifft2(ifftshift(temp2)))));