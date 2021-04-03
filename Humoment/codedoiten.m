clc;
close all;
clear;
[image, path] = uigetfile('*.*','Select','MultiSelect','on');
list = strcat(path, image);
[ignore, len] = size(list);
for i=1:len
    img = imread(list{1,i});
    n=num2str(i);
    link=strcat(path,'4-00',n,'-1.png');
    imwrite(img,link);
end