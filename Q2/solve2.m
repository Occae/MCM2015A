clear
clc
time=xlsread('附件1-3','附件1','D4:D24');
Acth=xlsread('附件1-3','附件1','E4:E24');
shicha=0.0183333;%真平太阳时差
PAST=107;%元旦到计算日的天数（积日）
theta=2*pi*(PAST-79.5516)/365.2422;
delta=0.3723+23.2567*sin(theta)+0.1149*sin(2*theta)-0.1712*sin(3*theta)-0.7580*cos(theta)+0.3656*cos(2*theta)+0.0201*cos(3*theta);%赤纬
fitval2=1;%初始评价值（适应度），越小则理论实际相差越小
h=waitbar(0,'please wait');%进度条
for Lat=0:0.1:55
    for Lng=105:0.1:135
        for PoleH=0:0.1:5
            AT=time+shicha-(120-Lng)/15;%真太阳时
            t=(AT-12).*15;%时角
            Theh=PoleH./tan(asin(sin(deg2rad(Lat))*sin(deg2rad(delta))+cos(deg2rad(Lat)).*cos(deg2rad(delta)).*cos(deg2rad(t))));%理论影子长度
            fitval=sum(((Theh-Acth).^2/21).^0.5);
            if fitval<fitval2
                fitval2=fitval;
                x=[Lat Lng PoleH];%纬度，经度，杆长
            end
        end
    end
    waitbar(Lat/55,h)
end
delete(h);%删除进度条
fitval2    %最优  0.0021
x   %最优  20.1000  107.3000    2.1000