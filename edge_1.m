img=imread('gray.tif');
subplot(121);imshow(img);
title('original image');
bw=edge(img,'Roberts');
subplot(122);imshow(bw);
title('roberts edge');
