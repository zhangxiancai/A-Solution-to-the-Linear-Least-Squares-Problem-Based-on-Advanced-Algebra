function [A1,b1]=getConsistentEquations(A,b)
%根据方程组构造其对应的相容方程组
A1=A'*A;
b1=A'*b;
end
