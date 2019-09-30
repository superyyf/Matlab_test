A0=imread('rice.tif');
seed=[1,2];
thresh=16;
A=imadjust(A0,[min(min(double(A0)))/255,max(max(double(A0)))/255],[]);
A=double(A);
B=A;
[r,c]=size(B);
n=r*c;
pixel_seed=A(seed(1),seed(2));
q=seed;
top=1;
M=zeros(r,c);
M(seed(1),seed(2))=1;
count=1;
while top~=0
    r1=q(1,1);
    c1=q(1,2);
    p=A(r1,c1);
    dge=0;
    for i=-1:1
        for j=-1:1
            if r1+i<=r && r1+i>0 && c1+j<=c && c1+j>0
                if abs(A(r1+i,c1+j)-p)<=thresh && M(r1+i,c1+j)~=1%生长条件
                    top=top+1;
                    q(top,:)=[r1+i,c1+j];%记录种子坐标
                    M(r1+i,c1+j)=1;%更新种子矩阵
                    count=count+1;%记录种子数
                    B(r1+i,c1+j)=1;
                end
                if M(r1+i,c1+j)==0
                    dge=1;
                end
            else
                dge=1;
            end
        end
    end
    if dge~=1
        B(r1,c1)=A(1,2);
    end
    if count>=n
        top=1;
    end
    q=q(2:top,:);
    top=top-1;
end
subplot(121);imshow(A,[]);
title('original image');
subplot(122);imshow(B,[]);
title('region growing');