img=imread('gray.tif');
subplot(121);imshow(img);
title('original image');
img1=edge(img,'Canny');
subplot(122);imshow(img1);
title('canny edge');
