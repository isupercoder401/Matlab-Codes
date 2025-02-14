function [y1,y2]=exam2
T=6;
M=3;
t=0:0.0001:T-0.0001;
y=exp(-abs(t)/2).*sin(2*3.14*t).*(ustep(t)-ustep(t-4));
figure(1);plot(t,y);

time=[];
y_periodic=[];
for i=-M:M-1
    time=[time i*T+t];
    y_periodic=[y_periodic y];
end
figure(2);plot(time,y_periodic);grid on;axis([-18 18 -1 1]);
y1=(sum(y_periodic.*conj(y_periodic)).*0.0001)/(max(time)-min(time));
y2=sum(abs(y)).*0.0001;
    

end