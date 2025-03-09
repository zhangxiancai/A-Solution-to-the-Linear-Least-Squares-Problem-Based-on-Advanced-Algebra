function data=createData()
%产生数据集

 p=[2,3,4];

  for i=1:100
     % x1=100*rand();
     %x1=changeFormat(1,0);
    
   
      
      x2=changeFormat(10*rand(),0);
      x1=changeFormat(2*x2,0);
          x3=changeFormat(10*rand(),0);
     x=[x1,x2,x3]';
     data(i,1)=x1;
     data(i,2)=x2;
     data(i,3)=x3;
     data(i,4)=changeFormat(p*x+5,0);
 end


end