
function [A,b]=getEquationsByData(data)
%根据数据集构造方程组
[n,s]=size(data);
C=ones(n,1);
A=[data(:,1:s-1),C];
b=data(:,s);
end