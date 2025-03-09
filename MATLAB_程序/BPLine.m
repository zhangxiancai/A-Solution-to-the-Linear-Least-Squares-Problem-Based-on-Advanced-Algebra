
function [a,b]=BPLine(x,y)
a=1;
b=1;
for temp=1:6
    Ea=0;
    Eb=0;
for i=1:temp
    Ea=2*(a*x(i)+b-y(i))+x(i)+Ea;
    Eb=2*(a*x(i)+b-y(i))+1+Eb;    
end
    a=-Ea/temp+a;
    b=-Eb/temp+b;
end

end

