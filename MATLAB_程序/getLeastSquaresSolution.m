function X=getLeastSquaresSolution(A,b)
%求解最优最小二乘解
%[A,b]为原不相容方程组的度量矩阵
%X为列向量


[A1,b1]=getConsistentEquations(A,b);%构造其对应的线性方程组方程组

% r=rank(A1);
[n,s]=size(A1);
[M,buff]=changeMatrix(A1,b1);%对度量矩阵做有限次行列初等变换，buff记录了交换列的操作

r=n;
for i=1:n
    if M(i,1:n)==0
       r=i-1;
       break
    end
end

if r==n%如果满秩
    D=M(:,n+1);%得到D
    X=D;
end
if r<n
    B=M(1:r,r+1:n);%得到B
    E=eye(n-r);
    newA=[-B;E];%构造基础解系
    D=M(:,n+1);%构造特解
    Z=getLeastSquaresSolution(newA,-D);%递归，求解新的最优最小二乘解
    X=newA*Z+D;%得到交换了一定次序的最优最小二乘解
end
for col=s:-1:1
    if buff(1,col)~=0
        X=change1(X,col,buff(1,col));%根据buff记录的信息，复原原来的次序
    end
    
end
end




function B=change1(B,i1,i2)
%交换i1，i2行
%format rat;
[n,s]=size(B);
buff=zeros(1,s);
buff=B(i1,:);
B(i1,:)=B(i2,:);
B(i2,:)=buff;
end
