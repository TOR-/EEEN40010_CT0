%% Constants, setup
a=4;
b=6;
c=6;

set(gca, 'defaultTextInterpreter','latex')
close all
%% Problem Three
N1 = [1];
D1 = conv([1 a],[1 a+4*b+3*c]);
H1 = tf(N1,D1);

N2 = [1 a+2*b];
D2 = conv([1 a],[1 a+4*b+3*c]);
H2 = tf(N2,D2);
% In each case use the DC gain formula and the dominant pole theory to predict
% the steady-state value of unit step response,
% the 2% settling time 
% and the percentage overshoot. 

% Using MATLAB find the actual values for these quantities and compare,
% confirming very good agreement in the case of the first plant
% and reasonably good in the case of the second. 
%step(H2)
%print('report/img/p3-h2-step','-dpng');

% Using partial fractions explain why we do not see overshoot in either case and analytically find the step response.
