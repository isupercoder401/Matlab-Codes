ts=10^(-4);
t=-1:ts:1;
Ta=0.01;
m_sig1=triangle((t+0.1)/0.1)-triangle((t-0.1)/0.1);
figure(5);plot(t,m_sig1);

m_sig2=rect((t+0.1)/0.1)-rect((t-0.1)/0.1);
figure(6);plot(t,m_sig2);
Lm_sig=length(m_sig);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
freqm=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
M_sig1=fftshift(fft(m_sig1,Lfft));
M_sig2=fftshift(fft(m_sig2,Lfft));
%MODULATION
fc=300;
mod1=m_sig1.*cos(2*3.14*fc*t);
mod2=m_sig2.*sin(2*3.14*fc*t);
Mod1=fftshift(fft(mod1,Lfft));
Mod2=fftshift(fft(mod2,Lfft));
x=mod1+mod2;
figure(4);plot(t,x)
B_M=150;
F1=fir1(40,[300*ts]);
X=filter(F1,1,x);
figure(1);plot(t,X);
%Demodulation
demod1=X.*cos(2*3.14*fc*t);
demod2=X.*sin(2*3.14*fc*t);
Demod1=fftshift(fft(demod1,Lfft));
Demod2=fftshift(fft(demod2,Lfft));
F2=fir1(40,[B_M*ts]);
%recevied
rec1=filter(F2,1,demod1);
rec2=filter(F2,1,demod2);
Rec1=fftshift(fft(rec1,Lfft));
Rec2=fftshift(fft(rec2,Lfft));
figure(2);plot(t,rec1);
figure(3);plot(t,rec2);





