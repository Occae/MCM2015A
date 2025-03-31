function [fitval] = fit4_2(x)
Lng=x(1);
Lat=x(2);
PAST=round(x(3));%元旦到计算日的天数 floor ceil
global time;
global Acth;
global shichabiao;
shicha=shichabiao(PAST+1);
AT=time+shicha-(120-Lng)/15;%真太阳时
t=(AT-12).*15;%时角
theta=2*pi*(PAST-79.5516)/365.2422;
delta=0.3723+23.2567*sin(theta)+0.1149*sin(2*theta)-0.1712*sin(3*theta)-0.7580*cos(theta)+0.3656*cos(2*theta)+0.0201*cos(3*theta);%赤纬
Theh=2./tan(asin(sin(deg2rad(Lat))*sin(deg2rad(delta))+cos(deg2rad(Lat)).*cos(deg2rad(delta)).*cos(deg2rad(t))));%影子长度
fitval=sum((((Theh-Acth)./Acth).^2/21).^0.5);
end

