img = imread('Image03.png');
red = im2double(img(:,:,1)); % Red channel
green = im2double(img(:,:,2)); % Green channel
blue = im2double(img(:,:,3)); % Blue channel
[Y, X, Z] = size(img);
% By the method of 
%for i = 1:Y
    %for j = 1:X
        %var_C(i,j) = 1- (red(i,j)/255);
        %var_M(i,j) = 1- (green(i,j)/255);
        %var_Y(i,j) = 1 -(blue(i,j)/255);
        
    %end
%end

var_C = 1 - red;
var_M = 1 - green;
var_Y = 1 - blue;
CMYImage = cat(3,var_C,var_M,var_Y);

%imshow(img);
imwrite(CMYImage,'CMYImage-3.png');
imshow(CMYImage);
 