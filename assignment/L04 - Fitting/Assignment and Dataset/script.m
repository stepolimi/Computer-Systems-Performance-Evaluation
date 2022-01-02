%TODO: does not work

clear all;
tiledlayout(4,2);
filename = 'Traces.csv';
A = load(filename);
N = size(A);
global M1 
M1 = mean(A);
global M2
M2 = mean(A.^2);
global M3 
M3 = mean(A.^3);
M4 = mean(A.^4);
global n
for n=1:4
    %fit uniform Method of Moments
    U_a_MM = M1 - sqrt(12*(M2-M1.^2))/2;
    U_b_MM = M1 + sqrt(12*(M2-M1.^2))/2;
    xUnif = linspace(U_a_MM(n), U_b_MM(n), 100);
    %Does not fit because the dataset does not come from a uniform distribution!
    
    %fit exponential Method of Moments and Maximum likelihood
    E_par_MM = fsolve(@Exp_MM, [0.5]);
    E_par_MLE = mle(A(:,2), 'pdf', @Exp_MLE_pdf, 'start', [0.1], 'LowerBound', [0], 'UpperBound', [Inf]);
    x = [1:600]/10;
    
    %fit hyper-exponential Method of Moments and Maximum likelihood
    HE_par_MM = fsolve(@HyperExp_MM, [0.5,0.5,0.5]);
    HE_par_MLE = mle(A(:,2), 'pdf', @HyperExp_MLE_pdf, 'start', [0.1,0.2,0.5], 'LowerBound', [0,0,0], 'UpperBound', [Inf,Inf,1]);


    %fit hypo-exponential Method of Moments and Maximum likelihood
    HO_par_MM = fsolve(@HypoExp_MM, [0.1,0.2]);
    HO_par_MLE = mle(A(:,2), 'pdf', @HypoExp_MLE_pdf, 'start', [1/M1(n),0], 'LowerBound', [0,0], 'UpperBound', [100/M1(n),Inf]);

    nexttile
    plot(sort(A(:,n)), [1:1000]/1000,"+", x, 1 - exp(-x*E_par_MLE),"-", x, 1 - HE_par_MLE(3)*exp(-x*HE_par_MLE(1)) - (1-HE_par_MLE(3)) * exp(-x * HE_par_MLE(2)),"<", x, 1-((HO_par_MLE(2)*exp(-x*HO_par_MLE(1)))/(HO_par_MLE(2)-HO_par_MLE(1)) + (HO_par_MLE(1)*exp(-x*HO_par_MLE(2)))/(HO_par_MLE(2)-HO_par_MLE(1))), ">");
    tit = "Maximum likelyhood"
    title([tit n])

    nexttile
    plot(sort(A(:,n)), [1:1000]/1000,"+", xUnif, [0:99]/99, "*", x, 1 - exp(-x*E_par_MM), "-", x, 1 - HE_par_MM(3)*exp(-x*HE_par_MM(1)) - (1-HE_par_MM(3)) * exp(-x * HE_par_MM(2)), "<", x, 1-((HO_par_MM(2)*exp(-x*HO_par_MM(1)))/(HO_par_MM(2)-HO_par_MM(1)) + (HO_par_MM(1)*exp(-x*HO_par_MM(2)))/(HO_par_MM(2)-HO_par_MM(1))), ">");
    tit = "Method of moments"
    title([tit n])

end

function F = Exp_MM(l)
    % l -> lambda
    global M1 
    global n
    F = (1/l)/M1(n) - 1;
end

function F = HyperExp_MM(p)
    % p(1) -> lambda_1
    % p(2) -> lambda_2
    % p(3) -> p_1
    global M1 
    global M2 
    global M3
    global n
    l1 = p(1);
    l2 = p(2);
    p1 = p(3);
    F = [];
    F(1) = (p1 / l1 + (1-p1) / l2) / M1(n) -1;
    F(2) = 2*(p1 / l1^2 + (1-p1) / l2^2) / M2(n) -1;
    F(3) = 6*(p1 / l1^3 + (1-p1) / l2^3) / M3(n) -1;
end

function F = HypoExp_MM(p)
    % p(1) -> lambda_1
    % p(2) -> lambda_2
    global M1 
    global M2 
    global n
    l1 = p(1);
    l2 = p(2);
    F = [];
    F(1) = ((1/(l1-l2)) * (l1/l2 - l2/l1))/M1(n) - 1;
    F(2) = 2*((1/l1^2) + (1/(l1*l2)) + (1/l2^2))/M2(n)  -1;
end

function F = Exp_MLE_pdf(x, l)
    F = l * exp(-l*x);
end

function F = HyperExp_MLE_pdf(x, l1, l2, p1)
    F = p1 * l1* exp(-l1*x) + (1-p1) * l2 * exp(-l2 * x);
end

function F = HypoExp_MLE_pdf(x, l1, l2)
    F = ((l1*l2)/(l1-l2)) * (exp(-l2*x) - exp(-l1*x));
end