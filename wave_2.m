load woman;
subplot(221);image(X);
colormap(map);
title('original image');
axis square
init=2055615866;
rng(init);
Xnoise=X+38*randn(size(X));
subplot(222);image(Xnoise);
title('noise image');
axis square
[c,s]=wavedec2(Xnoise,2,'sym4');
a1=wrcoef2('a',c,s,'sym4');
subplot(223);image(a1);
axis square
a2=wrcoef2('a',c,s,'sym4',2);
subplot(224);image(a2);
title('denoise2');
axis square