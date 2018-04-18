clc;
N0=4.1*(10^(-21));
M1=2;
%SER
An=(10^-10)*(1:100);
x1=(6*log2(M1))/((M1^2)-1);
y1=2*(1-(1/M1));
for i=1:length(An)
    q1(i)=sqrt(x1*((An(i)^2)/N0));
    SNR_db1(i)=10*(log10((An(i)^2)/N0));
end;
SER1=y1*qfunc(q1);
%theoretical SER
SER_th1=berawgn(q1,'pam',2);

M2=4;
%SER
An=(10^-10)*(1:100);
x2=(6*log2(M2))/((M2^2)-1);
y2=2*(1-(1/M2));
for i=1:length(An)
    q2(i)=sqrt(x2*((An(i)^2)/N0));
    SNR_db2(i)=10*(log10((An(i)^2)/N0));
end;
SER2=y2*qfunc(q2);
%theoretical SER
SER_th2=berawgn(q2,'pam',4);

M3=4;
%SER
An=(10^-10)*(1:100);
x3=(3*log2(M3))/((M3^2)-1);
y3=(1-(1/sqrt(M3)));
for i=1:length(An)
    q3(i)=sqrt(x3*((An(i)^2)/N0));
    SNR_db3(i)=10*(log10((An(i)^2)/N0));
end;
SER3=4*y3*qfunc(q3).*((1-(y3*qfunc(q3))));
%theoretical SER
SER_th3=berawgn(q3,'qam',4);
%plots
semilogy(SNR_db1,SER1,'g-o',SNR_db2,SER2,':r*',SNR_db3,SER3,':g*');
grid on;
xlabel('SNR in dB');
ylabel('SER');
title('simulated SER plots of binary PAM, 4-PAM, 4-QAM');

semilogy(SNR_db1,SER_th1,'g-o',SNR_db2,SER_th2,':r*',SNR_db3,SER_th3,':g*');