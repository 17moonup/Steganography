function[simg] = lsbdecode(stego)
[m,n] = size(stego);

% create a 0 img

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