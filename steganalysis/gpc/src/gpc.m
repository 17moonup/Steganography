function [r] = gpc(stegoimg, m, n)
    a = 0; % p0 N0
    b = 0; % p1 N1
    tic;
    for i = 1:m-1
        for j = 1:n-1
            
            % compare (i,j) with (i,j+1)
            
            if (mod(stegoimg(i,j), 2) == 0 && mod(stegoimg(i,j+1),2) == 1)
                if (stegoimg(i,j) > stegoimg(i,j+1))
                    a = a + 1;
                else 
                    b = b + 1;
                end
            elseif (mod(stegoimg(i,j), 2) == 1 && mod(stegoimg(i,j+1),2) == 0)
                if (stegoimg(i,j) > stegoimg(i,j+1))
                    b = b + 1;
                else
                    a = a + 1;
                end
            else
                continue;
            end
            
            % compare (i,j) with (i+1,j)    
            
            if (mod(stegoimg(i,j), 2) == 0 && mod(stegoimg(i+1,j),2) == 1)
                if (stegoimg(i,j) > stegoimg(i+1,j))
                    a = a + 1;
                else 
                    b = b + 1;
                end
                
            elseif (mod(stegoimg(i,j), 2) == 1 && mod(stegoimg(i+1,j),2) == 0)
                if (stegoimg(i,j) > stegoimg(i+1,j))
                    b = b + 1;
                else
                    a = a + 1;
                end
            else
                continue;
            end
            
            if (mod(stegoimg(i,j), 2) == 0 && mod(stegoimg(i+1,j+1),2) == 1)
                if (stegoimg(i,j) > stegoimg(i+1,j+1))
                    a = a + 1;
                else 
                    b = b + 1;
                end
                
            elseif (mod(stegoimg(i,j), 2) == 1 && mod(stegoimg(i+1,j+1),2) == 0)
                if (stegoimg(i,j) > stegoimg(i+1,j+1))
                    b = b + 1;
                else
                    a = a + 1;
                end
            else
                continue;
            end
        
        end
    end
t = toc;
r = b/a;   
disp(a);
disp(b);
disp(r);
disp(['Program running time: ', num2str(t), ' seconds']);
end
