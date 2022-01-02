%OK
L = [0.1, 10];
D = [2, 5; 0.06, 0.04];

%Utilizations
U1 = D(1,1) * L(1) + D(2,1) * L(2);
U2 = D(1,2) * L(1) + D(2,2) * L(2);
[U1, U2]
%The system is stable synce both utilizations are smaller than 1

%Residence time
R1e = 2/(1-U1);
R1c = 0.06/(1-U1);
R1 = (L(1)/sum(L))*R1e + (L(2)/sum(L))*R1c;
R2e = 5/(1-U2);
R2c = 0.04/(1-U2);
R2 = (L(1)/sum(L))*R2e + (L(2)/sum(L))*R2c;
[R1, R2]

%Since all the visits are = 1, the response time is
Resp = R1+R2