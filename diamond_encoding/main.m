img = imread('stego.bmp');


[m, n, ~] = size(img);


secret_info = 'Hello World!';


binary_secret = dec2bin(double(secret_info), 8);


num_bits = length(binary_secret);


if m*n*3 < num_bits
    error('?片太小,?法容???量的信息!');
end

diff_mat = randi([0 1], m, n);

for i = 1:num_bits
    
    bit = binary_secret(i);

    if bit == '1'     
        [x1, x2] = find(diff_mat == 0);
        diff_mat(x1, x2) = 1;
        diff_mat(x2, x1) = 1;
    end
end


stego_img = img;
for i = 1:m
    for j = 1:n
        if diff_mat(i, j) == 1
            stego_img(i, j, 1) = bitxor(stego_img(i, j, 1), 1);  
            stego_img(i, j, 2) = bitxor(stego_img(i, j, 2), 1);  
        end
    end
end


figure, subplot(1,2,1), imshow(img), title('');
subplot(1,2,2), imshow(stego_img), title('');