%OK

clear all;

%-----------Trace 1------------
disp("---------- Trace 1 ----------")
filename = '01_DataSet1.csv';
AC = readmatrix(filename);

%Number of arrivals (array column with the first column of the file red)
nA = size(AC, 1);
%Number of completitions
nC = size(AC, 1);
%Time
T = AC(nC, 2);

%Arrival rate
Lambda = nA / T

%Throughput
X = nC / T

%Compute Busy time, Utilization and probability of having n jobs active in the system: concatenate vertical array of arrivals with array of completitions, add another
%column with +1 for arr, -1 for completition, then sort the matrix created with the arrival order, then add a column with the cumulative sum at that
%moment (cumsum()), that gives the number of jobs active in that moment of time.
Arr = [AC(:,1) ones(nA,1)];
Comp = [AC(:,2) ones(nA, 1)*-1];
conc = [Arr ; Comp];
sorted = sortrows(conc);
res = [sorted cumsum(sorted(:,2))];

%Utilization
U = 1 - probK(0,res)


%Busy time
B = T * U

%W      C        A       (with formula with response times)
Rt = AC(:,2) - AC(:,1);
W = sum(Rt)

%Average service time
S = B / nC

%Average response time
R = W / nC

%Average number of jobs
Na = W / T

%Probability of having m jobs in the station
pN = [probK(0,res), probK(1,res), probK(2,res), probK(3,res)]

%Probability of having response time < t
pRt = sum([Rt < 1, Rt < 10, Rt < 50]) / nC



%-----------Trace 2------------
disp("---------- Trace 2 ----------")

clear all;
filename = '01_DataSet2.csv';
AC = readmatrix(filename);

%Number of arrivals (array column with the first column of the file red)
nA = size(AC, 1);
%Number of completitions
nC = size(AC, 1);
%Time
T = AC(nC, 2);

%Arrival rate
Lambda = nA / T

%Throughput
X = nC / T

%Compute Busy time, Utilization and probability of having n jobs active in the system: concatenate vertical array of arrivals with array of completitions, add another
%column with +1 for arr, -1 for completition, then sort the matrix created with the arrival order, then add a column with the cumulative sum at that
%moment (cumsum()), that gives the number of jobs active in that moment of time.
Arr = [AC(:,1) ones(nA,1)];
Comp = [AC(:,2) ones(nA, 1)*-1];
conc = [Arr ; Comp];
sorted = sortrows(conc);
res = [sorted cumsum(sorted(:,2))];

%Utilization
U = 1 - probK(0,res)

%Busy time
B = T * U

%W      C        A       (with formula with response times)
Rt = AC(:,2) - AC(:,1);
W = sum(Rt)

%Average service time
S = B / nC

%Average response time
R = W / nC

%Average number of jobs
Na = W / T

%Probability of having m jobs in the station
pN = [probK(0,res), probK(1,res), probK(2,res), probK(3,res)]

%Probability of having response time < t
pRt = sum([Rt < 1, Rt < 10, Rt < 50]) / nC



%Computes the probability of having k number of jobs in the system
function F = probK(p, res)
    timek = 0;
    for i=1:size(res,1)-1
        if res(i,3) == p
            timek = timek + (res(i+1,1) - res(i,1));
        end
    end
    F = timek/res(size(res,1), 1);
end