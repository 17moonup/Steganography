clc;clear; close all;
fprintf('check secret img by full_lsb:');
stegoimg = imread('stego4.bmp');
lsbdecode(stegoimg);