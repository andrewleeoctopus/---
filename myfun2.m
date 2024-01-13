function p=myfun2(alpha,L,len)
    y=zeros(len,1);
    for i=1:1:len
        eq=@(fai) (L(2)*sin(alpha(i))-L(4)*sin(fai))^2+(1-L(2)*cos(alpha(i))-L(4)*cos(fai))^2-L(3)^2;
        y(i)=fzero(eq,pi/4);
    end
    p=zeros(len,1);
    for i=1:1:len                                             
        if i>=3&&i<=18
            p(i)=y(i-2);
        else
            p(i)=y(i+16);
        end
    end
end