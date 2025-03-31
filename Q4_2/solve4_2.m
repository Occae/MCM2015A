clear
clc

x0=zeros(21,2);
for i=1:21
    
%     %%%%%%%%%%%%%%%%%%%%%%%%以下为调试使用
%     clear
%     clc
%     
%     x0=zeros(21,2);
%     i=10;
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    filename=[num2str(i),'.jpg'];
    A=imread(filename);
    X=A(500:600,500:1100,1:3);%截取影子区域
    XI=rgb2gray(X);%将真彩色图像 RGB 转换为灰度图像
    Xbw=im2bw(XI,0.85);%将灰度图像转换为二值图像，白色像素对应1，其他像素对应0
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%下为阈值调整使用
%     imshow(Xbw);
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    L=bwlabel(~Xbw);%对二维二值图像中的连通分量进行标注,
    index=L==L(25,125);%与底座为同一联通范围内则进行标注
    Xbw(~index)=1;
%     imshow(Xbw);
    for j=450:601%横坐标
        for k=1:101%纵坐标
            if Xbw(k,j)==0
                x0(i,1)=j-112;
                x0(i,2)=k-28;
            end
        end
    end
    
end


%计算影子长度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%调试部分
% Pbw=im2bw(XI,0.75);
% imtool(XI);
% 
% image(A);
% Y=A(100:600,550:700,:);
% YI=rgb2gray(Y);
% Ybw=im2bw(YI,0.38);
% imtool(Ybw)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global time;
global Acth;
global shichabiao

l=2/365.2;%单一像素的真实值
B=[-27.5,-6;25.5,-6;-30.5,6;28.5,6];
A=[-28,-28;28,-28;-28,28;28,28];
TForm = cp2tform(B,A,'projective');
x0trans=tformfwd(TForm,x0);
Acth=l*(sum(x0trans.^2,2)).^0.5;
time=xlsread('附件四时间','C1:C21');
shichabiao=xlsread('shicha','N1:N365');

nvars=3;%变量个数
lb=[0 0 -0.499999];
ub=[180 90 364.4999999];
PopulationSize_Data=200;
MaxGenerations_Data=600;
MaxStallGenerations_Data=150;
fval1=1;%评价值（适应度）

h=waitbar(0,'please wait');
for i=1:100
    [x fval]=gasolve4(nvars,lb,ub,PopulationSize_Data,MaxGenerations_Data,MaxStallGenerations_Data);
    if fval<fval1
        fval1=fval;
        x1=x;
    end
    waitbar(i/100,h)
end
delete(h);
x1
fval1