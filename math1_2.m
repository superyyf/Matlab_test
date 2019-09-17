function math1_2(Ab)
[Ab_x,Ab_y]=size(Ab);
% Ab=double(Ab);
for j=1:Ab_y-2
    Ab_col=Ab(j:Ab_x,j);
    maxi=find(abs(Ab_col)==max(abs(Ab_col)));
    maxi=maxi(1);
    maxi=maxi+j-1;
    Ab([j,maxi],:)=Ab([maxi,j],:);
    for i=j+1:Ab_x
        if Ab(i,j)==0
            disp('error');
            return;
        else
        Ab(i,:)=Ab(j,:).*(-(Ab(j,j)\Ab(i,j)))+Ab(i,:);
        end;
    end;
end;
disp(Ab);
ansx=math1_1(Ab);
disp(ansx);
return;

    
    