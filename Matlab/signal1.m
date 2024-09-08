function y=signal1(t)
y=exp(-abs(t)/4).*(ustep(t)-ustep(t-4));


end