function e=getDegree(a,data)
%����ģ�͵�MAPE
%aΪģ�Ͳ�����Ϊ��������dataΪ���ݼ���eΪMAPE

[n,s]=size(data);
Y=data(:,s);%YΪ���ݼ���������ʵֵ���ɵ�������
X=data(:,1:s-1);%XΪ���ݼ��������Ա������ɵľ���
C=ones(1,n);

Y1=[X,C']*a;%Y1Ϊ����ģ������Ĺ���ֵ���ɵ�������
E=(Y1-Y)./Y;
e=100*(sum(abs(E))/n);%�������ֵ
end