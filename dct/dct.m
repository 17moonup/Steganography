function dct_matrix = dct(N)
    dct_matrix = zeros(N);
    for k = 0:(N-1)
        for n = 0:(N-1)
            if k == 0
                dct_matrix(k+1, n+1) = sqrt(1/N) * cos((pi * (2*n+1) * k) / (2 * N));
            else
                dct_matrix(k+1, n+1) = sqrt(2/N) * cos((pi * (2*n+1) * k) / (2 * N));
            end
        end
    end
end

