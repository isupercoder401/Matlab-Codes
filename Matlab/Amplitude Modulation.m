t=[-0.5:0.0001:0.5];
m=triangle((t-0.02)/0.02)+rect((t+0.02)/0.02);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
M=fftshift(fft(m,Lfft));
freqm=(-Lfft/2:Lfft/2-1)*(Lfft*0.0001);
figure(4);plot(freqm,abs(M));title('Message Sigal');
B_m=150;
h=fir1(40,[B_m*0.0001]);
%modulation
fc=30;
s_m=(1+m).*cos(2*3.14*30*t);
S_m=fftshift(fft(s_m,Lfft));
figure(1);
subplot(221);
plot(freqm,abs(S_m));
title('Transformed Modulated Signal');
subplot(222);
plot(t,s_m);

%demodulation
s_dem=s_m.*(s_m>0);
S_dem=fftshift(fft(s_dem,Lfft));
figure(2);plot(freqm,abs(S_dem));
s_rec=filter(h,1,s_dem);
S_rec=fftshift(fft(s_rec,Lfft));
figure(3);plot(freqm,abs(S_rec));




