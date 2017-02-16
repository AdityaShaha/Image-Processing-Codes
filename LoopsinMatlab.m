for i = 1:3
 for j = i+1:3
    i = int2str(i);
    s1 = 'Image0';
    Imn1 = strcat(s1,i,'.png')
    Imn2 = strcat(s1,j,'.png')
 end
end