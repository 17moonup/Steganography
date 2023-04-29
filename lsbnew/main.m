fprintf('Please choose stego and secret for lsb_full');
secret = rgb2gray(imread('simg.bmp'));
stego = rgb2gray(imread('stego.bmp'));
lsben(secret, stego);