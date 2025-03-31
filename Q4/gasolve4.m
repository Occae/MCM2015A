function [x,fval,exitflag,output,population,score] = gasolve4(nvars,lb,ub,PopulationSize_Data,MaxGenerations_Data,MaxStallGenerations_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'PopulationSize', PopulationSize_Data);
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'MaxStallGenerations', MaxStallGenerations_Data);
options = optimoptions(options,'Display', 'off');
[x,fval,exitflag,output,population,score] = ...
ga(@fit4,nvars,[],[],[],[],lb,ub,[],[],options);
