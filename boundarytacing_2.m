img=imread('rice.tif');
img1=im2bw(img);
subplot(121);imshow(img1);
title('original image');
[bwb,l]=bwboundaries(img1);
subplot(122);imshow(label2rgb(l,'jet'));
title('label image');
hold on;
for k=1:length(bwb)
    boundary=bwb{k};
    plot(boundary(:,2),boundary(:,1),'r','linewidth',2);
end
