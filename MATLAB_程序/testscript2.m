%不同属性数的时间开销及MAPE
clear all
rest=zeros(3,40);
rest(1,:)=10:10:400;
rese=rest;

data=createData(1000,10);
[A,b]=getEquationsByData(data);
getByGradientDescent(data);
getLeastSquaresSolution(A,b);
for i=1:40
    clear data t0 t1 a e
    data=createData(1000,10*i);
    t0=cputime; 
    a=getByGradientDescent(data);%求解最优最小二乘解,基于梯度
    t1=cputime-t0;
    e=getDegree(a,data);
    %
    t01=cputime;
    [A,b]=getEquationsByData(data);%根据data构建不相容方程组
    a1=getLeastSquaresSolution(A,b);%求解最优最小二乘解,基于高代
    t11=cputime-t01;
    e1=getDegree(a1,data);
    
    rest(2,i)=t1;
    rest(3,i)=t11;
    rese(2,i)=e;
    rese(3,i)=e1;
end
plot(rest(1,:),rest(2,:),"--o",rest(1,:),rest(3,:),"-*");xlim([0,410]);
legend("NGDM","AAM","fontsize",14,'Location','northwest',"fontname","arial",'color','none'); 
xlabel("Attribute dimension","fontsize",14,"fontname","arial");ylabel("Time/s","fontsize",14,"fontname","arial");set(gca,'color','none');
figure
plot(rese(1,:),rese(2,:),"--o",rese(1,:),rese(3,:),"-*");xlim([0,410]);
legend("NGDM","AAM","fontsize",14,"fontname","arial",'color','none'); 
xlabel("Attribute dimension","fontsize",14,"fontname","arial");ylabel("MAPE/%","fontsize",14,"fontname","arial");set(gca,'color','none');


function data=createData(s,n)
% s 记录数；n 属性数
a=(rand(n+1,1));
datax=10*rand(s,n+1);datax(:,n+1)=1;
datay=datax*a+rand(s,1);
data =[datax(:,1:n),datay];
end