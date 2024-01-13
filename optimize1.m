clear all;
clc;
[num,txt,raw]=xlsread("dynamic_data.xlsx");
L1=52;
L2=93;
x1=0.3540;
x2=0.4738;
x3=0.9491;
x4=0.2284;
x5=1.2804;
x6=0.5727;
L0=[x1;x2;x3;x4;x5;x6];
y=L0;
L=L0;
deta=0.001;
alpha=0.5;
err=1e-6;
iter=0;
while iter<1000&&deta>err
    for j=1:1:6
        step=zeros(6,1);
        step(j)=step(j)+deta;
        %作探测且满足曲柄摇杆条件
        if qbyg(y+step)==1&&calculate(L1,L2,y+step,num)<calculate(L1,L2,y,num)
            y=y+step;
        else if qbyg(y-step)==1&&calculate(L1,L2,y-step,num)<calculate(L1,L2,y,num)
            y=y-step;
        end
        end
    end
    %更新参考点和出发点
    %L为X(k+1),L0为X(k)
    L=y;
    if qbyg(L)==1&&calculate(L1,L2,L,num)<calculate(L1,L2,L0,num)
        y=2*L-L0;
        L0=L;
    elseif deta<err
            disp('found')
            break;
    elseif L==L0
        deta=alpha*deta;
    else
        L=L0;
        y=L0;
    end
    iter=iter+1
    L
end
L
% D=calculate(L1,L2,L)

function x=qbyg(L)
    x=1;
    x1=L(1);x2=L(2);x3=L(3);x4=L(4);x5=L(5);x6=L(6);
    if x1+1>x2+x3||x1>x2||x1>x3||x1>1||x1+x2>1+x3||x1+x3>x2+1
        x=0;
    else if x4+1>x5+x6||x4>x5||x4>x6||x4>1||x4+x5>1+x6||x4+x6>1+x5
        x=0;
    end
    end
end
