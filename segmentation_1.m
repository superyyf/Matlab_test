img=imread('rice.tif');
subplot(221);imshow(img);
title('original image');
subplot(222);imhist(img);
title('histogram');
img1=imbinarize(img,130/255);
subplot(223);imshow(img1);
title('histogram threshold segmentation')
I=graythresh(img);
img2=imbinarize(img,I);
subplot(224);imshow(img2);
title('otsu method');