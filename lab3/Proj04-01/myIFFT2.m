function output = myIFFT2(input)[M,N] = size(input);M1=zeros(M,M);M2=zeros(N,N);for u=1:M    for x=1:M       M1(u,x) = exp(sqrt(-1)*2*pi*((u-1)*(x-1)/M));    endendfor v=1:N    for y=1:N       M2(v,y) = exp(sqrt(-1)*2*pi*((v-1)*(y-1)/N));    endendoutput = M1*input*M2/M/N;