clc;
close all;
clear;
[image, path] = uigetfile('*.*','Select','MultiSelect','on');
list = strcat(path, image);
[ignore, len] = size(list);
for i=1:len
    img = imread(list{1,i});
    n=num2str(i);
    if i<10
    link=strcat(path,'4-00',n,'-1.png');
    end
    if (i<100&&i>=10) link=strcat(path,'4-0',n,'-1.png')
    end
    if i>=100 link=strcat(path,'4-',n,'-1.png')
    end
    imwrite(img,link);
end