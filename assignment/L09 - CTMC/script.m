%OK

MTTF = 100;
MTTR = 5;
MTTBackup = 15;

l = 1/MTTF;
m = 1/MTTR;
b = 1/MTTBackup;

%Infinitesimal Generator
Q = [-l-l, l , l , 0;
    m ,-m-l, 0 , l;
    m , 0 ,-m-l, l;
    b , 0 , 0 ,-b];

%Starting point
p0 = [1, 0, 0, 0];

%Drawing solution
[t, Sol]=ode45(@(t,x) Q'*x, [0 10000], p0');
plot(t, Sol, "-");

%Probabilities of beeing in each state after 10000 days
Ps1 = Sol(end,1)
Ps2 = Sol(end,2)
Ps3 = Sol(end,3)
Ps4 = Sol(end,4)