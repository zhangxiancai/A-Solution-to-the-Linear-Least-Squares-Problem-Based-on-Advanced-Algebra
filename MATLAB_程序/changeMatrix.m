function [M,buff]=changeMatrix(A1,b1)
%�任��������,MΪ�任��ľ���buff��¼�˽����еĲ���
% format rat;
[n,s]=size(A1);
M=[A1,b1];%��������
global  E;
global COL;
global BUFF;
E=10^-7;
COL=0;
BUFF=zeros(1,s);
if n~=s
    error('���������ʽ����');
end

for numb=1:n
    M=basicChange1(M,numb,n);
end

for col=1:s
    if BUFF(1,col)~=0
        M=colChange1(M,col,BUFF(1,col));%��������
    end
end

for numb=1:n
    M=basicChange2(M,numb,n);
end
buff=BUFF;
end





function M=basicChange1(M,numb,n)
%�����н����ε�һ��
global COL;
global BUFF;
temp=0;
row=numb-COL;
for t=row:n
    if abs(M(t,numb))~=0
        temp=t;%��¼��numb�дӵ�row��Ԫ�ؿ�ʼ��ķ���Ԫ�ص�λ��
        break;
    end
end

if temp==0
    COL=COL+1;
    return;%��numb�дӵ�row��Ԫ�ؿ�ʼȫΪ0���򷵻�
end


if temp~=row
    M=change1(M,row,t);
    
end
M=change2(M,row,1/M(row,numb));
BUFF(1,numb)=row;%��¼���ݵ㴦Ԫ�ص�������
%--------------------------------
if row>=n
    return;
end
for i=row+1:n
    M=change3(M,row,i,-M(i,numb));
end

end

function M=basicChange2(M,numb,n)
%���н����λ��ɼ򻯽����ε�һ��

if numb==1
    return;
end

s=n;
temp=0;
for j=1:s
    if M(numb,j)~=0
        temp=1;
        break;
    end
end
if temp==0
    return;%�����numb��ȫΪ0�ͷ���
end


for i=1:numb-1
    M=change3(M,numb,i,-M(i,numb));
end
end



function B=change1(B,i1,i2)
%����i1��i2��
%      format rat;
[n,s]=size(B);
buff=zeros(1,s);
buff=B(i1,:);
B(i1,:)=B(i2,:);
B(i2,:)=buff;
end

function B=change2(B,i,k)
%����i�г���k
%format rat;
global E;
[n,s]=size(B);
for j=1:s
    buff =k*B(i,j);
    if abs(buff-1)<E
        buff=1;
    end
    if abs(buff-0)<E
        buff=0;
    end
    B(i,j)=buff;
end


end


function B=change3(B,i1,i2,k)
%��i1�г���k�ӵ�i2����
% format rat;
global E;
[n,s]=size(B);
for col=1:s
    buff=k*B(i1,col)+B(i2,col);
    if abs(buff-1)<E
        buff=1;
    end
    if abs(buff-0)<E
        buff=0;
    end
    B(i2,col)=buff;
end

end

function B=colChange1(B,j1,j2)
%����j1��j2��
% format rat;
[n,s]=size(B);
buff=zeros(1,s);
buff=B(:,j1);
B(:,j1)=B(:,j2);
B(:,j2)=buff;
end

