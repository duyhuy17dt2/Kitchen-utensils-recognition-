A=xlsread('E:\Nam4\KTND\Humoment\mydata4.xlsx');
[image, path] = uigetfile('*.*','Select');
list = strcat(path, image);
M = zeros(1,7);
img = imread(list);
hu_moments_vector_norm = run(img);
M = hu_moments_vector_norm;
d=zeros(1,300);
for i=1:300
    d(i)=sqrt((A(i,1)-M(1))^2+(A(i,2)-M(2))^2+(A(i,3)-M(3))^2+(A(i,4)-M(4))^2+(A(i,5)-M(5))^2+(M(6)-A(i,6))^2+(M(7)-A(i,7))^2);
    if d(i)==0 d(i)=1000000;
    end
end
dmin=min(d);
for i=1:300;
    if dmin==d(i) ketqua=A(i,8);
    end
end
if ketqua==4 disp('lo');
else if ketqua==5 disp('chai');
    else disp('binh');
    end
end