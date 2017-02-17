img = im2double(imread('Image01.png'));
red = im2double(img(:,:,1)); % Red channel
green = im2double(img(:,:,2)); % Green channel
blue = im2double(img(:,:,3)); % Blue channel
% By the method of
[Y, X, Z] = size(img);
for i = 1:Y
    for j = 1:X
        var_R = red(i,j);                     %RGB from 0 to 255
        var_G = green(i,j);
        var_B = blue(i,j);
        var_Min = min( [var_R, var_G, var_B] );    %Min. value of RGB
        
        I(i,j) = var_Min/double(3);
        if  I(i,j) > 0                       
            S(i,j) = 1-(double(var_Min)/double(I(i,j)));
        else                                    %Chromatic data...
            S(i,j) = 0;
        end
            
        if  var_G >= var_B 
            H(i,j) = acos((var_R - ((1/2)*var_G) - ((1/2)*var_B))./sqrt((var_R^2)+(var_G^2)+(var_B^2)-(var_B*var_G)-(var_B*var_R)-(var_R*var_G)));
        else
            H(i,j) =2*pi - acos((var_R - ((1/2)*var_G) - ((1/2)*var_B))./sqrt((var_R^2)+(var_G^2)+(var_B^2)-(var_B*var_G)-(var_B*var_R)-(var_R*var_G)));
            
         end
             
        
    end
end

HSIImage = cat(3,H,S,I);

imshow(HSIImage);

 