clc; clear; close all;

% preprocessing

simg =  rgb2gray(imread('simg.bmp'));
cover = rgb2gray(imread('cover.bmp'));

block_size = 8;
cover_blocks = split_into_blocks(cover, block_size);
secret_blocks = split_into_blocks(simg, block_size);

alpha = 0.1;  % �i?�㪺??�A�Τ_����K?���b?�^?������?��
encoded_blocks = encode_dct(cover_blocks, secret_blocks, alpha);
decoded_secret_blocks = decode_dct(encoded_blocks, cover_blocks);

[height, width] = size(cover);
encoded_image = uint8(merge_blocks(encoded_blocks, height, width));
decoded_secret_image = uint8(merge_blocks(decoded_secret_blocks, height,width));

% �O�s??��?�^?���M��?�����K?��
imwrite(encoded_image, 'encoded_image.jpg');
imwrite(decoded_secret_image, 'decoded_secret_image.jpg');