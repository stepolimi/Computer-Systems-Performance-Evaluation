%OK

%m/g/1
l = 3;
u1 = 1;
u2 = 10;
p1 = 0.2;
p2 = 0.8;
D = p1/u1 + p2/u2;
ro = l*(p1/u1 + p2/u2);

m2 = 2*(p1/(u1^2) + p2/(u2^2));
U1 = l*(p1/u1 + p2/u2)
N1 = ro + ((l^2)*m2)/(2*(1-ro))
R1 = N1/l

%g/g/2
a = 0.1;
b = 0.2;
l = 1/((a+b)/2);
ro = l*(p1/u1 + p2/u2)/2;

varUnif = ((b-a)^2)/12;
avgUnif = (a+b)/2;
ca = sqrt(varUnif)/avgUnif;
varHe = 2*(p1/(u1^2)) + 2*(p2/(u2^2)) - (p1/u1 + p2/u2)^2;
avgHe = p1/u1 + p2/u2;
cv = sqrt(varHe)/avgHe;
OH = (ro^2 * D)/(1-ro^2);

U2 = (l * (p1/u1 + p2/u2))/2
R2 = D + ((ca^2 + cv^2)/2)*OH
N2 = R2 * l