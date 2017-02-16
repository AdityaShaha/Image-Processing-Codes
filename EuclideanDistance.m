% Manually calculating the Euclidean Distance of images and findinf the
% best image. A 'for loop' can also be used to automate the job. 

Im1 = imread('Image01.png');
Im2 = imread('Image02.png');


Im1 = rgb2gray(Im1);
Im2 = rgb2gray(Im2);
%the code for conversion of image to its normalized histogram

hn1 = imhist(Im1)./numel(Im1);
hn2 = imhist(Im2)./numel(Im2);

% Calculate the Euclidean distance
f = sum(sqrt(hn1 - hn2).^2)
