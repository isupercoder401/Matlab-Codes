function y=periodic
Dt=0.002;
T=4;
M=4;
t=[-T:Dt:T];
y=0.5*rect(t);
time=[];
y_periodic=[];
for i=-M:M
    time=[time i*T+t];
    y_periodic=[y_periodic y];
end
figure(1); fy=plot(time,y_periodic);axis([-20 20 -1 1]);
figure(2); fx=plot(t,y);
end