function [D]=calculate(L1,L2,L,num)
    bool=1;
    x1=L(1);x2=L(2);x3=L(3);x4=L(4);x5=L(5);x6=L(6);
    % [num,txt,raw]=xlsread("dynamic_data.xlsx");
    theta1=num(:,2)*pi/180;
    theta2=num(:,3)*pi/180;
    [len,~]=size(num);
    X1=zeros(len,1);
    Y1=zeros(len,1);
    X2=zeros(len,1);
    Y2=zeros(len,1);
    alpha0=pi/9;
    alpha=ones(len,1);
    for k=1:1:len
        alpha(k)=alpha0*k;
    end
    for i=1:1:len
        X1(i)=-cos(theta1(i))*L1+cos(theta2(i)-theta1(i))*L2;
        Y1(i)=-sin(theta1(i))*L1-sin(theta2(i)-theta1(i))*L2;
    end
    D1=[1;x1;x2;x3];
    alpha1=myfun1(alpha,D1,len);
    D2=[1;x4;x5;x6];
    alpha2=myfun2(alpha,D2,len);
    %检查是否有解不存在
    for j=1:1:len
        if isnan(alpha1(j))||isnan(alpha2(j))
            bool=0;
        end
    end
    %如果解存在，则求出距离
    if bool==1
        for i=1:1:len
            X2(i)=-cos(alpha1(i))*L1+cos(alpha2(i)-alpha1(i))*L2;
            Y2(i)=-sin(alpha1(i))*L1-sin(alpha2(i)-alpha1(i))*L2;
        end
        d=zeros(len,1);
        D=0;
        for i=1:1:len
            d(i)=sqrt((X1(i)-X2(i))^2+(Y1(i)-Y2(i))^2);
            D=D+d(i);
        end
        D=D/len;
    %如果解不存在，则给距离赋大值
    else
        D=inf;
    end
end
