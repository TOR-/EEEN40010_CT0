%% Constants, setup
a=4;
b=6;
c=6;

set(gca, 'defaultTextInterpreter','latex')
close all
%% Problem Three
N1 = [1];
D1 = conv([1 a],[1 a+4*b+3*c]);
G1 = tf(N1,D1);

N2 = [1 a+2*b];
D2 = conv([1 a],[1 a+4*b+3*c]);
G2 = tf(N2,D2);
% In each case use the DC gain formula and the dominant pole theory to predict
% the steady-state value of unit step response,
% the 2% settling time 
t_s1 = -4/max(pole(G1));
t_s2 = -4/max(pole(G2));
% and the percentage overshoot. 

% Using MATLAB find the actual values for these quantities and compare,
% confirming very good agreement in the case of the first plant
% and reasonably good in the case of the second. 
%step(G1)
%hold on
%step(G2)
%title("Step responses of $G_1$ and $G_2$", "Interpreter", "latex")
%print('report/img/p3-step','-dpng');

% Using partial fractions explain why we do not see overshoot in either case 
[r1,p1,k1] = residue(N1,D1);
[r2,p2,k2] = residue(N2,D2);

% and analytically find the step response.
[r1,p1,k1] = residue(N1,conv(D1,[1 0]))
[r2,p2,k2] = residue(N2,conv(D2,[1 0]))
