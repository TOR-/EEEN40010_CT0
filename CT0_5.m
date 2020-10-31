%% Constants, setup
a=4;
b=6;
c=6;

set(gca, 'defaultTextInterpreter','latex')
close all
%% Problem Five
% EXAMPLE ODE
exampleODE = @(x,y) -(2*x) -y;
% [TOUT,YOUT] = ODE45(ODEFUN,TSPAN,Y0), TSPAN = [T0 TFINAL]
% integrates y' = f(t,y) from t=T0 to t=TFINAL with initial conditions Y0
X0 = 0;
XFINAL = 3;
Y0 = -1;
%[X, Y] = ode45(exampleODE, [X0 XFINAL], Y0);

% QUESTION'S ODE
g = 9.81; % m s^-1
A = a+b+2*c;
x_r = a;
C_d = c/2;
A_d = a/3;
fn = @(qin, xt) (C_d*A_d*sqrt(2*g))/A*(sqrt(x_r)-sqrt(x_r-xt)) + qin/A;

T0 = 0;
T1 = 24;
XT0 = x_r;
[T, XT] = ode45(fn, [T0 T1], XT0);
plot(T,abs(XT))
hold on
plot(T,angle(XT))
hold off
xlabel('$t$','Interpreter','latex')
ylabel('$\dot{\tilde{x}}$','Interpreter','latex')