clc; clear; close all;

% preprocessing

fprintf('Please choose stego and secret img for lsb_full...\n');
simg = rgb2gray(imread('simg.bmp'));
stego = rgb2gray(imread('stego.bmp'));
simg = imbinarize(simg);

% lsb 
lsb_full_en(simg, stego);%1080

stegoimg = imread('stegoimg.bmp');

%caculate Euclidean distance

stego_hist = imhist(stego);
stegoimg_hist = imhist(stegoimg);

% calculate the Ed
dist = norm(stego_hist - stegoimg_hist);
diff = abs(stegoimg_hist - stego_hist);
bar(diff);title('diff');

threshold = 78000;

if dist > threshold
    disp('The image may have been manipulated using LSB replacement algorithm.');
else
    disp('The image is likely to be original, without any LSB replacement manipulation.');
end

% mse && histogram && psnr

figure
histogram(stego,'BinWidth',1);title('stego')
figure
histogram(stegoimg, 'BinWidth', 1);title('stegoimg')
meansquarederror(stego, stegoimg);

