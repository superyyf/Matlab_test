img=imread('T.tif');
subplot(121);imshow(img);
title('original image');
img1=im2bw(img);
subplot(122);imshow(img1);
title('binary image');
hold on;
[m,n]=size(img);
a=0;
for i=1:m
    for j=1:n
        if img1(i,j)~=0
            p=[i,j];
            a=1;
            break;
        end
    end
    if a==1;
        break;
    end
end
boundary=bwtraceboundary(img1,p,'e',8,1800);
plot(boundary(:,2),boundary(:,1),'r','linewidth',2);