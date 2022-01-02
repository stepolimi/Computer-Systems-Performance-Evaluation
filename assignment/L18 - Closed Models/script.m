%OK

N = 100;
S = [0.050, 0.150, 0.025];
v = [0.7, 0.2, 1];
Z = 10;

%Service demands
D = S.*v

%MVA loop 
Nprev = [0 0 0];
for i=1:N
    R = D.* (1 + Nprev);
    Res = sum(R);
    X = i/(Res + Z);
    Ni = R * X;
    Nprev = Ni;
end

%System throughput and system response time for N = 100 jobs in the system
X
Res