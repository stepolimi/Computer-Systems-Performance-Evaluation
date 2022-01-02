%OK

format long g
clear all
tiledlayout(2,2);
%-----------File 1------------
disp("---------- File 1 ----------")
filename = 'Data1.txt';
A = load(filename);
N = size(A,1);

%First four moments
M1 = sum(A)/N;
M = mean(A);
M2 = sum(A.^2)/N;
M3 = sum(A.^3)/N;
M4 = sum(A.^4)/N;
Moments = [M1, M2, M3, M4]

%Centered moments
Cm2 = sum((A-M1).^2)/N;
Var = M2 - M1.^2;
Cm3 = sum((A-M1).^3)/N;
Cm4 = sum((A-M1).^4)/N;
Centered_moments = [Cm2, Cm3, Cm4]

%Standardized moments
Sd = sqrt(Cm2);
Sm3 = sum(((A-M1)/Sd).^3)/N;
Sm4 = sum(((A-M1)/Sd).^4)/N;
Standardized_moments = [Sm3, Sm4]

%Standard Deviation
Std = std(A)

%Coefficient of variation
Cv = Sd/M1

%Kurtosis
Kur = Sm4 - 3

%Cross covariance
m = 1;
Ccv1 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
m = 2;
Ccv2 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
m = 3;
Ccv3 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
Cross_covariance = [Ccv1, Ccv2, Ccv3]

%Percentiles
D = sort(A);
p = 10;
h = (N-1) * p/100 + 1;
percentile10 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 25;
h = (N-1) * p/100 + 1;
percentile25 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 50;
h = (N-1) * p/100 + 1;
percentile50 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 75;
h = (N-1) * p/100 + 1;
percentile75 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 90;
h = (N-1) * p/100 + 1;
percentile90 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
Percentiles = [percentile10, percentile25, percentile50, percentile75, percentile90]

%CDF
CDF = zeros(N,2);
CDF(:,1) = sort(A);
for i = 1:N
    CDF(i,2) = i/N;
end
nexttile
plot(CDF(:,1), CDF(:,2))
title("File 1")

%-----------File 2------------
disp("---------- File 2 ----------")
filename = 'Data2.txt';
A = load(filename);
N = size(A,1);

%First four moments
M1 = sum(A)/N;
M = mean(A);
M2 = sum(A.^2)/N;
M3 = sum(A.^3)/N;
M4 = sum(A.^4)/N;
Moments = [M1, M2, M3, M4]

%Centered moments
Cm2 = sum((A-M1).^2)/N;
Var = M2 - M1.^2;
Cm3 = sum((A-M1).^3)/N;
Cm4 = sum((A-M1).^4)/N;
Centered_moments = [Cm2, Cm3, Cm4]

%Standardized moments
Sd = sqrt(Cm2);
Sm3 = sum(((A-M1)/Sd).^3)/N;
Sm4 = sum(((A-M1)/Sd).^4)/N;
Standardized_moments = [Sm3, Sm4]

%Standard Deviation
Std = std(A)

%Coefficient of variation
Cv = Sd/M1

%Kurtosis
Kur = Sm4 - 3

%Cross covariance
m = 1;
Ccv1 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
m = 2;
Ccv2 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
m = 3;
Ccv3 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
Cross_covariance = [Ccv1, Ccv2, Ccv3]

%Percentiles
D = sort(A);
p = 10;
h = (N-1) * p/100 + 1;
percentile10 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 25;
h = (N-1) * p/100 + 1;
percentile25 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 50;
h = (N-1) * p/100 + 1;
percentile50 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 75;
h = (N-1) * p/100 + 1;
percentile75 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 90;
h = (N-1) * p/100 + 1;
percentile90 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
Percentiles = [percentile10, percentile25, percentile50, percentile75, percentile90]

%CDF
CDF = zeros(N,2);
CDF(:,1) = sort(A);
for i = 1:N
    CDF(i,2) = i/N;
end
nexttile
plot(CDF(:,1), CDF(:,2))
title("File 2")

