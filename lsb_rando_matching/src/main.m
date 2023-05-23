clc; clear; close all;

% preprocessing

simg = imread('simg.bmp');
cover = imread('cover.bmp');
[m, n, numChannels] = size(cover);
if islogical(simg)
    if numChannels == 1 
        randomlsb(simg,cover);
    else 
        cover = rgb2gray(cover);
        randomlsb(simg,cover);
    end
else 
    simg = imbinarize(simg);
    if numChannels == 1 
        randomlsb(simg,cover);
    else 
        cover = rgb2gray(cover);
        randomlsb(simg,cover);
    end
end

%caculate Euclidean distance

% calculate the Ed

% mse && histogram && psnr
