function [X1 Y1 X2 Y2]=cal_plot(L1,L2,L)
    bool=1;
    x1=L(1);x2=L(2);x3=L(3);x4=L(4);x5=L(5);x6=L(6);
    [num,txt,raw]=xlsread("dynamic_data.xlsx");
    theta1=num(:,2)*pi/180;
    theta2=num(:,3)*pi/180;
    [len,~]=size(num);
    X1=zeros(len,1);
    Y1=zeros(len,1);
    X2=zeros(len,1);
    Y2=zeros(len,1);
    LEN=180;
    alpha0=2*pi/LEN;
    alpha=ones(LEN,1);
    for k=1:1:LEN
        alpha(k)=alpha0*k;
    end
    for i=1:1:len
        X1(i)=-cos(theta1(i))*L1+cos(theta2(i)-theta1(i))*L2;
        Y1(i)=-sin(theta1(i))*L1-sin(theta2(i)-theta1(i))*L2;
    end
    D1=[1;x1;x2;x3];
    alpha1=plotfun1(alpha,D1,LEN);
    D2=[1;x4;x5;x6];
    alpha2=plotfun2(alpha,D2,LEN);
    %检查是否有解不存在
    for j=1:1:LEN
        if isnan(alpha1(j))||isnan(alpha2(j))
            bool=0;
        end
    end
    %如果解存在，则求出距离
    if bool==1
        for i=1:1:LEN
            X2(i)=-cos(alpha1(i))*L1+cos(alpha2(i)-alpha1(i))*L2;
            Y2(i)=-sin(alpha1(i))*L1-sin(alpha2(i)-alpha1(i))*L2;
        end
    end
end

function p=plotfun1(alpha,L,len)
    y=zeros(len,1);
    for i=1:1:len
        eq=@(fai) (L(2)*sin(alpha(i))-L(4)*sin(fai))^2+(1-L(2)*cos(alpha(i))-L(4)*cos(fai))^2-L(3)^2;
        y(i)=fzero(eq,pi/4);
    end
     p=zeros(len,1);
    for m=1:1:len
        if m>=61&&m<=180
            p(m)=y(m-60);
        else 
            p(m)=y(m+120);
        end
    end
end

function p=plotfun2(alpha,L,len)
    y=zeros(len,1);
    for i=1:1:len
        eq=@(fai) (L(2)*sin(alpha(i))-L(4)*sin(fai))^2+(1-L(2)*cos(alpha(i))-L(4)*cos(fai))^2-L(3)^2;
        y(i)=fzero(eq,pi/4);
    end
    p=zeros(len,1);
    for i=1:1:len                                             
        if i>=21&&i<=180
            p(i)=y(i-20);
        else
            p(i)=y(i+160);
        end
    end
end