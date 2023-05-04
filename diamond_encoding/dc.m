function compressed_data = dc(data)
    % �N�G������q�A�p��C�q���s��0�M1���ƶq�A�èϥ��p�۽s�X�i�����Y
    data_len = length(data); % ��ƪ�����
    compressed_data = ''; % ���Y�᪺�G����
    i = 1; % ��ƫ���
    while i <= data_len
        % �p��Ÿ���
        j = i + 1;
        while j <= data_len && data(j) == data(i)
            j = j + 1;
        end
        symbol_len = j - i;
        % �ϥ��p�۽s�X�i�����Y
        if symbol_len <= 7
            compressed_data = [compressed_data dec2bin(symbol_len-1, 3)];
        else
            compressed_data = [compressed_data dec2bin(bitshift(symbol_len, -3)-1, 4) dec2bin(bitand(symbol_len, 7)-1, 3)];
        end
        i = j;
    end
end