%% Constants, setup
a=4;
b=6;
c=6;

set(gca, 'defaultTextInterpreter','latex')
set(gca, 'FontSize',54)
close all
%% Problem Five
% QUESTION'S ODE
g = 9.81; % m s^-1
A = a+b+2*c;
x_r = a;
C_d = c/2;
A_d = a/3;
fn = @(qin, t, xt) (C_d*A_d*sqrt(2*g))/A*(sqrt(x_r)-sqrt(x_r+xt)) + qin/A;

Q0 = C_d*A_d * sqrt(2*g*x_r);

T0 = 0;
T1 = 40;
XT0 = x_r;

step = [0.001 0.05 0.1:0.2:1];

for i = 1:length(step)
    q0 = Q0 * (step(i));
    f = @(t, xdash) fn(q0, t, xdash);
    [t, y] = ode45(f, [T0 T1], X0);
    plot(t, y, 'DisplayName', strcat('$\tilde{q}_{in} =$',num2str(step(i)),'$\times Q_{in,r}$'))
    hold on
end
title('$\tilde{x}$ for several $\tilde{q}_{in}$', 'Interpreter', 'latex')
xlabel('$t$','Interpreter','latex')
ylabel('$\tilde{x}$','Interpreter','latex')
lgd = legend;
set(lgd, 'Interpreter', 'latex')
set(gca, 'FontSize',18)
%print('report/img/p5-qin','-dpng');

%% LINEARISE IT
close all
fn_lin = @(qin, t, xt) (qin/A) - (C_d*A_d*sqrt(g))/(sqrt(2*x_r)*A)*xt;

step = [0.001 0.1 0.3 0.5];

for i = 1:length(step)
    q0 = Q0 * (step(i));
    f = @(t, xdash) fn(q0, t, xdash);
    [t, y] = ode45(f, [T0 T1], X0);
    fl = @(t, xdash) fn_lin(q0, t, xdash);
    [tl, yl] = ode45(fl, [T0 T1], X0);
    plot(t, y, 'x', 'DisplayName', strcat('Global model: $\tilde{q}_{in} =$',num2str(step(i)),'$\times Q_{in,r}$'))
    hold on
    plot(tl, yl, 'DisplayName', strcat('Local model: $\tilde{q}_{in} =$',num2str(step(i)),'$\times Q_{in,r}$'))
end
title('Local linearised vs global model of $\tilde{x}$ for several $\tilde{q}_{in}$', 'Interpreter', 'latex')
xlabel('$t$','Interpreter','latex')
ylabel('$\tilde{x}$','Interpreter','latex')
lgd = legend;
set(lgd, 'Interpreter', 'latex')
set(gca, 'FontSize',18)
print('report/img/p5-lin','-dpng');