function [img_out,hist_out]=my_histeq(img_in)
[m,n]=size(img_in);
num=m*n;
a=zeros(1,256);
for i=1:m
    for j=1:n
        l=img_in(i,j)+1;
        a(l)=a(l)+1;
    end
end
h=a/num;
hcum=zeros(1,256);
img_out1=zeros(m,n);
for i=1:m
    for j=1:n
       hc=0;
       for k=0:img_in(i,j)
           hc=hc+h(k+1);
       end
       hcum(img_in(i,j)+1)=hc;
       img_out1(i,j)=255*hcum(img_in(i,j)+1);
    end
end
img_out=uint8(img_out1);
count1=zeros(1,256);
for i=1:m
    for j=1:n
        l=img_out(i,j)+1;
        count1(l)=count1(l)+1;
    end
end
hist_out=count1/num;
return;