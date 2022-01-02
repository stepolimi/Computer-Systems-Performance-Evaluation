%OK

%m/m/1/6 and m/m/1
l = 0.9;
D = 1;
mu = 1/D;
ro = l/mu;
k = 6;

AU1 = ro
AU16 = (ro - ro^(k+1))/(1-ro^(k+1))
P4jobs1 = (1-ro)*(ro^4)
P4jobs16 = (1-ro)/(1-ro^(k+1))*(ro^4)
N1 = ro/(1-ro)
N16 = ro/(1-ro) - ((k+1)*(ro^(k+1)))/(1-(ro^(k+1)))
X1 = l
X16 = l*((1-ro^k)/(1-ro^(k+1)))
Dr1 = 0
Dr16 = l - X16
R1 = 1/(mu-l)
R16 = D*((1-(k+1)*(ro^k)+k*(ro^(k+1)))/((1-ro)*(1-ro^k)))
OH1 = (ro^2)/(1-ro)
OH16 = R16-D

%m/m/2/6
l = 1.8;
D = 1;
c = 2;
k = 6;
mu = 1/D;
ro = l/(mu*c);

AU26 = ro
pi0 = ((((c*ro)^c)/factorial(c))*((1-ro^(k-c+1))/(1-ro)) + sumc(ro,c))^(-1);
P4jobs26 = (pi0*(c^c)*(ro^4))/factorial(c)
N26 = Pn(1,pi0) + 2*Pn(2,pi0) + 3*Pn(3,pi0)+ 4*Pn(4,pi0)+ 5*Pn(5,pi0)+ 6*Pn(6,pi0)
X26 = l*(1-Pn(6,pi0))
Dr26 = l*Pn(6,pi0)
R26 = N26/(l*(1-Pn(6,pi0)))
OH26 = R26 - D

function F = Pn(n,pi0)
    l = 1.8;
    c = 2;
    mu = 1;
    k = 6;
    if n < c
        F = (pi0/factorial(n))*((l/mu)^n);
    elseif n <= k
        F = (pi0/(factorial(c)*(c^(n-c))))*((l/mu)^n);
    else
        F = 0;
    end
end

function F = sumc(ro,c)
    sum = 0;
    for k=0:(c-1)
        sum = sum + ((c*ro)^k)/factorial(k);
    end
    F = sum;
end