function ansx=math1_1(Ab)
% Ab=input('请输入增广矩阵');
[Ab_x,Ab_y]=size(Ab);
A=Ab(1:Ab_x,1:Ab_y-1);
for i=1:Ab_x
       for j=1:i-1
           if A(i,j)~=0
               disp('矩阵不是上三角矩阵');
               return;
           end;
       end
end
if Ab_x~=Ab_y-1 || Ab_x==0
    disp('输入矩阵有误');
    return;
elseif rank(A)~=rank(Ab)||rank(A)==0
    disp('方程组无解');
    return;
else  
    X=zeros(Ab_x,1);
    X(Ab_x)=Ab(Ab_x,Ab_y)/Ab(Ab_x,Ab_y-1);
    sumx=0;
    for j=Ab_x:-1:2
        for a=j+1:Ab_x
            sumx=sumx+Ab(j,a)*X(a);
        end;
            X(j)=(Ab(j,Ab_y)-sumx)/Ab(j,j);    
    end;
%   disp(X);
    ansx=X;
    return;
end
