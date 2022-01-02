%OK

U = zeros(500,1);
D = zeros(500,1);
Dv = [5 15 20];
Dp = [0.2 0.6 0.2];
E = zeros(500,1);
el = 15;
HE = zeros(500,1);
HEl = [0.1 0.05];
HEp = [0.5 0.5];
HOE = zeros(500,1);
hoel1 = 0.1;
hoel2 = 0.2;
HER = zeros(500,1);
HERs = [1 2 3];
HERr = [0.02 0.2 0.25];
HERp = [0.1 0.4 0.5];

for n=1:500
    r = rand();
    %Uniform
    U(n) = 10 + (20 - 10) * rand;

    %Discrete
    for k=1:size(Dv,2)
        if sum(Dp(1:k-1)) < r && r <= sum(Dp(1:k))
            D(n) = Dv(k);
        end
    end

    %Exponential
    E(n) = - log(rand)*el;

    %Hyper-Exponential
    for k=1:2
        if sum(HEp(1:k-1)) < r && r <= sum(HEp(1:k))
            HE(n) = -log(rand)/HEl(k);
        end
    end

    %Hpo-Exponential
    HOE(n) = - log(rand)/hoel1 - log(rand)/hoel2;
    
    %Hyper-Erlang
    if r < HERp(1)
        HER(n) = - log(rand)/HERr(1);
    elseif r < HERp(2)+HERp(1)
        HER(n) = - (log(rand)+log(rand))/HERr(2);
    else
        HER(n) = - (log(rand)+log(rand)+log(rand))/HERr(3);
    end
end

Uavg = avg(U)
Ucv = cv(U, Uavg)
Davg = avg(D)
Dcv = cv(D,Davg)
Eavg = avg(E)
Ecv = cv(E,Eavg)
HEavg = avg(HE)
HEcv = cv(HE, HEavg)
HOEavg = avg(HOE)
HOEcv = cv(HOE, HOEavg)
HERavg = avg(HER)
HERcv = cv(HER, HERavg)
plot(sort(U),  [1:500]/500, "-", sort(D), [1:500]/500,"-", sort(E), [1:500]/500, "-",sort(HE), [1:500]/500, "-",sort(HOE), [1:500]/500,"-", sort(HER), [1:500]/500, "-")
axis([0 50 0 1])

function F = avg(A)
    F = sum(A)/500;
end

function F = cv(A, Aavg)
    F = sqrt(sum(A.^2)/500 - Aavg^2)/Aavg;
end