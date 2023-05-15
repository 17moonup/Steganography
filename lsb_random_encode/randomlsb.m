function [stegoimg] = randomlsb(simg,stego)
    
    [m,n] = size(simg);
    [M,N] = size(stego);
    
    if M >= m && N >= n 
        R = randi(255,m,n);
        [T1,T2] = sort(R,'ascend');
        display(T1);
        for i = 1:m
            for j = 1:n
                if simg(i,j) == bitget(stego(T2(i),T2(j)),1)
                    continue;
                elseif simg(i,j) == 0 && bitget(stego(T2(i),T2(j)),1) == 1
                    stego(T2(i),T2(j)) = stego(T2(i),T2(j)) -1;
                elseif simg(i,j) == 1 && bitget(stego(T2(i),T2(j)),1) == 0    
                    stego(T2(i),T2(j)) = stego(T2(i),T2(j)) +1;
                end
            end
        end
    stegoimg = stego;
    imwrite(stegoimg,'stegoimgrando.bmp');
    dlmwrite('randomatrix.txt' , R);
    else 
        fprintf('please check the secret img size¡I');
    end

end