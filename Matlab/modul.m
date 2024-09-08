ts=10^(-4);
t=-0.04:ts:0.04;
Ta=0.01;
m_sig=triangle((t+0.01)/0.01)-triangle((t-0.01)/0.01);
Lm_sig=length(m_sig);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
M_sig=fftshift(fft(m_sig,Lfft));
freqm=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
B_m=150;
h=fir1(40,[B_m*ts]);
fc=30;
s_dsb=m_sig.*cos(2*pi*fc*t);
Lfft=length(t);
Lfft=2^ceil(log2(Lfft)+1);
S_dsb=fftshift(fft(s_dsb,Lfft));
freqs=(-Lfft/2:Lfft/2-1)/(Lfft*ts);
s_dem=s_dsb.*cos(2*pi*fc*t)*2;
S_dem=fftshift(fft(s_dem,Lfft));
s_rec=filter(h,1,s_dem);
S_rec=fftshift(fft(s_rec,Lfft));
Trange=[-0.025 0.025 -2 2];
Frange=[-700 700 0 200];
figure(1)
subplot(221); plot(t,m_sig)
axis(Trange) % set x-axis and y-axis limits 
title('m\_sig')

subplot(222); plot(t,s_dsb)
axis(Trange)
title('s\_dsb')

subplot(223); plot(t, s_dem)
axis(Trange) % set x-axis and y-axis limits 
title('s\_dem')

subplot(224); plot(t,s_rec)
axis(Trange)
title('s\_rec')


figure(2)
subplot(221); plot(freqm,abs(M_sig))
axis(Frange) % set x-axis and y-axis limits 
title('M\_sig')

subplot(222); plot(freqs,abs(S_dsb))
axis(Frange)
title('S\_dsb')

subplot(223); plot(freqs, abs(S_dem))
axis(Frange) % set x-axis and y-axis limits 
title('S\_dem')

subplot(224); plot(freqs,abs(S_rec))
axis(Frange)
title('S\_rec')