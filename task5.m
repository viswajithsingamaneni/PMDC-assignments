%SER for binary pam in terms of SNR per bit
%for 2-PAM
N0=4.1e-21;
Am=(1e-10)*[1:30];
for i=1:length(Am)
SNR(i)= sqrt(2*(Am(i)^2)/N0);
SNR_db(i)=10*log10(log2(1)*((Am(i)^2)/N0));
end;
Pser=qfunc(SNR); %Theoretical result
[BER,SER]= berawgn(SNR,'pam',2); %MATLAB result
x = SER;
x0 = BER;
x1 = SNR_db;
figure(6)
semilogy(x1,x0,'b-o');
grid on;
%for 4-pam
for i=1:length(Am)
SNR(i)= sqrt((4/5)*(Am(i)^2)/N0);
SNR_db(i)=10*log10(2*log2(2)*((Am(i)^2)/N0));
end;
Pser=(3/2)*qfunc(SNR); %Theoretical
[BER,SER]=berawgn(SNR,'pam',4); %Using MATLAB
y=SER;
y0 = BER;
y1 = SNR_db;
hold on;
semilogy(y1,y0,'r-o');
grid on;
hold on;
%for 4-Qam
for i=1:length(Am)
SNR(i)= sqrt(((Am(i)^2)/N0));
SNR_db(i)=10*log10((Am(i)^2)*log2(2)/N0);
end;
Pser=(2*qfunc(SNR)).*(1-(0.5*qfunc(SNR)));%Theoritical result
[BER,SER]=berawgn(SNR,'qam',4); %MATLAB output
z = SER;
z0 = BER;
z1 = SNR_db;
semilogy(z1,z0,'m-o');
legend('2-PAM','4-PAM','4-QAM'); %axis([1 30 10^-6 1])
xlabel('SNR per Bit');
ylabel('BER');