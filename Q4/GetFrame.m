clear
clc

fileName = '2015年全国数学建模竞赛A题附件4-生活-高清完整正版视频在线观看-优酷.mp4';%将视频导入，以便提取不同帧，进而获得影子长度
obj = VideoReader(fileName);

n=0;
for i=1:3000:obj.NumFrames
    n=n+1;
    video{n} = read(obj, i); %获取视频中的 21 帧图片，包含首帧
figure,I=imshow(video{n});
saveas(I,strcat(num2str(n),'.jpg'));
end