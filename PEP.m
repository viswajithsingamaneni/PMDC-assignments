clc;
SNR=0:0.1:10;
h1=randn(1)+1i*randn(1);
h2=randn(1)+1i*randn(1);
x=sqrt(2*SNR*(((abs(h1))^2) + ((abs(h2))^2)));
ipep=qfunc(x);
tpep=0.5* ((rdivide(1,(1+SNR))).^2);

subplot(1,2,1)
semilogy(SNR,tpep);

subplot(1,2,2)
semilogy(SNR,ipep);