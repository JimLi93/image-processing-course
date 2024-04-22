function resizedImage = resizedImage_bilinear(originalImage, scalingFactor)

[M,N] = size(originalImage);
resizedImage = zeros(round(M*scalingFactor),round(N*scalingFactor), 'uint8');

if scalingFactor <1
   for x=1:round(M*scalingFactor)
        for y=1:round(N*scalingFactor)
            newx = 1 + floor((x-1) * (M - 1) / (round(M*scalingFactor) - 1));
            newy = 1 + floor((y-1) * (N - 1) / (round(N*scalingFactor) - 1));
            resizedImage(x, y) = originalImage(newx, newy);
        end
   end
else 
    for x=1:M
        for y=1:N
            tempX = 1 + floor((x-1) * (M*scalingFactor - 1) / (M - 1));
            tempY = 1 + floor((y-1) * (N*scalingFactor - 1) / (N - 1));
            resizedImage(tempX, tempY) = originalImage(x, y);
        end
    end
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
            elseif x2 > M
                z11 = originalImage(x1, y1);
                z12 = originalImage(x1, y2);
                resizedImage(x,y) = z11 + (z12 - z11) * (y - newy1) / (newy2 - newy1);
            elseif y2 > N
                z11 = originalImage(x1, y1);
                z21 = originalImage(x2, y1);
                resizedImage(x,y) = z11 + (z21 - z11) * (x - newx1) / (newx2 - newx1);
            else
                z11 = originalImage(x1, y1);
                z12 = originalImage(x1, y2);
                z21 = originalImage(x2, y1);
                z22 = originalImage(x2, y2);
                num = (newx2 - newx1) * (newy2 - newy1);
                q11 = double(double(newx2 - x) * double(newy2 - y) * double(z11)) /num;
                q12 = double(double(newx2 - x) * double(y - newy1) * double(z12)) /num;
                q21 = double(double(x - newx1) * double(newy2 - y) * double(z21)) /num;
                q22 = double(double(x - newx1) * double(y - newy1) * double(z22)) /num;
                
                resizedImage(x,y) = floor(q11 + q12 + q21 + q22);
            end
        end
    end
end





end
