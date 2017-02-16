I = imread('Image1.png');

threshForPlanes = zeros(3,7);

for i = 1:3
    threshForPlanes(i,:) = multithresh(I(:,:,i),7);
end
%Process the entire image with the set of threshold values computed from entire image.

%Process each RGB plane separately using the threshold vector computed from the given plane. Quantize each RGB plane using threshold vector generated for that plane.

quantPlane = zeros( size(I) );

for i = 1:3
    value = [0 threshForPlanes(i,2:end) 255];
    quantPlane(:,:,i) = imquantize(I(:,:,i),threshForPlanes(i,:),value);
end

quantPlane = uint8(quantPlane);

imshow(quantPlane);

