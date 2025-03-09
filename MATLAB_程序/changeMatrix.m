function [M,buff]=changeMatrix(A1,b1)
%变换度量矩阵,M为变换后的矩阵，buff记录了交换列的操作
% format rat;
[n,s]=size(A1);
M=[A1,b1];%度量矩阵
global  E;
global COL;
global BUFF;
E=10^-7;
COL=0;
BUFF=zeros(1,s);
if n~=s
    error('输入参数格式不对');
end

for numb=1:n
    M=basicChange1(M,numb,n);
end

for col=1:s
    if BUFF(1,col)~=0
        M=colChange1(M,col,BUFF(1,col));%交换两列
    end
end

for numb=1:n
    M=basicChange2(M,numb,n);
end
buff=BUFF;
end





function M=basicChange1(M,numb,n)
%化成行阶梯形的一步
global COL;
global BUFF;
temp=0;
row=numb-COL;
for t=row:n
    if abs(M(t,numb))~=0
        temp=t;%记录第numb列从第row个元素开始算的非零元素的位置
        break;
    end
end

if temp==0
    COL=COL+1;
    return;%第numb列从第row个元素开始全为0，则返回
end


if temp~=row
    M=change1(M,row,t);
    
end
M=change2(M,row,1/M(row,numb));
BUFF(1,numb)=row;%记录阶梯点处元素的行列数
%--------------------------------
if row>=n
    return;
end
for i=row+1:n
    M=change3(M,row,i,-M(i,numb));
end

end

function M=basicChange2(M,numb,n)
%将行阶梯形化成简化阶梯形的一步

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
    return;%如果第numb行全为0就返回
end


for i=1:numb-1
    M=change3(M,numb,i,-M(i,numb));
end
end



function B=change1(B,i1,i2)
%交换i1，i2行
%      format rat;
[n,s]=size(B);
buff=zeros(1,s);
buff=B(i1,:);
B(i1,:)=B(i2,:);
B(i2,:)=buff;
end

function B=change2(B,i,k)
%将第i行乘以k
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
%将i1行乘以k加到i2行上
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
%交换j1，j2列
% format rat;
[n,s]=size(B);
buff=zeros(1,s);
buff=B(:,j1);
B(:,j1)=B(:,j2);
B(:,j2)=buff;
end

