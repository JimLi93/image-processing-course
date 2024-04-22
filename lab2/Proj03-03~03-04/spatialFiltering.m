function output = spatialFiltering(input,mask)
newMask = rot90(rot90(mask));
[M,N] = size(input);
output = zeros(M,N,'single');
[m,n] = size(newMask);
newImage = zeros(M+m-1, N+n-1,'single');

for x=(m+1)/2:M+(m-1)/2
    for y=(n+1)/2:N+(n-1)/2
        newImage(x,y) = input(x-((m-1)/2), y-((n-1)/2));
    end
end


sum = 0;
for x=(m+1)/2:M+(m-1)/2
    for y=(n+1)/2:N+(n-1)/2
        for i=-(m-1)/2:(m-1)/2
            for j=-(n-1)/2:(n-1)/2
                sum = sum + newImage(x+i,y+j) * newMask(i+(m+1)/2, j+ (n+1)/2);
            end
        end
        output(x-((m-1)/2), y-((n-1)/2)) = sum;
        sum = 0;
    end
end


