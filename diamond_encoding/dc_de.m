function decoded_image = dc_de(compressed_data)
    % �ѪR���Y�᪺�G����
    data_len = length(compressed_data); % ���Y�᪺�G���ꪺ����
    rows = bin2dec(compressed_data(1:8)); % �Ϲ������
    cols = bin2dec(compressed_data(9:16)); % �Ϲ����C��
    data = compressed_data(17:end); % �Ϲ��ƾ�
    % �ϥ��p�۽s�X�i��ѽX
    decoded_data = diamond_decode(data);
    % �N�ѽX�᪺�G�����ഫ���Ʀr
    num_data = bin2dec(reshape(decoded_data, 8, []).');
    % �N�Ʀr�ഫ���Ϲ��ƾ�
    image_data = reshape(num_data, rows, cols);
    % �N�Ϲ��ƾ��ഫ���Ϲ�
    decoded_image = uint8(image_data);
end