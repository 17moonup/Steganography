clc ;clear ;close all;
text = 'This is a secret message.'; % �n���ê���r
binary_text = reshape(dec2bin(text, 8).'-'0', 1, [])'; % �N��r�ഫ���G����
img = imread('stego.bmp'); % Ū���Ϲ�
gray_img = rgb2gray(img); % �N�Ϲ��ഫ���ǫ׹Ϲ�
compressed_text = dc(binary_text); % �ϥ��p�۽s�X���Y�G����
compressed_text = double(compressed_text);
compressed_text_len = length(compressed_text); % ���Y�᪺�G���ꪺ����
img_size = size(gray_img); % �Ϲ����j�p
img_len = img_size(1) * img_size(2); % �Ϲ��������ƶq
if compressed_text_len > img_len % �T�O���ê���Ƥ��W�L�Ϲ����j�p
    error('Data too large to embed in image.');
end
gray_img_vec = reshape(gray_img, [], 1); % �N�ǫ׹Ϲ��ഫ���V�q
for i = 1:compressed_text_len % �N���Y�᪺�G����O�J��Ϲ���
    gray_img_vec(i) = bitset(gray_img_vec(i), 1, compressed_text(i));
end
embedded_img = reshape(gray_img_vec, img_size); % �N�O�J��ƫ᪺�V�q�ഫ���Ϲ�
imwrite(embedded_img, 'embedde5d_lena.bmp');
gray_img_vec = num2str(gray_img_vec);
dc_de(gray_img_vec);