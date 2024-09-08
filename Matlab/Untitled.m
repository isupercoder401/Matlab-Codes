ts=1.e-4;
Ta=0.01;
t=-0.04:ts:0.04;
m_sig=triangle((t+0.01)/0.01)-triangle((t-0.01)/0.01);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
M_sig=fftshift(fft(m_sig,Lfft));
freqm=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
fc=500;
b_m=150;
h=fir1(40,[b_m*ts]);

s_sig=(1+m_sig).*cos(2*pi*fc*t);
S_sig=fftshift(fft(s_sig,Lfft));

d_sig=s_sig.*(s_sig>0);
D_sig=fftshift(fft(d_sig,Lfft));
s_rec=filter(h,1,d_sig);
S_rec=fftshift(fft(s_rec,Lfft));

figure(1);subplot(221);plot(t,m_sig);
subplot(222);plot(freqm, abs(M_sig));
subplot(223);plot(t,s_sig);
subplot(224);plot(freqm,abs(S_sig));

figure(2);subplot(221);plot(t,d_sig);
subplot(222);plot(freqm,abs(D_sig));
subplot(223);plot(t,s_rec);
title('filtered')
subplot(224);plot(freqm,abs(S_rec));
