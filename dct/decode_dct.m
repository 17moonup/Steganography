function decoded_secret_blocks = decode_dct(blocks, cover_blocks)
    N = size(blocks, 1);
    dct_mat = dct(N);
    decoded_secret_blocks = zeros(size(blocks));
    for i = 1:size(blocks, 3)
        block_dct = dct_mat * blocks(:, :, i) * dct_mat';
        cover_block_dct = dct_mat * cover_blocks(:, :, i) * dct_mat';
        decoded_secret_block_dct = (block_dct - cover_block_dct);
        decoded_secret_blocks(:, :, i) = dct_mat' * decoded_secret_block_dct * dct_mat;
    end
end