function decoded_image = dc_de(compressed_data)
    % 解析壓縮後的二元串
    data_len = length(compressed_data); % 壓縮後的二元串的長度
    rows = bin2dec(compressed_data(1:8)); % 圖像的行數
    cols = bin2dec(compressed_data(9:16)); % 圖像的列數
    data = compressed_data(17:end); % 圖像數據
    % 使用鑽石編碼進行解碼
    decoded_data = diamond_decode(data);
    % 將解碼後的二元串轉換為數字
    num_data = bin2dec(reshape(decoded_data, 8, []).');
    % 將數字轉換為圖像數據
    image_data = reshape(num_data, rows, cols);
    % 將圖像數據轉換為圖像
    decoded_image = uint8(image_data);
end