Xd=[5,25];
Xv=[500,1500];
T=1000;
K=0.998;
L=200;
S=0.01;
P=0;
detf=1e-6;    %误差阈值

pre_d=rand()*(Xd(2)-Xd(1))+Xd(1);
pre_v=rand()*(Xv(2)-Xv(1))+Xv(1);
prebest_d=pre_d;
prebest_v=pre_v;
pre_d=rand()*(Xd(2)-Xd(1))+Xd(1);
pre_v=rand()*(Xv(2)-Xv(1))+Xv(1);
best_d=pre_d;
best_v=pre_v;
det=abs(func(best_d,best_v)-func(prebest_d,prebest_v));
while (det>detf) && (T>0.0001)
    T=K*T;
    for i=1:L
        next_d=pre_d+S*(rand()*(Xd(2)-Xd(1))+Xd(1));
        next_v=pre_v+S*(rand()*(Xv(2)-Xv(1))+Xv(1));
        if next_d>Xd(2) 
            next_d=Xd(2)-1;
        end
       	if next_d<Xd(1)
            next_d=Xd(1)+1;
        end
        if next_v>Xv(2)
            next_v=Xv(2)-1;
        end
        if next_v<Xv(1)
            next_v=Xv(1)+1;
        end
        pre_func=func(pre_d,pre_v);
        next_func=func(next_d,next_v);
        best_func=func(best_d,best_v);
        if (best_func>next_func)
            prebest_d=best_d;
            prebest_v=best_v;
            best_d=next_d;
            best_v=next_v;
        end
        if (pre_func-next_func>0)
            pre_d=next_d;
            pre_v=next_v;
            P=P+1;
        else
            changer=-1*(next_func-pre_func)/T;
            p1=exp(changer);
            if p1>rand()
                pre_d=next_d;
                pre_v=next_v;
            end
        end
    trace(P+1)=func(best_d,best_v);
    end
    det=abs(func(best_d,best_v)-func(prebest_d,prebest_v));
end
disp('最大值在点')
best_d,best_v
disp('最大值为：')
func(best_d,best_v)
figure
loglog(trace(2:end),'linewidth',1.5)
xlabel('迭代次数')
ylabel('目标函数值')
title('适应度进化曲线')