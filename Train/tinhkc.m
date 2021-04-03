clc;
A=xlsread('E:\Nam4\KTND\Train\mydata11.xlsx');
d=zeros(1,300);
for i=1:300
    for j=1:300
        if i~=j d(j)=sqrt((A(i,1)-A(j,1))^2+(A(i,2)-A(j,2))^2+(A(i,3)-A(j,3))^2+(A(i,4)-A(j,4))^2+(A(i,5)-A(j,5))^2+(A(i,6)-A(j,6))^2+(A(i,7)-A(j,7))^2);
        else d(j)=10000;
        end
    end
    dmin=min(d);
    for j=1:300;
        if dmin==d(j) A(i,9)=A(j,8);
        end
    end
end
%xlswrite('E:\hoconl\ktnd\Humoment\mydata24.xlsx', A);
B=zeros(3,3);
for i=1:100
        if A(i,9)==4 B(1,1)=B(1,1)+1;
        end
        if A(i,9)==5 B(2,1)=B(2,1)+1;
        end
        if A(i,9)==6 B(3,1)=B(3,1)+1;
        end
end
for i=101:200
        if A(i,9)==4 B(1,2)=B(1,2)+1;
        end
        if A(i,9)==5 B(2,2)=B(2,2)+1;
        end
        if A(i,9)==6 B(3,2)=B(3,2)+1;
        end
end
for i=201:300
        if A(i,9)==4 B(1,3)=B(1,3)+1;
        end
        if A(i,9)==5 B(2,3)=B(2,3)+1;
        end
        if A(i,9)==6 B(3,3)=B(3,3)+1;
        end
end
B