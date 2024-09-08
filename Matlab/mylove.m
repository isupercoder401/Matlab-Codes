t=[-0.04:0.0001:0.04];
Ta=0.01;
m_sig=sinc(2*(t/Ta))+sinc(2*(t/Ta)-1)+sinc(2*(t/Ta)-1);

plot(t,m_sig);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
M=fftshift(fft(m_sig,Lfft));
w=(-Lfft/2:Lfft/2-1)/(Lfft*0.0001);
h=fir1(40,[150*0.0001]);
%Modulation
mod=(1+m_sig).*cos(2*3.14*300*t);
Mod=fftshift(fft(mod,Lfft));
%demodulation
dem=mod.*cos(2*3.14*300*t);
Dem=fftshift(fft(dem,Lfft));
%applying Filter
 s_rec=filter(h,1,dem);
 S_rec=fftshift(fft(s_rec,Lfft));
 figure(1);subplot(221);plot(t,m_sig);title('Original');
 subplot(222);plot(w,abs(M));title('FF Of Original');
 subplot(223);plot(t,mod);title('Modulated');
 subplot(224);plot(w,abs(Mod));title('FF of modulated');
 figure(2);
 subplot(221);plot(t,dem);title('demodulated');
 subplot(222);plot(w,abs(Dem));title('FF OF DEMODULATED');
 subplot(223);plot(t,s_rec);title('Filtered');
 subplot(224);plot(w,abs(S_rec));title('FF of Filtered');
 



