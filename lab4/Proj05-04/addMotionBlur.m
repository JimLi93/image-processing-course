function [output_f, H] = addMotionBlur(input_f, T, a, b)

[M,N] = size(input_f);
H = zeros(M,N,'single');

for u=1:M
    for v=1:N
        cal = (u-M/2-1)*a+(v-N/2-1)*b;
        if(cal==0)
            H(u,v) = T;
        else
            H(u,v) = T * sin(pi*(cal)) * exp(-1i*pi*(cal)) / pi / (cal);
        end
    end
end

temp1 = fftshift(fft2(input_f));
temp2 = temp1.*H;
output_f = abs(ifft2(ifftshift(temp2)));
