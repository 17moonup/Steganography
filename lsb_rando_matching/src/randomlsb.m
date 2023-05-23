function [stego] = randomlsb(simg,cover)
    
    [m,n] = size(simg);
    [M,N] = size(cover);
    
    if M >= m && N >= n 
        R = randi(255,m,n);
        [T1,T2] = sort(R,'ascend');
        display(T1);
        for i = 1:m
            for j = 1:n
                if simg(i,j) == bitget(cover(T2(i),T2(j)),1)
                    continue;
                elseif simg(i,j) == 0 && bitget(cover(T2(i),T2(j)),1) == 1 && cover(T2(i),T2(j)) ~= 255
                   
                    %if odd min 1
                    
                    tmp = randi([0, 1], 1)*2 - 1;
                    cover(T2(i),T2(j)) = cover(T2(i),T2(j)) + tmp;
                    
                elseif simg(i,j) == 1 && bitget(cover(T2(i),T2(j)),1) == 0 && cover(T2(i),T2(j)) ~= 0
                   
                    %if even plus 1
                    
                    tmp = randi([0, 1], 1)*2 - 1; 
                    cover(T2(i),T2(j)) = cover(T2(i),T2(j)) + tmp;
             
                elseif cover(T2(i),T2(j)) == 255
                    cover(T2(i),T2(j)) = cover(T2(i),T2(j)) - 1;
                elseif cover(T2(i),T2(j)) == 0
                    cover(T2(i),T2(j)) = cover(T2(i),T2(j)) + 1;
                end
            end
        end
       
    end
    stego = cover;
    imwrite(stego,'stegoimgrando.bmp');
    dlmwrite('randomatrix.txt' , R);
end