img=imread('gray.tif');
subplot(131);imshow(img);
title('original image');
img=double(img);
[GX,GY]=gradient(img);
GG=sqrt(GX.*GX+GY.*GY);
subplot(132);imshow(GG);
title('gradient');
img_out=img;
[m,n]=size(img);
for i=1:m;
    for j=1:n
        if GG(m,n)>=1
            img_out(m,n)=255;
        else
            img_out(m,n)=0;
        end
    end
end
subplot(133);imshow(img_out,[]);
title('sharpen image');