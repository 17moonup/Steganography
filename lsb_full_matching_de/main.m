clc;clear; close all;
fprintf('check secret img by full_lsb:');
stegoimg = imread('stegoimg.bmp');
lsbdecode(stegoimg);