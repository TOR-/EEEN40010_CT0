%% Constants, setup
a=4;
b=6;
c=6;

set(gca, 'defaultTextInterpreter','latex')
close all
%% Problem Two
N = [1 0.9*a];
D = conv([1 a],[1 a+b+c]);
H = tf(N,D);
% Using the method of partial fractions determine the response of this 
% plant to a unit step. 
[R,P,K] = residue(N,conv(D,[1 0]));
response = R(P==0)
% Based on partial fractions explain why the step response shows overshoot.

% Explain also why the dominance by the dominant pole is weak. 

% Estimate the time which must elapse for the component of the transient due to the dominant term to be 20 times greater than the rest of the transient.
% ??????
rest = @(t) R(P==0)+R(P==min(P))*exp(min(P).*t);
dom = @(t) R(P==max(P(P<0)))*exp(max(P(P<0)).*t);
t = 0:1:10;
%dom(t)./rest(t)

% Show that this “time to dominance” is large relative to the expected 2% settling time as predicted by dominant pole theory.