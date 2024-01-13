function p=myfun1(alpha,L,len)
    y=zeros(len,1);
    for i=1:1:len
        eq=@(fai) (L(2)*sin(alpha(i))-L(4)*sin(fai))^2+(1-L(2)*cos(alpha(i))-L(4)*cos(fai))^2-L(3)^2;
        y(i)=fzero(eq,pi/4);
    end
    p=zeros(len,1);
    for m=1:1:len
        if m>=7&&m<=18
            p(m)=y(m-6);
        else 
            p(m)=y(m+12);
        end
    end
end