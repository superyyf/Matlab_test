load clown
subplot(131);
colormap(map);
image(X);
colormap(map);
title('original image');
axis square
init=2055615866;
rng(init);
Xnoise=X+10*randn(size(X));
subplot(132);
image(Xnoise);
title('noise image');
axis square
[c,s]=wavedec2(Xnoise,2,'coif3');
n=[1,2];
p=[10.12,23.28];
nc=wthcoef2('h',c,s,n,p,'s');
nc=wthcoef2('v',c,s,n,p,'s');
nc=wthcoef2('d',c,s,n,p,'s');
xx=waverec2(nc,s,'coif3');
subplot(133);
image(xx);
title('denoise image');
axis square