for i = 1:3 % Change the iteration to the number of images to be tested
    bestmatch = 10000;
    bestmatchname = 'none';
    s1 = 'Image0';
    i1 = int2str(i);
    Imn1 = strcat(s1,i1,'.png')
    Im1 = imread(Imn1);
    Im1 = rgb2gray(Im1);
    for j = i+1 :3 % Change the iteration to the number of images to be tested
       
        i2 = j;
        i2 = int2str(i2);
        
        Imn2 = strcat(s1,i2,'.png')
        Im2 = imread(Imn2);


        
        Im2 = rgb2gray(Im2);
        %the code for conversion of image to its normalized histogram

        hn1 = imhist(Im1)./numel(Im1);
        hn2 = imhist(Im2)./numel(Im2);

        % Calculate the Euclidean distance
        f = sum(sqrt(hn1 - hn2).^2)
        if f < bestmatch
            bestmatch = f;
            bestmatchname = Imn2;
        end
    end
    bestmatch
    bestmatchname
end

 