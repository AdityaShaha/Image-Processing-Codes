I = imread('Image1.png');

threshRGB = multithresh(I,7);
%Generate thresholds for each plane of the RGB image.

threshForPlanes = zeros(3,7);

for i = 1:3
    threshForPlanes(i,:) = multithresh(I(:,:,i),7);
end
%Process the entire image with the set of threshold values computed from entire image.

value = [0 threshRGB(2:end) 255];

quantRGB = imquantize(I, threshRGB, value);

imshow(quantRGB);

