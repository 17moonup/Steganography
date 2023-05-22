function [stego] = lsb_matching(simg,cover)
    
    [M,N] = size(cover);
    [m,n] = size(simg);
  
    %evaluate
    
    if m>M || n>N
        simg = imresize(simg,[M,N]);
        lsb_matching(simg, cover);
    end
    
    %lsb_encode
    
    rando = zeros(1080,1080);
    if(n<=N && m<=M)
        for i = 1:m
            for j = 1:n
                if simg(i,j) == bitget(cover(i,j),1)
                    continue;
                elseif simg(i,j) == 0 && bitget(cover(i,j),1) == 1 && cover(i,j) ~= 255
                   
                    %if odd min 1
                    
                    tmp = randi([0, 1], 1)*2 - 1;
                    cover(i,j) = cover(i,j) + tmp;
                    rando(i,j) = tmp;
                elseif simg(i,j) == 1 && bitget(cover(i,j),1) == 0 && cover(i,j) ~= 0
                   
                    %if even plus 1
                    
                    tmp = randi([0, 1], 1)*2 - 1;
                    
                    cover(i,j) = cover(i,j) + tmp;
                    rando(i,j) = tmp;
                elseif cover(i,j) == 255
                    cover(i,j) = cover(i,j) - 1;
                elseif cover(i,j) == 0
                    cover(i,j) = cover(i,j) + 1;
                end
            end
        end
    else
        fprintf('Secret img is too big for stego!!!');
    end
    
stego = cover;
imwrite(stego, 'stego.bmp');

end