ts=1.e-4;
t=-0.04:ts:0.04;
m_sig=triangle((t+0.01)/0.01)-triangle((t-0.01)/0.01);
lfft=length(t);
lfft=2^ceil(log2(lfft));
M_sig=fftshift(fft(lfft));
freqm=[-lfft/2:lfft/2-1]/(lfft*ts);
figure(1);plot(t,m_sig);title('Original');
figure(2);plot(freqm,abs(M_sig));
kf=160*pi;
mint=kf*ts*cumsum(m_sig);
fm=cos(2*pi*300*t+mint);
figure(3);plot(t,fm);title('FM MODULATED');
FM=fftshift(fft(fm,lfft));
figure(4);plot(freqm,abs(FM));title('FFT OF FM');
pm=cos(2*pi*300*t+pi.*m_sig);
figure(5);plot(t,pm);title('PM');
PM=fftshift(fft(pm,lfft));
figure(6);plot(freqm,abs(PM));title('FFT OF PM');

%demodulatiom
fdem=diff([fm(1) fm])/(ts/kf);
figure(7);plot(t,fdem);title('FM DEMODULATED');
Fdem=fftshift(fft(fdem,lfft));
figure(8);plot(freqm,abs(Fdem));title('FFT OF Diffrentiated');

fmrec=fdem.*(fdem>0);
figure(9);plot(t,fmrec);title('RECTIFIED');
Frec=fftshift(fft(fmrec,lfft));
figure(10);plot(freqm,abs(Frec));title('FFT OF Rectified');

h=fir1(80,[100*ts]);
srec=filter(h,1,fmrec);
figure(11);plot(t,srec);title('Recieved');
