ts=1.e-4;
t=-0.04:ts:0.04;
g=triangle((t+0.01)/0.01)-triangle((t-0.01)/0.01);
plot(t,g);
lfft=length(t);
lfft=2^ceil(log2(lfft));
G=fftshift(fft(g,lfft));
freqm=(-lfft/2:lfft/2-1)/(lfft*ts);
figure(2);plot(freqm,abs(G));title('Fourier of Orignal');
fc=500;
%modulation
m_sig=(1+g).*cos(2*3.14*fc*t);
M_sig=fftshift(fft(m_sig,lfft));
figure(3);plot(t,m_sig);title('Modulated');
figure(4);plot(freqm,abs(M_sig));title('FFT OF MODULATED');
B=150;
h=fir1(40,[B*ts]);
%demodulation
dem=m_sig.*(m_sig>0);
figure(6);plot(t,dem);
Dem=fftshift(fft(dem,lfft));
%filtering;
rec=filter(h,1,dem);
figure(5);plot(t,rec);title('Recieved');


