clc;
N0=4.1*(10^(-21));
M=2;
T=10;
fc=10;
A=2;
t=1:1:T;
m=1:1:M;
re=rectpuls((t-T/2),T);
re(1,T)=1;
g= (A.*(re)')'
%PAM modulation
Am=(2*m)-1-M;
Smp=(Am.*(g.* cos(2*pi*fc*t))')
Esavg=((((M^2)-1)*(A^2))/6);
SNR0=10*log10(Esavg/N0);
%Demodulation
r=awgn(Smp,SNR0);
%SER
An=(10^-10)*(1:100);
for i=1:length(An)
    SNR(i)=sqrt(((An(i)^2))/N0);
    SNR_db(i)=5*(log10((An(i)^2)/N0));
    SER=qfunc(SNR);
end;
%theoretical SER
SER_th=berawgn(SNR,'pam',2);
%plots
semilogy(SNR_db,SER,':r*',SNR_db,SER_th,':g*');
grid on;
xlabel('SNR in dB');
ylabel('SER');
title('practical and theoretical SER plots of binary PAM');

