
function [A,b]=getEquationsByData(data)
%�������ݼ����췽����
[n,s]=size(data);
C=ones(n,1);
A=[data(:,1:s-1),C];
b=data(:,s);
end