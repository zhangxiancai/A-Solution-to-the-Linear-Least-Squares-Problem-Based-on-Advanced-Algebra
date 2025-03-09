function X=getLeastSquaresSolution(A,b)
%���������С���˽�
%[A,b]Ϊԭ�����ݷ�����Ķ�������
%XΪ������


[A1,b1]=getConsistentEquations(A,b);%�������Ӧ�����Է����鷽����

% r=rank(A1);
[n,s]=size(A1);
[M,buff]=changeMatrix(A1,b1);%�Զ������������޴����г��ȱ任��buff��¼�˽����еĲ���

r=n;
for i=1:n
    if M(i,1:n)==0
       r=i-1;
       break
    end
end

if r==n%�������
    D=M(:,n+1);%�õ�D
    X=D;
end
if r<n
    B=M(1:r,r+1:n);%�õ�B
    E=eye(n-r);
    newA=[-B;E];%���������ϵ
    D=M(:,n+1);%�����ؽ�
    Z=getLeastSquaresSolution(newA,-D);%�ݹ飬����µ�������С���˽�
    X=newA*Z+D;%�õ�������һ�������������С���˽�
end
for col=s:-1:1
    if buff(1,col)~=0
        X=change1(X,col,buff(1,col));%����buff��¼����Ϣ����ԭԭ���Ĵ���
    end
    
end
end




function B=change1(B,i1,i2)
%����i1��i2��
%format rat;
[n,s]=size(B);
buff=zeros(1,s);
buff=B(i1,:);
B(i1,:)=B(i2,:);
B(i2,:)=buff;
end
