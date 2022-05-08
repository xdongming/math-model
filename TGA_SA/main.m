clear all;
close all;
clc;
C=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;3326 1556;...
    3238 1229;4196 1044;4312 790;4386 570;3007 1970;2562 1756;...
    2788 1491;2381 1676;1332 695;3715 1678;3918 2179;4061 2370;...
    3780 2212;3676 2578;4029 2838;4263 2931;3429 1908;3507 2376;...
    3394 2643;3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;...
    2370 2975];
n=size(C,1);
T=100*n;
L=1000;
K=0.99;

city=struct([]);
for i=1:n
    city(i).x=C(i,1);
    city(i).y=C(i,2);
end
l=1;
len(1)=func3(city,n);
figure(1);
while T>0.001
    for i=1:L
        len1=func3(city,n);
        p1=floor(1+n*rand());
        p2=floor(1+n*rand());
        while p1==p2
            p1=floor(1+n*rand());
            p2=floor(1+n*rand());
        end
        tmp_city=city;
        tmp=tmp_city(p1);
        tmp_city(p1)=tmp_city(p2);
        tmp_city(p2)=tmp;
        len2=func3(tmp_city,n);
        delta_e=len2-len1;
        if delta_e<0
            city=tmp_city;
        else
            if exp(-delta_e/T)>rand()
                city=tmp_city;
            end
        end
    end
    l=l+1;
    len(l)=func3(city,n);
    T=T*K;
    for i=1:n-1
        plot([city(i).x,city(i+1).x],[city(i).y,city(i+1).y],'ro-');
        hold on;
    end
    plot([city(n).x,city(1).x],[city(n).y,city(1).y],'ro-');
    title(['优化最短距离：',num2str(len(l))]);
    hold off;
    pause(0.005);
end
figure(2);
plot(len)
xlabel('迭代次数')
ylabel('目标函数值')
title('适应度进化曲线')