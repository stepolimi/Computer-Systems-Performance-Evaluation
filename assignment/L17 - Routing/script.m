%OK

l = 0.5;
S = [1, 2, 2.5];
P = [0.7, 0.3, 0; 0.5, 0, 0.3; 0, 1, 0];
L = [1, 0, 0];

%Visits
v = L * inv(eye(3) - P)

%Service demands
D = v.*S

%Utilizations
U = D*l

%Since the utilization of the stations are greater than 1, the system is
%Unstable