function resizedImage = resizedImage_replication(originalImage, scalingFactor)

[M,N] = size(originalImage);
tempImage = zeros(M,round(N*scalingFactor), 'uint8');
resizedImage = zeros(round(M*scalingFactor),round(N*scalingFactor), 'uint8');

if scalingFactor <1
    for x=1:M
        for y=1:round(N*scalingFactor)
            if y/scalingFactor > N
                tempImage(x,y)=originalImage(x,N);
            else
                tempImage(x,y)=originalImage(x,y/scalingFactor);
            end
        end
    end
    for x=1:round(M*scalingFactor) 
        for y=1:round(N*scalingFactor)
            if x/scalingFactor > M
                resizedImage(x,y)=tempImage(M,y);
            else
                resizedImage(x,y)=tempImage(x/scalingFactor,y);
            end
        end
    end
else 
    for x=1:round(M*scalingFactor)
        for y=1:round(N*scalingFactor)
            x1 = 1 + floor((x-1) * (M - 1) / (M*scalingFactor - 1));
            x2 = 1 + x1;
            y1 = 1 + floor((y-1) * (N - 1) / (N*scalingFactor - 1));
            y2 = 1 + y1;
            newx1 = 1 + floor((x1-1) * (M*scalingFactor - 1) / (M - 1));
            newx2 = 1 + floor((x2-1) * (M*scalingFactor - 1) / (M - 1));
            newy1 = 1 + floor((y1-1) * (N*scalingFactor - 1) / (N - 1));
            newy2 = 1 + floor((y2-1) * (N*scalingFactor - 1) / (N - 1));
           
            if(x2 > M && y2 > N)
                resizedImage(x,y) = originalImage(x1, y1);
            elseif x2 > M
                if((newy2 - y) - (y - newy1) > 0) 
                    resizedImage(x,y) = originalImage(x1, y1);
                else 
                    resizedImage(x,y) = originalImage(x1, y2);
                end
            elseif y2 > N
                if((newx2 - x) - (x - newx1) > 0) 
                    resizedImage(x,y) = originalImage(x1, y1);
                else 
                    resizedImage(x,y) = originalImage(x2, y1);
                end
            else
                d11 = (x - newx1) * (x - newx1) + (y - newy1) * (y - newy1);
                d12 = (x - newx1) * (x - newx1) + (newy2 - y) * (newy2 - y);
                d21 = (newx2 - x) * (newx2 - x) + (y - newy1) * (y - newy1);
                d22 = (newx2 - x) * (newx2 - x) + (newy2 - y) * (newy2 - y);
                
                if(d11 <= d12 && d11 <= d21 && d11 <= d22)
                    resizedImage(x,y) = originalImage(x1, y1);
                elseif(d12 <= d11 && d12 <= d21 && d12 <= d22)
                    resizedImage(x,y) = originalImage(x1, y2);
                elseif(d21 <= d11 && d21 <= d12 && d21 <= d22)
                    resizedImage(x,y) = originalImage(x2, y1);
                else
                    resizedImage(x,y) = originalImage(x2, y2);
                end
             end
        end
    end
end





end
