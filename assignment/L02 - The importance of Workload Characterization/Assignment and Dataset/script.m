%OK

clear all

%-------------Dates Log1----------------------
fileName = "Log1.txt";
lines = readlines(fileName);
datesStrings = extractBetween(lines,"["," -0200");
datesStrings = strrep(datesStrings,"Sep","09");
dates = datetime(datesStrings,'InputFormat','dd/MM/yyyy:HH:mm:ss');

%Total time
Td = between(dates(1),dates(size(dates,1)));
[d,t] = split(Td,{'days','Time'});
T = d*24*3600 + seconds(t);

%Average arrival rate
lambda1 = size(dates, 1) / T;

%Average inter arrival time (time between the arrival of 2 jobs)
Inter1 = zeros(size(dates,1)-1,1);
for i = 1:size(dates, 1)-1
    Tdi = between(dates(i),dates(i+1));
    [di,ti] = split(Tdi,{'days','Time'});
    Inter1(i) = di*24*3600 + seconds(ti);
end
Ia1 = sum(Inter1) / size(Inter1,1);


%-------------Dates Log2----------------------
fileName = "Log2.txt";
lines = readlines(fileName);
datesStrings = extractBetween(lines,"["," -0200");
datesStrings = strrep(datesStrings,"Sep","09");
dates = datetime(datesStrings,'InputFormat','dd/MM/yyyy:HH:mm:ss');

%Total time
Td = between(dates(1),dates(size(dates,1)));
[d,t] = split(Td,{'days','Time'});
T = d*24*3600 + seconds(t);

%Average arrival rate
lambda2 = size(dates, 1) / T;

%Average inter arrival time (time between the arrival of 2 jobs)
Inter2 = zeros(size(dates,1)-1,1);
for i = 1:size(dates, 1)-1
    Tdi = between(dates(i),dates(i+1));
    [di,ti] = split(Tdi,{'days','Time'});
    Inter2(i) = di*24*3600 + seconds(ti);
end
Ia2 = sum(Inter2) / size(Inter2,1);


%-------------Dates Log3----------------------
fileName = "Log3.txt";
lines = readlines(fileName);
datesStrings = extractBetween(lines,"["," -0200");
datesStrings = strrep(datesStrings,"Sep","09");
dates = datetime(datesStrings,'InputFormat','dd/MM/yyyy:HH:mm:ss');

%Total time
Td = between(dates(1),dates(size(dates,1)));
[d,t] = split(Td,{'days','Time'});
T = d*24*3600 + seconds(t);

%Average arrival rate
lambda3 = size(dates, 1) / T;

%Average inter arrival time (time between the arrival of 2 jobs)
Inter3 = zeros(size(dates,1)-1,1);
for i = 1:size(dates, 1)-1
    Tdi = between(dates(i),dates(i+1));
    [di,ti] = split(Tdi,{'days','Time'});
    Inter3(i) = di*24*3600 + seconds(ti);
end
Ia3 = sum(Inter3) / size(Inter3,1);


%-------------Dates Log4----------------------
fileName = "Log4.txt";
lines = readlines(fileName);
datesStrings = extractBetween(lines,"["," -0200");
datesStrings = strrep(datesStrings,"Sep","09");
dates = datetime(datesStrings,'InputFormat','dd/MM/yyyy:HH:mm:ss');

%Total time
Td = between(dates(1),dates(size(dates,1)));
[d,t] = split(Td,{'days','Time'});
T = d*24*3600 + seconds(t);

%Average arrival rate
lambda4 = size(dates, 1) / T;

%Average inter arrival time (time between the arrival of 2 jobs)
Inter4 = zeros(size(dates,1)-1,1);
for i = 1:size(dates, 1)-1
    Tdi = between(dates(i),dates(i+1));
    [di,ti] = split(Tdi,{'days','Time'});
    Inter4(i) = di*24*3600 + seconds(ti);
end
Ia4 = sum(Inter4) / size(Inter4,1);



%Print results and calculate variances
Arrival_rate = [lambda1, lambda2, lambda3, lambda4]
Inter_arrival = [Ia1, Ia2, Ia3, Ia4]
Coefficient_variation = [sqrt(var(Inter1))/mean(Inter1), sqrt(var(Inter2))/mean(Inter2), sqrt(var(Inter3))/mean(Inter3), sqrt(var(Inter4))/mean(Inter4)]
disp("Clearly, Log2 is the one with the lowest variability (0). This could have been easly seen from the log data, since it has constant inter arrival times.")
disp(" ")

%Plot correlations
tiledlayout(2,2);
Inter1_o = Inter1(1:2:end);
Inter1_e = Inter1(2:2:end);
nexttile
%Log1: uniform distribution positively correlated
plot(Inter1_o, Inter1_e,'.')
title("Log 1")
Inter2_o = Inter2(1:2:end);
Inter2_e = Inter2(2:2:end);
nexttile
%Log2: non correlated
plot(Inter2_o, Inter2_e,'.')
title("Log 2")
Inter3_o = Inter3(1:2:end);
Inter3_e = Inter3(2:2:end);
nexttile
%Log3: uniform distribution strongly positively correlated
plot(Inter3_o, Inter3_e,'.')
title("Log 3")
Inter4_o = Inter4(1:2:end);
Inter4_e = Inter4(2:2:end);
nexttile
%Log4: exponential distribution strongly negatively correlated
plot(Inter4_o, Inter4_e,'.')
title("File 4")

disp("As we can see from the figures, the data associated to Log3 is the one with the highest correlation between arrivals")

