    t=[-10:0.001:10];
a=-2;
b=2;
T=b-a;
j=sqrt(-1);
func=@(t)(triangle(t/2));
D0=1/T.*integral(func,a,b);
func1=@(t)(triangle(t/2).*exp(j*2*3.14*1/T*t));
D1=1/T.*integral(func1,a,b);
func2=@(t)(triangle(t/2).*exp(-j*2*3.14*1/T*t));
D1conj=1/T.*integral(func2,a,b);
func3=@(t)(triangle(t/2).*exp(2j*2*3.14*1/T*t));
D2=1/T.*integral(func3,a,b);
func4=@(t)(triangle(t/2).*exp(-2j*2*3.14*1/T*t));
D2conj=1/T.*integral(func3,a,b);
func5=@(t)(triangle(t/2).*exp(3j*2*3.14*1/T*t));
D3=1/T.*integral(func5,a,b);
func10=@(t)(triangle(t/2).*exp(-3j*2*3.14*1/T*t));
D3conj=1/T.*integral(func10,a,b);
func6=@(t)(triangle(t/2).*exp(4j*2*3.14*1/T*t));
D4=1/T.*integral(func6,a,b);
func7=@(t)(triangle(t/2).*exp(-4j*2*3.14*1/T*t));
D4conj=1/T.*integral(func7,a,b);
func8=@(t)(triangle(t/2).*exp(5j*2*3.14*1/T*t));
D5=1/T.*integral(func8,a,b);
func9=@(t)(triangle(t/2).*exp(-5j*2*3.14*1/T*t));
D5conj=1/T.*integral(func9,a,b);
n=[-5:1:5];
D=[D5conj,D4conj,D3conj,D2conj,D1conj,D0,D1,D2,D3,D4,D5];
figure(1);stem(n,abs(D));
figure(2);stem(n,angle(D));




