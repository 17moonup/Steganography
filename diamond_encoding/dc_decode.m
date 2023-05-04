function decoded_data = dc_de(compressed_data)
    % 使用鑽石編碼進行解碼
    data_len = length(compressed_data); % 壓縮後的二元串的長度
    decoded_data = ''; % 解碼後的二元串
    i = 1; % 資料指標
    while i <= data_len
        % 讀取符號數
        if compressed_data(i) == '0'
            symbol_len = 1;
            i = i + 1;
        else
            symbol_len = bin2dec(compressed_data(i+1:i+3)) + 8;
            i = i + 4;
        end
        % 產生符號
        if compressed_data(i) == '0'
            symbol = repmat('0', 1, symbol_len);
        else
            symbol = repmat('1', 1, symbol_len);
        end
        decoded_data = [decoded_data symbol];
        i = i + 1;
    end
end