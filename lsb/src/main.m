clc; clear; close all;

% preprocessing

simg = imread('simg.bmp');
cover = imread('cover.bmp');
[m, n, numChannels] = size(cover);
if islogical(simg)
    if numChannels == 1 
        lsb(simg,cover);
    else 
        cover = rgb2gray(cover);
        lsb(simg,cover);
    end
else 
    simg = imbinarize(simg);
    if numChannels == 1 
        lsb(simg,cover);
    else 
        cover = rgb2gray(cover);
        lsb(simg,cover);
    end
end

%caculate Euclidean distance

% calculate the Ed

% mse && histogram && psnr
