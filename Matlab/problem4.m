Ts=1/64;
T0=4;
N0=T0/Ts;
t=[0:Ts:Ts*(N0-1)];
y=exp(-2*t).*(ustep(t));

D0=0.5*Ts;%discontinuity
D1=y*Ts;
D=[D0,D1];
G1=fft(D);
[gp, gn]=cart2pol(real(G1),imag(G1));
K=0:N0-1;
w=2*3.14*K/T0;
figure(1);plot(t,y);

figure(3);stem(w(1:32),gn(1:32));
j=sqrt(-1);
d=1./(j*w+2);
[ga,gb]=cart2pol(real(d),imag(d));
figure(2);stem(w(1:32),gp(1:32));
hold on
plot(w(1:32),ga(1:32));