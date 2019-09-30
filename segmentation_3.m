I=imread('coins.jpeg');
I1=rgb2gray(I);
I2=imbinarize(I1,graythresh(I1));
subplot(121);imshow(I2);
title('bw image');
I3=imopen(I2,strel('disk',1));
subplot(122);imshow(I3);
title('open image');