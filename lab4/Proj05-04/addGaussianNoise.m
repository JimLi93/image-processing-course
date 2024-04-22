function output_s = addGaussianNoise(input_s, mu, sigma)

[M,N] = size(input_s);

gaussianNoise = mu + randn(M,N) * sigma;

tempCombine = single(input_s) + gaussianNoise;

max = tempCombine(1,1);
min = tempCombine(1,1);
for x=1:M
    for y=1:N
        if(tempCombine(x,y)>max)
            max = tempCombine(x,y);
        end
        if(tempCombine(x,y)<min)
            min = tempCombine(x,y);
        end
    end
end

tempCombine = (tempCombine-min) * 255 / (max - min);
output_s = uint8(round(tempCombine));

