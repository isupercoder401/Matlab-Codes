function [power,energy]=periodic2 
dt=0.0001;
  To=4;
  M=4;
  t=[-To:dt:To];
  y=0.5*rect(t);
  time=[];
  y_periodic=[];
  for i=-M:M
      time=[time i*To+t];
      y_periodic=[y_periodic y];
  end
  figure(1);plot(t,y);
  figure(2);plot(time,y_periodic);
power=((sum(y_periodic.*conj(y_periodic)).*dt))/max(time)-min(time);
energy=sum(y.*conj(y)).*dt;

end