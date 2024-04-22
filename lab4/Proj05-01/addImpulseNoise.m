function output_s = addImpulseNoise(input_s, Ps, Pp)


[M,N] = size(input_s);

salt = int32(M*N*Ps);
pepper = int32(M*N*Pp);

saltAndPepper = zeros(M*N,1,'uint8');
for x=1:salt
    saltAndPepper(x) = 1;
end
for y=salt+1:salt+pepper
    saltAndPepper(y) = 2;
end

saltAndPepper = saltAndPepper(randperm(length(saltAndPepper)));

output_s = input_s;
for i=1:M
    for j=1:N
        if(saltAndPepper((i-1)*N+j) == 1)
            output_s(i,j) = 255;
        end
        if(saltAndPepper((i-1)*N+j) == 2)
            output_s(i,j) = 0;
        end
    end
end


