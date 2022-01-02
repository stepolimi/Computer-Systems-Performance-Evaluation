%OK

s = 1;
t = 0;
T = 100000;
Ts1 = 0;
Ts2 = 0;
Ts3 = 0;
trace = [t ; s];
i = 1;
Reports = 0;

while t < T
    %Stage 1
    if s == 1
        Tr = - log(rand()) / 0.05;
        Tm = - log(rand()) / 0.001;
        %Cuncurrency check
        if Tr < Tm
            ns = 2;
            dt = Tr;
        else
            ns = 3;
            dt = Tm;
        end
        Ts1 = Ts1 + dt;
    %Stage 2
    elseif s == 2
        Tw = - log(rand()) / 1;
        Tm = - log(rand()) / 0.001;
        %Cuncurrency check
        if Tw < Tm
            ns = 1;
            dt = Tw;
        else
            ns = 3;
            dt = Tm;
        end
        Ts2 = Ts2 + dt;
        Reports = Reports +1;
    %Stage 3
    elseif s == 3
        ns = 1;
        dt = - log(rand()) / 0.05;
        Ts3 = Ts3 + dt;
    end
    t = t + dt;
    s = ns;
    trace(i,1) = t;
    trace(i,2) = s;
    i = i+1;
end

%Graphical representation
stairs(trace(:,1), trace(:,2))

%Compute probabilities and utilization
Ps1 = Ts1 / t
Ps2 = Ts2 / t
Ps3 = Ts3 / t

ReportPerHour = Reports / t