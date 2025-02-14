ts=1.e-4;
t=-2:ts:2;
m1=triangle(t);
m2=rect(t);
lfft=length(t);
lff=2^ceil(log2(lfft));
freqm=[-lfft/2:lfft/2-1]/(lfft*ts);
B_m=150;
h=fir1(40,[B_m*ts]);
%modulation
fc=300;
mod1=m1.*cos(2*3.14*fc*t);
mod2=m2.*sin(2*3.14*fc*t);
%demodulation
demod1=mod1.*(2*cos(2*3.14*fc*t));
demod2=mod2.*(2*sin(2*3.14*fc*t));
%filtering
rec1=filter(h,1,demod1);
rec2=filter(h,1,demod2);
figure(1);plot(t,rec1);title('Orignal 1');
figure(2);plot(t,rec2);title('orignal 2');

