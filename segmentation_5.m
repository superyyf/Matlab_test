A=imread('rice.tif');
A=imadjust(A);
B=double(A);
M=zeros(size(A));
[m,n]=size(A);
num=m*n;
thresh=16;
seed=[1,2];
p=seed;
count=1;
top=1;
while top~=0
    r1=p(1,1);
    c1=p(1,2);
    deg=0;
    for i=-1:1
        for j=-1:1
            if r1+i>0 && r1+i<=m && c1+j>0 && c1+j<=n
                if abs(A(r1+i,c1+j)-A(r1,c1))<=thresh && M(r1+i,c1+j)~=1
                    M(r1+i,c1+j)=1;
                    B(r1+i,c1+j)=1;
                    top=top+1;
                    p(top,:)=[r1+i,c1+j];
                    count=count+1;
                end
                if M(r1+i,c1+j)==0
                   deg=1;
                end
            else
                deg=1;
            end
        end
    end
    if deg~=1
        B(r1,c1)=A(r1,c1); 
%     else 
%         B(r1,c1)=A();
    end
    p=p(2:top,:);
    top=top-1;
    if count>=num
    top=0;
    end
end
subplot(121);imshow(A,[]);
title('1');
subplot(122);imshow(uint8(B));
title('2');
