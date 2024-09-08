j=sqrt(-1);
b=2;
a=-2;
t=[-10:0.0001:10];
T=b-a;
y=tri2(t/2);
func=@(t)(tri2(t/2));
D0=1/T.*integral(func,a,b);
func1=@(t)(tri2(t/2).*exp(-j.*2.*3.14*1/T*t));
D1=1/T.*integral(func1,a,b);
func2=@(t)(tri2(t/2).*exp(j*2*3.14*1/T*t));
D1conj=1/T.*integral(func2,a,b);
func3=@(t)(tri2(t/2).*exp(-2j.*2.*3.14*1/T*t));
D2=1/T.*integral(func3,a,b);
func4=@(t)(tri2(t/2).*exp(2j.*2.*3.14*1/T*t));

D2conj=1/T.*integral(func4,a,b);
func5=@(t)(tri2(t/2).*exp(-3j.*2.*3.14*1/T*t));
D3=1/T.*integral(func5,a,b);
func6=@(t)(tri2(t/2).*exp(3j.*2.*3.14*1/T*t));
D3conj=1/T.*integral(func6,a,b);
D=[ D3conj D2conj D1conj D0 D1 D2 D3  ];
n=[-3:1:3];
figure(1);stem(n,abs(D));
figure(2);stem(n,angle(D));




