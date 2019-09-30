img=imread('gray.tif');
subplot(221);imshow(img);
title('original image');
S=fspecial('Sobel');
img1=filter2(S,img);
subplot(222);imshow(img1);
title('Sobel image');
P=fspecial('Prewitt');
img2=filter2(P,img);
subplot(223);imshow(img2);
title('Prewitt image');
L=fspecial('LOG');
img3=filter2(L,img);
subplot(224);imshow(img3);
title('LOG image');

