 img=imread('gray.tif');
 subplot(231);imshow(img);
 title('original image');
 img1=imnoise(img,'salt & pepper',0.02);
 subplot(232);imshow(img1);
 title('salt & pepper noise');
 k1=filter2(fspecial('average',3),img1);
 k2=filter2(fspecial('average',5),img1);
 k3=filter2(fspecial('average',7),img1);
 k4=filter2(fspecial('average',9),img1);
 subplot(233);imshow(uint8(k1));
 title('3*3');
 subplot(234);imshow(uint8(k2));
 title('5*5');
 subplot(235);imshow(uint8(k3));
 title('7*7');
 subplot(236);imshow(uint8(k4));
 title('9*9');
 