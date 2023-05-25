function [com] = center_of_mass(img)

img = im2double(img);
[x,y] = meshgrid(1:size(img,2), 1:size(img,1));
x_sum = sum(sum(x.*img));
y_sum = sum(sum(y.*img));
mass_sum = sum(sum(img));
com = [x_sum/mass_sum, y_sum/mass_sum];

end