I=imread('house.tif');
I_edge=edge(I,'canny');
[H,T,R]=hough(I_edge,'RhoResolution',0.5,'Theta',-90:0.5:89.5);
P=houghpeaks(H,3);
subplot(221);imshow(I);
title('original image');
subplot(222);imshow(I_edge);
title('edge image');
subplot(223);imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,'InitialMagnification','fit');
title('hough transformation');
xlabel('\theta');ylabel('\rho');
axis on,axis normal;
hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','red');
lines=houghlines(I_edge,T,R,P);
subplot(224);imshow(I_edge);
title('line detection');
hold on;
max_len=0;
for k=1:length(lines);
    xy=[lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    len=norm(lines(k).point1-lines(k).point2);
    if(len>max_len)
      max_len=len;
      xy_long=xy;
    end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','b');