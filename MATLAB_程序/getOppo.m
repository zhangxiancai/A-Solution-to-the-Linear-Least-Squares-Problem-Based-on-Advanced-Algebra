function oppo=getOppo(x)
%¼ÆËãÄæÐòÊý
oppo=0;
L=length(x);
for i=1:L
    for j=1:i
    if x(j)>x(i)
        oppo=oppo+1;
    end
    end
end
    
