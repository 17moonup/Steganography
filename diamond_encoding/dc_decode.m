function decoded_data = dc_de(compressed_data)
    % �ϥ��p�۽s�X�i��ѽX
    data_len = length(compressed_data); % ���Y�᪺�G���ꪺ����
    decoded_data = ''; % �ѽX�᪺�G����
    i = 1; % ��ƫ���
    while i <= data_len
        % Ū���Ÿ���
        if compressed_data(i) == '0'
            symbol_len = 1;
            i = i + 1;
        else
            symbol_len = bin2dec(compressed_data(i+1:i+3)) + 8;
            i = i + 4;
        end
        % ���ͲŸ�
        if compressed_data(i) == '0'
            symbol = repmat('0', 1, symbol_len);
        else
            symbol = repmat('1', 1, symbol_len);
        end
        decoded_data = [decoded_data symbol];
        i = i + 1;
    end
end