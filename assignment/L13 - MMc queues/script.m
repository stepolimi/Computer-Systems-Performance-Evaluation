%OK

%m/m/1
l = 0.95;
D = 0.9;
mu = 1/D;
ro = l*D;

AU1 = ro;
P4jobs1 = (1-ro)*(ro^4);
N1 = ro/(1-ro);
R1 = 1/(mu-l);
OH1 = (ro*D)/(1-ro);

%m/m/2
l = 0.95;
D = 1.8;
mu = 1/D;
ro = (l*D)/2;

AU2 = ro;
P4jobs2 = 2*((1-ro)/(1+ro))*(ro^4);
N2 = (2*ro)/(1-ro^2);
R2 = D/(1-ro^2);
OH2 = (ro^2*D)/(1-ro^2);

%m/m/c
c = 3;
l = 0.95;
D = 2.7;
ro = (l*D)/c;

AUc = ro;
pi0 = ((((c*ro)^c)/factorial(c))*(1/(1-ro)) + sumc(ro,c))^(-1);
P4jobsc = (pi0*(c^c)*(ro^4))/factorial(c);
Nc = c*ro + (ro/(1-ro))/(1+(1-ro)*(factorial(c)/((ro*c)^c))*sumc(ro,c));
OHc = (D/(c*(1-ro)))/(1+(1-ro)*(factorial(c)/((ro*c)^c))*sumc(ro,c));
Rc = D + OHc;

%m/m/oo
l = 0.95;
D = 2.7;
ro = l*D;

P4jobsoo = exp(-ro)*((ro^4)/factorial(4));
Noo = ro; 
Roo = D;
OHoo = 0;


%Compare results
disp("Average utilization")
AU1
AU2
AUc

disp("Probability of having 4 jobs in the system")
P4jobs1
P4jobs2
P4jobsc
P4jobsoo

disp("Average number of jobs in the system")
N1
N2
Nc
Noo

disp("Average response time")
R1
R2
Rc
Roo

disp("Average time spent in the queue")
OH1
OH2
OHc
OHoo


function F = sumc(ro,c)
    sum = 0;
    for k=0:(c-1)
        sum = sum + ((c*ro)^k)/factorial(k);
    end
    F = sum;
end