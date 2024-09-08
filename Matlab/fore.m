Ts=1/64 ;
T0=4;
N0=T0/Ts;
t=[0:Ts:Ts*(N0-1)];
g=exp(-2*t).*ustep(t);
figure(1);plot(t,g);
g1=0.5*Ts;
g2=g*Ts;
G=[g1 g2];
G0=fft(G);
Gf=ifft(G0);
[Gp,Gm]=cart2pol(real(G0),imag(G0));
k=0:N0-1;
w=2*pi*(k/T0);

j=sqrt(-1);
Gw=1./((w*j)+2);
[Ge ,Gh]=cart2pol(real(Gw),imag(Gw));
figure(2);stem(w(1:32),Gp(1:32));
hold on
plot(w(1:32),Ge(1:32));
figure(3);stem(w(1:32),Gm(1:32));
hold on
plot(w(1:32),Gh(1:32));

