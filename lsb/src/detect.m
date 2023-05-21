function  detect(cover,stego)

cover_hist = imhist(cover);
stego_hist = imhist(stego);

% caculate the Ed
dist = norm(stego_hist - cover_hist);
diff = abs(stego_hist - cover_hist);
bar(diff);title('diff');

threshold = 78000;

if dist > threshold
    disp('The image may have been manipulated using LSB replacement algorithm.');
else
    disp('The image is likely to be original, without any LSB replacement manipulation.');
end
