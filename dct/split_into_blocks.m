function blocks = split_into_blocks(image, block_size)
    [height, width] = size(image);
    blocks = zeros(block_size, block_size, (height/block_size) * (width/block_size));
    count = 1;
    for row = 1:block_size:height
        for col = 1:block_size:width
            blocks(:, :, count) = image(row:(row+block_size-1), col:(col+block_size-1));
            count = count + 1;
        end
    end
end
