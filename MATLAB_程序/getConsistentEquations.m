function [A1,b1]=getConsistentEquations(A,b)
%���ݷ����鹹�����Ӧ�����ݷ�����
A1=A'*A;
b1=A'*b;
end
