I=zeros(900,900);
I(351:648,476:525)=1;
noise=0.1*randn(size(I));
PSF=fspecial('motion',21,11);
Blurred=imfilter(I,PSF,'circular');
BlurredNoisy=im2uint8(Blurred+noise);
% NSR=sum(noise(:).^2)/sum(I(:).^2);
NP=abs(fftn(noise)).^2;
NPOW=sum(NP(:))/numel(noise);
NCORR=fftshift(real(ifftn(NP)));
IP=abs(fftn(I)).^2;
IPOW=sum(IP(:))/numel(I);
ICORR=fftshift(real(ifftn(IP)));
ICORR1=ICORR(:,ceil(size(I,1)/2));
NSR=NPOW/IPOW;
subplot(221);imshow(BlurredNoisy,[]);
title('Blurred and Noisy');
subplot(222);imshow(deconvwnr(BlurredNoisy,PSF,NSR),[]);
title('deconvwnr(A,PSF,NSR)');
subplot(223);imshow(deconvwnr(BlurredNoisy,PSF,NCORR,ICORR),[]);
title('deconvwnr(A,PSF,NCORR,ICORR)');
subplot(224);imshow(deconvwnr(BlurredNoisy,PSF,NCORR,ICORR1),[]);
title('deconvwnr(A,PSF,NCORR,ICORR1)');