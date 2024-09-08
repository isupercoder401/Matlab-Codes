function y=triplesinc(t,Ta)
m1=sinc(2*t/Ta);
m2=sinc((2*t)/(Ta-1));
m3=sinc((2*t)/(Ta+1));
y=2*m1+m2+m3;
end