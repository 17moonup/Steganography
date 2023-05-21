clc; clear; close all;
fprintf('check secret img by full_lsb:');
stego = imread('stego.bmp');
lsbdecode(stego);