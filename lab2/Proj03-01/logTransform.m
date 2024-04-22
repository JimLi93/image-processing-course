function output = logTransform(input, c)

[M,N] = size(input);
output = zeros(M,N, 'single');
for x=1:M
    for y=1:N
        output(x,y) = c * log(input(x,y)+1);
    end
end


