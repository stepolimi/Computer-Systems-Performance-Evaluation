%OK

l = 10;
D = 0.085;
mu = 1/D;
ro = l*D;

U = ro
P1job = (1-ro)*ro
Pmore5jobs = ro^(5+1)
AvgJobInQueue = (ro^2)/(1-ro)
R = 1/(mu-l)
PResponseTime = exp(-0.5/R)
Percentile90 = -log(1-0.9)*R