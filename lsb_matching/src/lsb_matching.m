function [stegoimg] = lsb_full_en(simg,stego)
    
    [M,N] = size(stego);
    [m,n] = size(simg);
  
    %evaluate
    
    if m>M || n>N
        simg = imresize(simg,[M,N]);
        lsb_full_en(simg, stego);
    end
    
    %lsb_encode
    
    rando = zeros(1080,1080);
    if(n<=N && m<=M)
        for i = 1:m
            for j = 1:n
                if simg(i,j) == bitget(stego(i,j),1)
                    continue;
                elseif simg(i,j) == 0 && bitget(stego(i,j),1) == 1 && stego(i,j) ~= 255
                   
                    %if odd min 1
                    
                    tmp = randi([0, 1], 1)*2 - 1;
                    stego(i,j) = stego(i,j) + tmp;
                    rando(i,j) = tmp;
                elseif simg(i,j) == 1 && bitget(stego(i,j),1) == 0 && stego(i,j) ~= 0
                   
                    %if even plus 1
                    
                    tmp = randi([0, 1], 1)*2 - 1;
                    
                    stego(i,j) = stego(i,j) + tmp;
                    rando(i,j) = tmp;
                elseif stego(i,j) == 255
                    stego(i,j) = stego(i,j) - 1;
                elseif stego(i,j) == 0
                    stego(i,j) = stego(i,j) + 1;
                end
            end
        end
    else
        fprintf('Secret img is too big for stego!!!');
    end
    
stegoimg = stego;
imwrite(stegoimg, 'stegoimg.bmp');

end