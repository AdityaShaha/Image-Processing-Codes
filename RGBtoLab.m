img = imread('Image1.png');
red = im2double(img(:,:,1)); % Red channel
green = im2double(img(:,:,2)); % Green channel
blue = im2double(img(:,:,3)); % Blue channel
% Converting RGB to XYZ

for i = 1:321
    for j = 1:481
        var_R = ( red(i,j) / 255 );        
        var_G = ( green(i,j) / 255 );        
        var_B = ( blue(i,j) / 255 );
        if  var_R > 0.04045  
            var_R = ( ( var_R + 0.055 ) / 1.055 ) ^ 2.4;
        else
            var_R = var_R / 12.92;
        end
        if  var_G > 0.04045
            var_G = ( ( var_G + 0.055 ) / 1.055 ) ^ 2.4;
        else
            var_G = var_G / 12.92;
        end
        if  var_B > 0.04045  
            var_B = ( ( var_B + 0.055 ) / 1.055 ) ^ 2.4;
        else
            var_B = var_B / 12.92;
        end
        var_R = var_R * 100;
        var_G = var_G * 100;
        var_B = var_B * 100;
        
        %Observer. = 2°, Illuminant = D65
        X(i,j) = var_R * 0.4124 + var_G * 0.3576 + var_B * 0.1805;
        Y(i,j) = var_R * 0.2126 + var_G * 0.7152 + var_B * 0.0722;
        Z(i,j) = var_R * 0.0193 + var_G * 0.1192 + var_B * 0.9505;
        
    end
end


Xd = im2double(X);
Yd = im2double(Y);
Zd = im2double(Z);

ref_X =  95.047;
ref_Y = 100.000;
ref_Z = 108.883;

for i = 1:321
    for j = 1:481
        var_X = Xd(i,j) / ref_X;       %ref_X =  95.047   Observer= 2°, Illuminant= D65
        var_Y = Yd(i,j) / ref_Y;       %ref_Y = 100.000
        var_Z = Zd(i,j) / ref_Z;       %ref_Z = 108.883

        if var_X > 0.008856  
            var_X = var_X ^ ( 1/3 );
        else
            var_X = ( 7.787 * var_X ) + ( 16 / 116 );
        end
        if var_Y > 0.008856 
            var_Y = var_Y ^ ( 1/3 );
        else
            var_Y = ( 7.787 * var_Y ) + ( 16 / 116 );
        end
        if var_Z > 0.008856  
            var_Z = var_Z ^ ( 1/3 );
        else
            var_Z = ( 7.787 * var_Z ) + ( 16 / 116 );
        end

        L(i,j) = (116 * var_Y) - 16;
        A(i,j) = 500 * ( var_X - var_Y );
        B(i,j) = 200 * ( var_Y - var_Z );


    end
end

LabImage = cat(3, L, A, B);

imshow(LabImage);
 