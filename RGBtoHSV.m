img = imread('Image1.png');
red = im2double(img(:,:,1)); % Red channel
green = im2double(img(:,:,2)); % Green channel
blue = im2double(img(:,:,3)); % Blue channel
% By the method of

for i = 1:321
    for j = 1:481
        var_R = (red(i,j) / 255);                     %RGB from 0 to 255
        var_G = (green(i,j) / 255);
        var_B = (blue(i,j) / 255);
        var_Min = min( [var_R, var_G, var_B] );    %Min. value of RGB
        var_Max = max( [var_R, var_G, var_B] );    %Max. value of RGB
        del_Max = var_Max - var_Min;             %Delta RGB value 

        V(i,j) = var_Max;
        if  del_Max == 0                        %This is a gray, no chroma...
            H(i,j) = 0;                                 %HSV results from 0 to 1
            S(i,j) = 0;
        else                                    %Chromatic data...
            S(i,j) = del_Max / var_Max;
            del_R = ( ( ( var_Max - var_R ) / 6 ) + ( del_Max / 2 ) ); % del_Max
            del_G = ( ( ( var_Max - var_G ) / 6 ) + ( del_Max / 2 ) ); % del_Max
            del_B = ( ( ( var_Max - var_B ) / 6 ) + ( del_Max / 2 ) ); % del_Max

            if   var_R == var_Max  
                H(i,j) = del_B - del_G;
            elseif  var_G == var_Max  
                H(i,j) = ( 1 / 3 ) + del_R - del_B;
            elseif  var_B == var_Max  
                H(i,j) = ( 2 / 3 ) + del_G - del_R;
                if  H(i,j) < 0  
                    H(i,j) =H(i,j)+ 1;
                elseif  H(i,j) > 1  
                    H(i,j) =H(i,j)- 1;
                end
             end
        end
    end
end

HSVImage = cat(3,H,S,V);

imshow(HSVImage);

 