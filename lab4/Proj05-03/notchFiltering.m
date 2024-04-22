function [output_s, Notch] = notchFiltering(input_f, D0, u0, v0)


[M,N] = size(input_f);

Notch = ones(M,N,'single');

for x=1:M
    for y=1:N
        D1 = sqrt((x-M/2-u0)*(x-M/2-u0)+(y-N/2-v0)*(y-N/2-v0));
        D2 = sqrt((x-M/2+u0)*(x-M/2+u0)+(y-N/2+v0)*(y-N/2+v0));
        if(D1<=D0)
            Notch(x,y) = 0;
        end
        if(D2<=D0)
            Notch(x,y) = 0;
        end
    end
end

F = fft2(input_f);
output_s = im2single(mat2gray(abs(ifft2(Notch .* F))));
