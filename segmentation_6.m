I=imread('rice.tif');
I1=qtdecomp(I,0.25);
% I2=full(I1);
blocks=repmat(uint8(0),size(I1));
for dim=[512,256,128,64,32,16,8,4,2]
    numdim=length(find(I1==dim));
    if numdim>0
        values=repmat(uint8(1),[dim,dim,numdim]);
        values(2:dim,2:dim,numdim)=0;
        blocks=qtsetblk(I,I1,dim,values);
    end
end
blocks(end,1:end)=1;
blocks(1:end,end)=1;
subplot(121);imshow(I);
title('1');
subplot(122);imshow(blocks,[]);
title('2');
