clc ;clear ;close all;
text = 'This is a secret message.'; % 要隱藏的文字
binary_text = reshape(dec2bin(text, 8).'-'0', 1, [])'; % 將文字轉換為二元串
img = imread('stego.bmp'); % 讀取圖像
gray_img = rgb2gray(img); % 將圖像轉換為灰度圖像
compressed_text = dc(binary_text); % 使用鑽石編碼壓縮二元串
compressed_text = double(compressed_text);
compressed_text_len = length(compressed_text); % 壓縮後的二元串的長度
img_size = size(gray_img); % 圖像的大小
img_len = img_size(1) * img_size(2); % 圖像的像素數量
if compressed_text_len > img_len % 確保隱藏的資料不超過圖像的大小
    error('Data too large to embed in image.');
end
gray_img_vec = reshape(gray_img, [], 1); % 將灰度圖像轉換為向量
for i = 1:compressed_text_len % 將壓縮後的二元串嵌入到圖像中
    gray_img_vec(i) = bitset(gray_img_vec(i), 1, compressed_text(i));
end
embedded_img = reshape(gray_img_vec, img_size); % 將嵌入資料後的向量轉換為圖像
imwrite(embedded_img, 'embedde5d_lena.bmp');
gray_img_vec = num2str(gray_img_vec);
dc_de(gray_img_vec);