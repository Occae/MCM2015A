clear;
clc;


Lat=39.907222;%纬度
Lng=116.608056;%经度
PoleH=3;%杆长
time=9:0.1:15;%影子变化时对应的时刻
shicha=0.258611;%真平太阳时差
AT=time+shicha-(120-Lng)/15;%真太阳时
t=(AT-12).*15;%时角
PAST=294;%元旦到计算日的天数（积日）
theta=2*pi*(PAST-79.5516)/365.2422;
delta=0.3723+23.2567*sin(theta)+0.1149*sin(2*theta)-0.1712*sin(3*theta)-0.7580*cos(theta)+0.3656*cos(2*theta)+0.0201*cos(3*theta);%赤纬

Theh=PoleH./tan(asin(sin(deg2rad(Lat))*sin(deg2rad(delta))+cos(deg2rad(Lat)).*cos(deg2rad(delta)).*cos(deg2rad(t))));%理论影子长度
plot(time,Theh)

title('影长一天内的变化')
xlabel('时刻/时')
ylabel('影子长度/m')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lat=39.907222;%纬度
Lng=-180:1:180;
PoleH=3;%杆长
time=12;
shicha=0.258611;%真平太阳时差
AT=time+shicha-(120-Lng)./15;%真太阳时
t=(AT-12).*15;%时角
PAST=294;%元旦到计算日的天数
theta=2*pi*(PAST-79.5516)/365.2422;
delta=0.3723+23.2567*sin(theta)+0.1149*sin(2*theta)-0.1712*sin(3*theta)-0.7580*cos(theta)+0.3656*cos(2*theta)+0.0201*cos(3*theta);%赤纬

Theh=PoleH./tan(asin(sin(deg2rad(Lat))*sin(deg2rad(delta))+cos(deg2rad(Lat)).*cos(deg2rad(delta)).*cos(deg2rad(t))));%理论影子长度
plot(Lng,Theh)

title('影长与经度的关系')
xlabel('经度/°')
ylabel('影子长度/m')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lat=-90:1:90;%纬度
Lng=116.608056;%经度
PoleH=3;%杆长
time=12;%影子变化时对应的时刻
shicha=0.258611;%真平太阳时差
AT=time+shicha-(120-Lng)/15;%真太阳时
t=(AT-12).*15;%时角
PAST=294;%元旦到计算日的天数
theta=2*pi*(PAST-79.5516)/365.2422;
delta=0.3723+23.2567*sin(theta)+0.1149*sin(2*theta)-0.1712*sin(3*theta)-0.7580*cos(theta)+0.3656*cos(2*theta)+0.0201*cos(3*theta);%赤纬

Theh=PoleH./tan(asin(sin(deg2rad(Lat)).*sin(deg2rad(delta))+cos(deg2rad(Lat)).*cos(deg2rad(delta)).*cos(deg2rad(t))));%理论影子长度
plot(Lat,Theh)

title('影长与纬度的关系')
xlabel('纬度/°')
ylabel('影子长度/m')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lat=-90:1:90;%纬度
% Lng=116.608056;%经度
% PoleH=3;
% time=12;%影子变化时对应的时刻
% shicha=-0.03611;%真平太阳时差
% AT=time+shicha-(120-Lng)/15;%真太阳时
% t=(AT-12).*15;%时角
% PAST=172;%元旦到计算日的天数
% theta=2*pi*(PAST-79.5516)/365.2422;
% delta=0.3723+23.2567*sin(theta)+0.1149*sin(2*theta)-0.1712*sin(3*theta)-0.7580*cos(theta)+0.3656*cos(2*theta)+0.0201*cos(3*theta);%赤纬
% 
% Theh=PoleH./tan(asin(sin(deg2rad(Lat)).*sin(deg2rad(delta))+cos(deg2rad(Lat)).*cos(deg2rad(delta)).*cos(deg2rad(t))));%影子长度
% plot(Lat,Theh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
shicha=xlsread('shicha','N1:N365');%真平太阳时差
Lat=39.907222;%纬度
Lng=116.608056;%经度
PoleH=3;%杆长
time=12;%影子变化时对应的时刻
AT=time+shicha-(120-Lng)/15;%真太阳时
t=(AT-12).*15;%时角
PAST=0:1:364;%元旦到计算日的天数
theta=2.*pi.*(PAST-79.5516)./365.2422;
theta=theta';
delta=0.3723+23.2567.*sin(theta)+0.1149.*sin(2.*theta)-0.1712.*sin(3.*theta)-0.7580.*cos(theta)+0.3656.*cos(2.*theta)+0.0201.*cos(3.*theta);%赤纬

Theh=PoleH./tan(asin(sin(deg2rad(Lat))*sin(deg2rad(delta))+cos(deg2rad(Lat)).*cos(deg2rad(delta)).*cos(deg2rad(t))));%理论影子长度
plot(PAST,Theh)

title('影长与日期的关系')
xlabel('日期/天')
ylabel('影子长度/m')