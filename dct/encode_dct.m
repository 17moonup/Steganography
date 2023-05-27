function encoded_blocks = encode_dct(blocks, secret_blocks, alpha)
    N = size(blocks, 1);
    dct_mat = dct(N);
    encoded_blocks = zeros(size(blocks));
    for i = 1:size(blocks, 3)
        cover_block_dct = dct_mat * blocks(:, :, i) * dct_mat';
        secret_block_dct = dct_mat * secret_blocks(:, :, i) * dct_mat';
        encoded_block_dct = cover_block_dct + alpha * secret_block_dct;
        encoded_blocks(:, :, i) = dct_mat' * encoded_block_dct * dct_mat;
    end
end
