img=imread('gray.tif');
subplot(221);imshow(img);
title('original image');
[m,n]=size(img);
F=fftshift(fft2(img));
k=0.0025;
H=zeros(size(img));
for u=1:m
    for v=1:n
        q=((u-m/2)^2+(v-n/2)^2)^(5/6);
        H(u,v)=exp((-k)*q);
    end
end
G=F.*H;
img1=abs(ifft2(ifftshift(G)));
subplot(222);imshow(img1,[]);
title('degraded image');
img2=imnoise(uint8(img1),'gaussian',0,0.01);
subplot(223);imshow(img2,[]);
title('degraded and noise image');
F0=fftshift(fft2(img2));
F1=F0./H;
img3=abs(ifft2(ifftshift(F1)));
subplot(224);imshow(img3,[]);
title('restoration');