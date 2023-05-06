function  detect(stego,stegoimg)

stego_hist = imhist(stego);
stegoimg_hist = imhist(stegoimg);

% caculate the Ed
dist = norm(stego_hist - stegoimg_hist);

threshold = 202000;

if dist > threshold
    disp('The image may have been manipulated using LSB replacement algorithm.');
else
    disp('The image is likely to be original, without any LSB replacement manipulation.');
end

end