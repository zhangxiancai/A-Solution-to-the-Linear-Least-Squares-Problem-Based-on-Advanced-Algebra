
function y=pridectPrice(X,a)
%预测房价模型，X为行向量且为自变量，a为为列向量且为参数
y=[X,1]*a;
end