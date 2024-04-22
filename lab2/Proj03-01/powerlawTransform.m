function output = powerlawTransform(input, c, r)

[M,N] = size(input);
output = zeros(M,N, 'single');
for x=1:M
    for y=1:N
        output(x,y) = c * power(input(x,y), r);
    end
end
