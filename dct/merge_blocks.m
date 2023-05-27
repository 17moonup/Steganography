function image = merge_blocks(blocks, height, width)
    block_size = size(blocks, 1);
    image = zeros(height, width);
    count = 1;
    for row = 1:block_size:height
        for col = 1:block_size:width
            image(row:(row+block_size-1), col:(col+block_size-1)) = blocks(:, :, count);
            count = count + 1;
        end
    end
end