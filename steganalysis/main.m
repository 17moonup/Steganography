clc;clear;close all;
stegoimg = imread('stegoimgrando.bmp');
[m, n, numChannles] = size(stegoimg);
if numChannles == 1
    gpc(stegoimg,m,n);
else
    stegoimg = rgb2gray(stegoimg);
    gpc(stegoimg,m,n);
end
x = [1.0389,1.0077,0.9897];
y = [0,0.5,1];
plot(y,x);