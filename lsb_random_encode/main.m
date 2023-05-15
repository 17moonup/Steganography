clc; clear; close all;
fprintf('Please choose stego and secret for lsb_full...');


ssimg = rgb2gray(imread('ssimg.bmp'));
stego = rgb2gray(imread('stego.bmp'));

ssimg = imbinarize(ssimg);
%randomlsb(simg,stego);%equall
randomlsb(ssimg,stego);%small
stegoimgrando = imread('stegoimgrando.bmp');

figure
histogram(stego,'BinWidth',1);
figure
histogram(stegoimgrando, 'BinWidth', 1);

stego_hist = imhist(stego);
stegoimg_hist = imhist(stegoimgrando);

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

meansquarederror(stego, stegoimgrando);
lsbdecode(stegoimgrando);