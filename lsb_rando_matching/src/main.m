clc; clear; close all;

% preprocessing

fprintf('Please choose stego and secret img for lsb_full...\n');
simg = rgb2gray(imread('simg.bmp'));
cover = imread('cover.bmp');
[m, n, numChannels] = size(cover);
simg = imbinarize(simg);

if numChannels == 1 
	lsb(simg,cover);
else 
	cover = rgb2gray(cover);
	lsb(simg,cover);
end

%caculate Euclidean distance

% calculate the Ed

% mse && histogram && psnr

figure
histogram(cover,'BinWidth',1);title('stego')
figure
histogram(stego, 'BinWidth', 1);title('stegoimg')
meansquarederror(cover, stego);
