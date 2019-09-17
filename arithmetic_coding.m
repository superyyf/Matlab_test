about={...
    '本实例说明：'
    '字符串不能过长'};
disp(about);str=input('请输入字符串');
l=0;r=1;d=1;
p=[0.2,0.3,0.1,0.15,0.25,0.35];
n=length(str);
disp('_a e r s t');
disp(num2str(p));
for i=1:n
    switch str(i)
        case '_'
            m=1;
        case 'a'
            m=2;
        case 'e'
            m=3;
        case 'r'
            m=4;
        case 's'
            m=5;
        case 't'
            m=6;
        otherwise
            error('请不要输入其他字符');
    end
    pl=0;pr=0;
    for j=1:m-1
        pl=pl+p(j);
    end
    for j=1:m
        pr=pr+p(j);
    end
    l=l+d*pl;
    r=l+d*(pr-pl);
    str1=strcat('输入第',int2str(i),'符号的间隔左右边界：');
    disp(str1);
    format long
    disp(l);disp(r);
    d=r-1;
end


    