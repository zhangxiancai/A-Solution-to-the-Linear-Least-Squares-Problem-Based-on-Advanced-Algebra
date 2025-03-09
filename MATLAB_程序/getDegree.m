function e=getDegree(a,data)
%计算模型的MAPE
%a为模型参数且为列向量，data为数据集，e为MAPE

[n,s]=size(data);
Y=data(:,s);%Y为数据集中所有真实值构成的列向量
X=data(:,1:s-1);%X为数据集中所有自变量构成的矩阵
C=ones(1,n);

Y1=[X,C']*a;%Y1为根据模型算出的估计值构成的列向量
E=(Y1-Y)./Y;
e=100*(sum(abs(E))/n);%计算代价值
end