function y=new
%t=[-10:0.001:10];
t=-10:0.001:10;
a=-2;
b=2;
T=b-a;
j=sqrt(-1);
func=@(t)(triangle(t/2));
D0=(1/T).*integral(func,a,b);
func1=@(t)(triangle(t/2)).*exp(-j.*2.*3.14.*(1/T).*t);
D1=(1/T).*integral(func1,a,b);
func2=@(t)(triangle(t/2)).*exp(j.*2.*3.14.*(1/T).*t);
D1conj=(1/T).*integral(func2,a,b);
func3=@(t)(triangle(t/2)).*exp(-2j.*2.*3.14.*(1/T).*t);
D2=(1/T).*integral(func3,a,b);
func4=@(t)(triangle(t/2)).*exp(2j.*2.*3.14.*(1/T).*t);
D2conj=(1/T).*integral(func4,a,b);
func5=@(t)(triangle(t/2)).*exp(-3j.*2.*3.14.*(1/T).*t);
D3=(1/T).*integral(func5,a,b);
func6=@(t)(triangle(t/2)).*exp(3j.*2.*3.14.*(1/T).*t);
D3conj=(1/T).*integral(func6,a,b);
func7=@(t)(triangle(t/2)).*exp(-4j.*2.*3.14.*(1/T).*t);
D4=(1/T).*integral(func7,a,b);
func8=@(t)(triangle(t/2)).*exp(4j.*2.*3.14.*(1/T).*t);
D4conj=(1/T).*integral(func8,a,b);
func9=@(t)(triangle(t/2)).*exp(-5j.*2.*3.14.*(1/T).*t);
D5=(1/T).*integral(func9,a,b);
func10=@(t)(triangle(t/2)).*exp(5j.*2.*3.14.*(1/T).*t);
D5conj=(1/T).*integral(func10,a,b);
func11=@(t)(triangle(t/2)).*exp(-6j.*2.*3.14.*(1/T).*t);
D6=(1/T).*integral(func11,a,b);
func12=@(t)(triangle(t/2)).*exp(6j.*2.*3.14.*(1/T).*t);
D6conj=(1/T).*integral(func12,a,b);
func13=@(t)(triangle(t/2)).*exp(-7j.*2.*3.14.*(1/T).*t);
D7=(1/T).*integral(func13,a,b);
func14=@(t)(triangle(t/2)).*exp(7j.*2.*3.14.*(1/T).*t);
D7conj=(1/T).*integral(func14,a,b);
func15=@(t)(triangle(t/2)).*exp(-8j.*2.*3.14.*(1/T).*t);
D8=(1/T).*integral(func15,a,b);
func16=@(t)(triangle(t/2)).*exp(8j.*2.*3.14.*(1/T).*t);
D8conj=(1/T).*integral(func16,a,b);
func17=@(t)(triangle(t/2)).*exp(-9j.*2.*3.14.*(1/T).*t);
D9=(1/T).*integral(func17,a,b);
func18=@(t)(triangle(t/2)).*exp(9j.*2.*3.14.*(1/T).*t);
D9conj=(1/T).*integral(func18,a,b);


D=[D9conj D8conj D7conj D6conj D5conj D4conj D3conj D2conj D1conj D0 D1 D2 D3 D4 D5 D6 D7 D8 D9];
n=[-9:1:9];
figure(1),stem(n,abs(D));
figure(2),stem(n,angle(D));
y=D;
k=0;
for t=-10:0.001:10
    k=k+1;
    fapprox(k)=sum(D.*exp(j.*n.*2.*pi.*t/T));
end 
 t=-10:0.001:10;
figure(3);plot(t,fapprox,t,triangle(t/2));



end
