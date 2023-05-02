function [] = meansquarederror (stego, stegoimg)
    % Mean-Squared error between stego && stegoimg
    stego = double(stego);
    stegoimg = double(stegoimg);
    d = stegoimg - stego;
    MSE = sum(d(:).*d(:))/numel(stegoimg);
    display(MSE);
    figure
   
    histogram(d);   
    title('lsbfull');