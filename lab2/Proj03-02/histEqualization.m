function [output, T] = histEqualization(input)

[M,N] = size(input);
hist_org = imageHist(input);
hist_prob = hist_org /(M*N);
hist_cum = double(0:255);

for i=1:256
    hist_cum(i) = 0;
end

hist_cum(1) = hist_prob(1);
for j=2:256
    hist_cum(j) = hist_cum(j-1) + hist_prob(j);
end

T = uint8(round(hist_cum*255));

output = zeros(M, N, 'uint8');
for x=1:M
    for y=1:N
        index = double(input(x,y)) + 1;
        output(x,y) = T(index);
    end
end
