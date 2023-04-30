clc; clear; close all;
fprintf('Please choose stego and secret for lsb_full...');
secret = rgb2gray(imread('ssimg.bmp'));
stego = rgb2gray(imread('stego.bmp'));
%figure
simg = imbinarize(secret);
%histogram(stego);
%lsben(simg, stego);
%stegoimg = imread('stegoimg.bmp');
%figure
%histogram(stegoimg);
%meansquarederror(stego, stegoimg);
randomlsb(simg,stego);