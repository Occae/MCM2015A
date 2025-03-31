function [fitval] = fit(x)
%x为向量
Lng=x(1);%经度
Lat=x(2);%纬度
PoleH=x(3);%杆高
PAST=round(x(4));%元旦到计算日的天数
global time;
global Acth;
global shichabiao;
shicha=shichabiao(PAST+1);%时差表中第一行的时差对应积日为0，两者差1
AT=time+shicha-(120-Lng)/15;%真太阳时
t=(AT-12).*15;%时角
theta=2*pi*(PAST-79.5516)/365.2422;%theta角计算，参考PDF文档中公式
delta=0.3723+23.2567*sin(theta)+0.1149*sin(2*theta)-0.1712*sin(3*theta)-0.7580*cos(theta)+0.3656*cos(2*theta)+0.0201*cos(3*theta);%赤纬，参考PDF文档中公式
Theh=PoleH./tan(asin(sin(deg2rad(Lat))*sin(deg2rad(delta))+cos(deg2rad(Lat)).*cos(deg2rad(delta)).*cos(deg2rad(t))));%理论影子长度

%理论值与实际值求差，除以实际值（排除一天内的影子长度变化的影响，对一天内的影子长度做归一化处理）
%上述值求得后，继续求平方和，后开方
%最后除以真实值的最大与最小值之差，降低不同日期、不同时段、不同位置的影响，做归一化处理
fitval=sum((((Theh-Acth)./Acth).^2/21))^0.5/(max(Acth)-min(Acth));

end

