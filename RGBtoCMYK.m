img = imread('Image01.png');
red = im2double(img(:,:,1)); % Red channel
green = im2double(img(:,:,2)); % Green channel
blue = im2double(img(:,:,3)); % Blue channel
% By the method of 
[Y, X, Z] = size(img);
for i = 1:Y
    for j = 1:X
        var_R = (red(i,j)/255);
        var_G = (green(i,j)/255);
        var_B = (blue(i,j)/255);
        var_K(i,j) = 1 - max([var_R,var_G,var_B]);
        var_C(i,j) = (1-var_R-var_K(i,j)) / (1-var_K(i,j));
        var_M(i,j) = (1-var_G-var_K(i,j)) / (1-var_K(i,j));
        var_Y(i,j) = (1-var_B-var_K(i,j)) / (1-var_K(i,j));
    end
end

CMYKImage = cat(3,var_C,var_M,var_Y);

imshow(CMYKImage);
 