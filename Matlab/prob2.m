function [y1, y2]=prob2
dt=0.0001;
T=6;
M=3;
t=[0:dt:T-dt];
y=exp(-2*t);
plot(t,y)
time=[];
y_periodic=[];
for i=-M:M
    time=[time i*T+t];
    y_periodic=[y_periodic y];
end
figure(1);plot(t,y);
figure(2);plot(time,y_periodic);grid on;

y1=(sum(y_periodic.*conj(y_periodic))*dt)/(max(time)-min(time));
y2=sum(y.*conj(y)).*dt;


end