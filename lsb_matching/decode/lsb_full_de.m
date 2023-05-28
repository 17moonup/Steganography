function[simg] = lsb_full_de(stego)
[m,n] = size(stego);
simg = zeros(m,n);
for i = 1:m
    for j = 1:n
        if bitget(stego(i,j),1) == 1
            simg(i,j) = 255;
        else
            continue;
        end
    end
end
imwrite(simg,'simg.bmp');
end