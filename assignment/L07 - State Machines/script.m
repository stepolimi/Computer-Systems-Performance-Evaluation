%OK

s = 1;
t = 0;
T = 30000;
Ts1 = 0;
Ts2 = 0;
Ts3 = 0;
trace = [t ; s];
i = 1;

while t < T
    %Stage 1
    if s == 1
        if rand() < 0.8
            ns = 2;
        else
            if rand() < 0.5
                ns = 1;
            else
                ns = 3;
            end
        end
        dt = - (log(rand()) + log(rand()) + log(rand()))/ 0.1;
        Ts1 = Ts1 + dt;
    %Stage 2
    elseif s == 2
        if rand() < 0.5
            ns = 1;
        else
            ns = 3;
        end
        dt = - log(rand()) / 0.01;
        Ts2 = Ts2 + dt;
    %Stage 3
    elseif s == 3
        ns = 1;
        dt = - log(rand()) / 0.005;
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

U = (Ts1 + Ts2) / t