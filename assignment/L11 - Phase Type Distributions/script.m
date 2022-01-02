%OK
cL1 = 5;
cL2 = 10;
cP1 = 0.4;
cP2 = 0.6;
wL1 = 1;
wL2 = 0.2;
wP1 = 0.75;
wP2 = 0.25;
gL = 8;

%Infinitesimal Generator
Q = [-0.3*wP1*cL1-0.3*wP2*cL1-0.7*cL1, 0, 0.3*wP1*cL1, 0.3*wP2*cL1, 0.7*cL1, 0, 0;
    0, -0.3*wP1*cL2-0.3*wP2*cL2-0.7*cL2, 0.3*wP1*cL2, 0.3*wP2*cL2, 0.7*cL2, 0, 0;
    cP1*wL1, cP2*wL1, -cP1*wL1-cP2*wL1, 0, 0, 0, 0;
    cP1*wL2, cP2*wL2, 0,  -cP1*wL2-cP2*wL2, 0, 0, 0;
    0, 0, 0, 0, -gL, gL, 0;
    0, 0, 0, 0, 0, -gL, gL;
    cP1*gL, cP2*gL, 0, 0, 0, 0, -cP1*gL-cP2*gL];

%Starting point
p0 = [1, 0, 0, 0, 0, 0, 0];

%Compute the stady solutions
Q(:,1) = ones(7,1);
pi = p0 * inv(Q);
Q(:,1) = [- 0.3*wP1*cL1 - 0.3*wP2*cL1 - 0.7*cL1; 0; cP1*wL1; cP1*wL2; 0; 0; cP1*gL];

%State and transition rewards
alphaC = [1, 1, 0, 0, 0, 0, 0];
alphaW = [0, 0, 1, 1, 0, 0, 0];
alphaG = [0, 0, 0, 0, 1, 1, 1];
epsiX = [0, 0, 0, 0, 0, 0, 0;
        0, 0, 0, 0, 0, 0, 0;
        1, 1, 0, 0, 0, 0, 0;
        1, 1, 0, 0, 0, 0, 0;
        0, 0, 0, 0, 0, 0, 0;
        0, 0, 0, 0, 0, 0, 0;
        1, 1, 0, 0, 0, 0, 0];

%Compute state rewards performance indexes
PComputing = sum(pi.*alphaC)
PWiFi = sum(pi.*alphaW)
P4G = sum(pi.*alphaG)

%Compute transition rewards performance indexes
X = zeros(1,7);
for i=1:size(pi,2)
    X(i) = pi(i)*sum(Q(i,:).*epsiX(i,:));
end
Throughput = sum(X)

[t, Sol]=ode45(@(t,x) Q'*x, [0 10], p0');
Sol(end, :)
plot(t, Sol, "-");
