clear  
clc  
 
nvars=4;  
lb=zeros(1,4);  
ub=[];  
A=[-1,-1,0,0;0,0,-1,-1;3,2,0,0;0,3,0,2];  
b=[-30,-30,120,48]';  
Aeq=[];  
beq=[];  
options=gaoptimset('paretoFraction',0.3,'populationsize',200,'generations',300,'TolFun',1e-8,'PlotFcns',@gaplotpareto);  
[x,fval]=gamultiobj(@fun,nvars,A,b,Aeq,beq,lb,ub,options) 