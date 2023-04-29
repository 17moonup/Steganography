function[simg] = lsbdecode(stegoimg)
[m,n] = size(stegoimg);
simg = zeros(m,n);
for i = 1:m
    for j = 1:n
        if bitget(stegoimg(i,j),1) == 1
            simg(i,j) = 255;
        else
            continue;
        end
    end
end
imwrite(simg,'simg.bmp');
end