%-----------File 3------------
disp("---------- File 3 ----------")
filename = 'Data3.txt';
A = load(filename);
N = size(A,1);

%First four moments
M1 = sum(A)/N;
M = mean(A);
M2 = sum(A.^2)/N;
M3 = sum(A.^3)/N;
M4 = sum(A.^4)/N;
Moments = [M1, M2, M3, M4]

%Centered moments
Cm2 = sum((A-M1).^2)/N;
Var = M2 - M1.^2;
Cm3 = sum((A-M1).^3)/N;
Cm4 = sum((A-M1).^4)/N;
Centered_moments = [Cm2, Cm3, Cm4]

%Standardized moments
Sd = sqrt(Cm2);
Sm3 = sum(((A-M1)/Sd).^3)/N;
Sm4 = sum(((A-M1)/Sd).^4)/N;
Standardized_moments = [Sm3, Sm4]

%Standard Deviation
Std = std(A)

%Coefficient of variation
Cv = Sd/M1

%Kurtosis
Kur = Sm4 - 3

%Cross covariance
m = 1;
Ccv1 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
m = 2;
Ccv2 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
m = 3;
Ccv3 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
Cross_covariance = [Ccv1, Ccv2, Ccv3]

%Percentiles
D = sort(A);
p = 10;
h = (N-1) * p/100 + 1;
percentile10 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 25;
h = (N-1) * p/100 + 1;
percentile25 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 50;
h = (N-1) * p/100 + 1;
percentile50 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 75;
h = (N-1) * p/100 + 1;
percentile75 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 90;
h = (N-1) * p/100 + 1;
percentile90 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
Percentiles = [percentile10, percentile25, percentile50, percentile75, percentile90]

%CDF
CDF = zeros(N,2);
CDF(:,1) = sort(A);
for i = 1:N
    CDF(i,2) = i/N;
end
nexttile
plot(CDF(:,1), CDF(:,2))
title("File 3")

%-----------File 4------------
disp("---------- File 4 ----------")
filename = 'Data4.txt';
A = load(filename);
N = size(A,1);

%First four moments
M1 = sum(A)/N;
M = mean(A);
M2 = sum(A.^2)/N;
M3 = sum(A.^3)/N;
M4 = sum(A.^4)/N;
Moments = [M1, M2, M3, M4]

%Centered moments
Cm2 = sum((A-M1).^2)/N;
Var = M2 - M1.^2;
Cm3 = sum((A-M1).^3)/N;
Cm4 = sum((A-M1).^4)/N;
Centered_moments = [Cm2, Cm3, Cm4]

%Standardized moments
Sd = sqrt(Cm2);
Sm3 = sum(((A-M1)/Sd).^3)/N;
Sm4 = sum(((A-M1)/Sd).^4)/N;
Standardized_moments = [Sm3, Sm4]

%Standard Deviation
Std = std(A)

%Coefficient of variation
Cv = Sd/M1

%Kurtosis
Kur = Sm4 - 3

%Cross covariance
m = 1;
Ccv1 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
m = 2;
Ccv2 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
m = 3;
Ccv3 = sum((A(1:N-m)-M1).*(A(m+1:N)-M1))/(N-m);
Cross_covariance = [Ccv1, Ccv2, Ccv3]

%Percentiles
D = sort(A);
p = 10;
h = (N-1) * p/100 + 1;
percentile10 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 25;
h = (N-1) * p/100 + 1;
percentile25 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 50;
h = (N-1) * p/100 + 1;
percentile50 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 75;
h = (N-1) * p/100 + 1;
percentile75 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
p = 90;
h = (N-1) * p/100 + 1;
percentile90 = D(fix(h)) + (h-fix(h)) * (D(fix(h) + 1) - D(fix(h)));
Percentiles = [percentile10, percentile25, percentile50, percentile75, percentile90]

%CDF
CDF = zeros(N,2);
CDF(:,1) = sort(A);
for i = 1:N
    CDF(i,2) = i/N;
end
nexttile
plot(CDF(:,1), CDF(:,2))
title("File 4")