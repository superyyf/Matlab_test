img=imread('gray.tif');
[f1,f2]=freqspace(size(img),'meshgrid');
r=sqrt(f1.^2+f2.^2);
img_log=log(double(img)+1);
img1=fft2(img_log);
img1_1=fftshift(img1);
n=3;
D0=0.05*pi;
rh=0.9;
rl=0.3;
[row,col]=size(img1);
D1=zeros(row,col);
H=zeros(row,col);
for i=1:1:row
    for j=1:1:col
        D1(i,j)=r(i,j);
        H(i,j)=rl+(rh/(1+(D0/D1(i,j))^(2*n)));
    end
end
img2=img1_1.*H;
img3=ifftshift(img2);
img4=ifft2(img3);
img5=exp(img4)-1;
subplot(121);imshow(img);
title('original image');
subplot(122);imshow(img5,[]);
title(' Homomorphic filtering ');