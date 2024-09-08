function y=periodic1
T=4;
M=4;
dt=0.002;
t=[-T:dt:T];
time=[];
y_periodic=[];
y=0.5.*rect(t);
for i=-M:M
    time=[time i*T+t];
    y_periodic=[y_periodic y];
end
figure(1);plot(t,y);
figure(2);plot(time,y_periodic);



end