%OK

waitA = 10;
execA = 8;
waitB = 5;
execB = 12;
execAwB = execA*2;
execBwA = execB*2;

wA = 1/waitA;
wB = 1/waitB;
eA = 1/execA;
eAB = 1/execAwB;
eB = 1/execB;
eBA = 1/execBwA;

%Infinitesimal Generator
Q = [-eAB-eBA, eAB , eBA , 0;
    wA ,-wA-eB, 0 , eB;
    wB , 0 ,-wB-eA, eA;
    0 , wB , wA ,-wB-wA];

%Starting point
p0 = [1, 0, 0, 0];

%Compute the stady solutions
Q(:,1) = ones(4,1);
pi = p0 * inv(Q);
Q(:,1) = [-eAB-eBA; wA; wB; 0];

%State and transition rewards
alphaU = [1 1 1 0];
alphaN = [2 1 1 0];
epsiX = [0 1 1 0;
        0 0 0 1;
        0 0 0 1;
        0 0 0 0];

%Compute state rewards performance indexes
Utilization = sum(pi.*alphaU)
NumberOfTasks = sum(pi.*alphaN)

%Compute transition rewards performance indexes
X = zeros(1,4);
for i=1:size(pi,2)
    X(i) = pi(i)*sum(Q(i,:).*epsiX(i,:));
end
Throughput = sum(X)

%Compute state rewards for a specific point in time
[t, Sol]=ode45(@(t,x) Q'*x, [0 10], p0');
N10 = sum(Sol(end,:).*alphaN)
[t, Sol]=ode45(@(t,x) Q'*x, [0 20], p0');
N20 = sum(Sol(end,:).*alphaN)
[t, Sol]=ode45(@(t,x) Q'*x, [0 50], p0');
N50 = sum(Sol(end,:).*alphaN)
[t, Sol]=ode45(@(t,x) Q'*x, [0 100], p0');
N100 = sum(Sol(end,:).*alphaN)
