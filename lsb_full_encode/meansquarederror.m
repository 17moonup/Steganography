function [] = meansquarederror (stego, stegoimg)
    % Mean-Squared error between stego && stegoimg
    stego = double(stego);
    stegoimg = double(stegoimg);
    d = stegoimg - stego;
    MSE = immse(stego, stegoimg);
    display(MSE);
    max_val = 1;
    figure
    histogram(d,'BinWidth',255);
    PSNR=10 * log10((max_val^2) / MSE);
    display(PSNR); 