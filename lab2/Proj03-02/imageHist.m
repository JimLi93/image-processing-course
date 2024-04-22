function histVector = imageHist(input)
histVector = single(0:255);

for k=1:256
    histVector(k) = 0;
end

[M,N] = size(input);
for x=1:M
    for y=1:N
        if(input(x,y) == 255)
            histVector(256) = histVector(256) + 1;
        else 
            index = input(x,y) + 1;
            histVector(index) = histVector(index) + 1;
        end
    end
end


