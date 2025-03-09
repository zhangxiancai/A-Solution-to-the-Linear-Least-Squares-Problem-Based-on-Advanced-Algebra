%计算非列满秩下解的长度和误差
clear all
rest=zeros(3,30);
rest(1,:)=110:10:400;
rese=rest;


data=createData(100,10);
[A,b]=getEquationsByData(data);
getByGradientDescent(data);
getLeastSquaresSolution(A,b);


for i=1:30
    clear data t0 t1 a e
    data=createData(100,100+10*i);
    
  t0=cputime;
  a=getByGradientDescent(data);%求解最优最小二乘解,基于梯度
  t1=cputime-t0;
%   e=getDegree(a,data);
   e=sqrt(a'*a);%长度
   deg=getDegree(a,data);%误差
%     
    t01=cputime;
    [A,b]=getEquationsByData(data);%根据data构建不相容方程组
    a1=getLeastSquaresSolution(A,b);%求解最优最小二乘解,基于高代
    t11=cputime-t01;
    e1=sqrt(a1'*a1);
    deg1=getDegree(a1,data);

  rese(2,i)=e;
    rese(3,i)=e1;
    
      rest(2,i)=deg;
    rest(3,i)=deg1;
end

 plot(rest(1,:),rest(2,:),"--o",rest(1,:),rest(3,:),"-*",'linewidth',1); xlim([100,410]);
 legend("NGDM","AAM","fontsize",14,"fontname","arial",'color','none');
 xlabel("Attribute dimension","fontsize",14,"fontname","arial");ylabel("MAPE/%","fontsize",14,"fontname","arial");set(gca,'color','none');
%  
 figure
 plot(rese(1,:),rese(2,:),"--o",rese(1,:),rese(3,:),"-*",'linewidth',1);xlim([100,410]);
 legend("NGDM","AAM",'Location','northwest',"fontsize",14,"fontname","arial",'color','none');
 xlabel("Attribute dimension","fontsize",14,"fontname","arial");ylabel("Length","fontsize",14,"fontname","arial");set(gca,'color','none');


function data=createData(s,n)
% s 记录数；n 属性数
a=(rand(n+1,1));
datax=10*rand(s,n+1);datax(:,n+1)=1;
datay=datax*a+rand(s,1);
data =[datax(:,1:n),datay];
end