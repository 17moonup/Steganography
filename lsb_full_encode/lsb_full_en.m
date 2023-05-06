function [stegoimg] = lsb_full_en(simg,stego)
    
    [M,N] = size(stego);
    [m,n] = size(simg);
  
    %evaluate the size between stego img && secret img
    
    if m>M || n>N
        simg = imresize(simg,[M,N]);
    end
    
    %lsb_encode
    
    if(n<=N && m<=M)
        for i = 1:m
            for j = 1:n
                if simg(i,j) == bitget(stego(i,j),1)
                    continue;
                elseif simg(i,j) == 0 && bitget(stego(i,j),1) == 1
                    %if odd min 1
                    stego(i,j) = stego(i,j) -1;
                elseif simg(i,j) == 1 && bitget(stego(i,j),1) == 0
                    %if even plus 1
                    stego(i,j) = stego(i,j) +1;
                end
            end
        end
    else
        fprintf('Secret img is too big for stego!!!');
    end
    
stegoimg = stego;
imwrite(stegoimg, 'stegoimg.bmp');

end