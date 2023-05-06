clc; clear; close all;

% preprocessing

fprintf('Please choose stego and secret for lsb_full...');
simg = imbinarize(rgb2gray(imread('simg.bmp')));
stego = rgb2gray(imread('stego.bmp'));

% lsb_full_matching

lsb_full_en(simg, stego);%1080

% lsb_full_720_preprocessing
%ssimg = imbinarize(rgb2gray(imread('ssimg.bmp')));
%sstego = rgb2gray(imread('sstego.bmp'));
%lsb_full_en(ssimg, sstego);%720
stegoimg = imread('stegoimg.bmp');

figure
histogram(stego,'BinWidth',1);
figure
histogram(stegoimg, 'BinWidth', 1);

stego_hist = imhist(stego);
stegoimg_hist = imhist(stegoimg);

diff = abs(stegoimg_hist - stego_hist);
bar(diff);title('diff');

% caculate the Ed
dist = norm(stego_hist - stegoimg_hist);

threshold = 78000;

if dist > threshold
    disp('The image may have been manipulated using LSB replacement algorithm.');
else
    disp('The image is likely to be original, without any LSB replacement manipulation.');
end

% mse && histogram && pnsr

meansquarederror(stego, stegoimg);

detect(stego, stegoimg);

%meansquarederror(sstego, stegoimg);

