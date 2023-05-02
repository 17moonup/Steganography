clc; clear; close all;
% preprocessing
fprintf('Please choose stego and secret for lsb_full...');
simg = rgb2gray(imread('simg.bmp'));
stego = rgb2gray(imread('stego.bmp'));
simg = imbinarize(simg);

% lsb 
%lsb_full_en(simg, stego);%1080
ssimg = imbinarize(rgb2gray(imread('ssimg.bmp')));
sstego = rgb2gray(imread('sstego.bmp'));

lsb_full_en(ssimg, sstego);%720
stegoimg = imread('stegoimg.bmp');

% mse && histogram && ...
%meansquarederror(stego, stegoimg);
meansquarederror(sstego, stegoimg);

