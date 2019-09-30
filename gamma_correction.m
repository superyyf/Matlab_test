function gamma_correction(img,gamma)
clear LUT
for i=0:255;
 f=power((i+0.5)/256,gamma);
 LUT(i+1)=f*256-0.5;
end
% img=imread('e:\pictures\test.tif');
img_1=rgb2ycbcr(img);
Y=img_1(:,:,1);
[x,y]=size(Y);
for row=1:x
    for col=1:y
        for i=0:255
        if(Y(row,col)==i)
            Y(row,col)=LUT(i+1);
            break;
        end
        end
    end
end
img_1(:,:,1)=Y;
img_out=ycbcr2rgb(img_1);
subplot(121);imshow(img);
subplot(122);imshow(img_out);
return;
