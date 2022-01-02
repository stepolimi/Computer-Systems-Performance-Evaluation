%OK

l = 10;
D1 = 0.085;
D2 = 0.075;
D3 = 0.050;

%Utilization
U1 = l*D1
U2 = l*D2
U3 = l*D3

%Average number of jobs
N1 = U1/(1-U1)
N2 = U2/(1-U2)
N3 = U3/(1-U3)

%System response time
R = D1/(1-U1) + D2/(1-U2) + D3/(1-U3)