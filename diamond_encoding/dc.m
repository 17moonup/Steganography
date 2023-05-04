function compressed_data = dc(data)
    % 將二元串分段，計算每段中連續的0和1的數量，並使用鑽石編碼進行壓縮
    data_len = length(data); % 資料的長度
    compressed_data = ''; % 壓縮後的二元串
    i = 1; % 資料指標
    while i <= data_len
        % 計算符號數
        j = i + 1;
        while j <= data_len && data(j) == data(i)
            j = j + 1;
        end
        symbol_len = j - i;
        % 使用鑽石編碼進行壓縮
        if symbol_len <= 7
            compressed_data = [compressed_data dec2bin(symbol_len-1, 3)];
        else
            compressed_data = [compressed_data dec2bin(bitshift(symbol_len, -3)-1, 4) dec2bin(bitand(symbol_len, 7)-1, 3)];
        end
        i = j;
    end
end