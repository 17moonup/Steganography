clc; clear;close all;

cover_image = imread('stego.bmp');
stego_image_gray = imread('stegoimgfull.bmp');

cover_image_gray = rgb2gray(cover_image);

cover_image_down = imresize(cover_image_gray, 0.5);
stego_image_down = imresize(stego_image_gray, 0.5);

hcf_cover = histeq(cover_image_down);
hcf_stego = histeq(stego_image_down);

com_cover = center_of_mass(hcf_cover);
com_stego = center_of_mass(hcf_stego);

diff_hcf = sum(abs(hcf_cover(:) - hcf_stego(:)));
diff_com = abs(com_cover - com_stego);

disp(diff_hcf);
disp(diff_com);

if diff_hcf > threshold_hcf || diff_com > threshold_com
    disp('Steganography detected.');
else
    disp('No steganography detected.');
end