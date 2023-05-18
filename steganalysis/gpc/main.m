clc;clear;close all;
stegoimg = imread('stegoimg0.9.bmp');
[m, n, numChannles] = size(stegoimg);
if numChannles == 1
    gpc(stegoimg,m,n);
else
    stegoimg = rgb2gray(stegoimg);
    gpc(stegoimg,m,n);
end

x_train = [0, 0.1,0.2,0.4,0.5,0.8,0.9,1];
y_train = [1, 1.0027, 1.0137, 1.0487, 1.4375,1.5837,1.9975, 3.0118];

model = fitlm(y_train,x_train);
y_pred = ans;
x_pred = predict(model, y_pred);

disp(model);
disp(x_pred);