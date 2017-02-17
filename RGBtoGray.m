img = imread('Image01.png');
img_gray = rgb2gray(img);

img_gray = img_gray./32;
red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel
% By the method of MEAN
[Y, X, Z] = size(img);
for i = 1:Y
    for j = 1:X
        fimg(i,j) = (red(i,j)+green(i,j)+blue(i,j))/3;
    end
end

% The RGB to Grayscale Equation x = 0.299r + 0.587g + 0.114b
for i = 1:321
    for j = 1:481
        fimg2(i,j) = 0.299*red(i,j)+0.587*green(i,j)+0.114*blue(i,j);
    end
end


imshow(fimg);
imshow(fimg2);
 