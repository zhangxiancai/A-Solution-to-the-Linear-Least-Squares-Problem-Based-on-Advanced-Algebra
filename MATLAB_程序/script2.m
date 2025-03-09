%不同属性占比
clear all
rest=zeros(3,5);
rest(1,:)=[0.1 0.2 0.5 0.8 0.9];
weidu=[20 30 60 120 180;180 120 60 30 20];
data=createData(1000,10);
[A,b]=getEquationsByData(data);
getByGradientDescent(data);
getLeastSquaresSolution(A,b);
for i=1:5
    clear data t0 t1 a e
    data=createData(5*weidu(2,i),5*weidu(1,i)-1);
    

    t01=cputime;
    [A,b]=getEquationsByData(data);%根据data构建不相容方程组
    a1=getLeastSquaresSolution(A,b);%求解最优最小二乘解,基于高代
    t11=cputime-t01;
 
  rest(2,i)=t11;

end
 figure
 plot(rest(1,:),rest(2,:),"-*",'linewidth',1); xlim([0,1]);
xlabel("Ratio","fontsize",14,"fontname","arial");ylabel("Time/s","fontsize",14,"fontname","arial");set(gca,'color','none');




function data=createData(s,n)
% s 记录数；n 属性数
a=(rand(n+1,1));
datax=10*rand(s,n+1);datax(:,n+1)=1;
datay=datax*a+rand(s,1);
data =[datax(:,1:n),datay];
end