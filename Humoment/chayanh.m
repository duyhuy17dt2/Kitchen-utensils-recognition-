clc;
close all;
clear;
[image, path] = uigetfile('*.png','Select','MultiSelect','on');
list = strcat(path, image);
[ignore, len] = size(list);
for i=1:len
    img = imread(list{1,i});
    ten=image{1,i}(1:6);
    ten=strcat(path,ten,'3.png');
    img=imresize(img,[50 50]);
    img=rgb2gray(img);
    for i=1:50
        for j=1:50
            if img(i,j)==0 img(i,j)=0;
            else img(i,j)=255;
            end
        end
    end
    img=logical(img);imwrite(img,ten);
end

