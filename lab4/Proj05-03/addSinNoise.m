function output_s = addSinNoise(input_s, A, u0, v0)

[M,N] = size(input_s);
sinNoise = zeros(M,N,'single');

for x=1:M
    for y=1:N
        sinNoise(x,y) = A * sin(2*pi*((u0*x/M)+(v0*y/N)));
    end
end

output_s = im2single(mat2gray(input_s + sinNoise));

