clear
clc
global time;
global Acth;
global shichabiao
time=xlsread('附件1-3','附件3','D4:D24');
Acth=xlsread('附件1-3','附件3','E4:E24');
shichabiao=xlsread('shicha','N1:N365');
nvars=4;
lb=[0 0 0 -0.499999];
ub=[180 90 10 364.4999999];
PopulationSize_Data=200;
MaxGenerations_Data=600;
MaxStallGenerations_Data=150;
fval1=1;
h=waitbar(0,'please wait');
for i=1:100
    [x fval]=gasolve(nvars,lb,ub,PopulationSize_Data,MaxGenerations_Data,MaxStallGenerations_Data);
    if fval<fval1
        fval1=fval;
        x1=x;
    end
    waitbar(i/100,h)
end
delete(h);
x1    %113.1766   31.5238    2.6761   16.5241
fval1    %1.4420e-04