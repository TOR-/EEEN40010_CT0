%% Constants, setup
a=4;
b=6;
c=6;

set(gca, 'defaultTextInterpreter','latex')
%% Problem 1
N1 = [1 0.9*a];
D1 = conv([1 a],[1 a+b+c]);
H1 = tf(N1,D1);
% Determine the poles and zeros of this plant
zeroes = zero(H1)
poles = pole(H1)
% Determine the DC gain of the plant
DC_gain = polyval(N1,0)/polyval(D1,0)
% Predict the steady-state value of response to unit step
% find PFE of tf * L(unit step), L(step) = 1/s
[R,P,K] = residue(N1,conv(D1,[1 0]));
% then pole at 0, i.e. no e^(-pole) in time domain
response_ss = R(P==0)
% Based on the potentially dominant pole what value would you predict for 2% settling time and percentage overshoot?
t_2pc = min(P)
po = R(P==min(P))/response_ss
% Plot the step response 
step(H1)
close all
%print('report/img/p1-step','-dpng');
% and determine the steady-state value,
% the 10% to 90% rise time, 
% the 2% settling time
% and the percentage overshoot
% ALL IN PLOT
% Explain any discrepancies between the predicted and actual values of steady-state value, 2% settling time and the percentage overshoot. 

% Confirm that the step response shows overshoot but no ringing