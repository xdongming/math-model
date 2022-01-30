size=50;        %种群大小
maxgen=5000;      %最大代数
pcro=0.6;       %交叉率
pvar=0.01;      %变异率
n=2;            %染色体个数
range=[-5,5];   %染色体取值范围
individual=struct('fitness',zeros(size,1),'chrom',zeros(size,n));
individual.chrom=(range(2)-range(1)).*rand(size,n)+range(1);
individual.fitness=1./f((individual.chrom(:,1)).^2,(individual.chrom(:,2)).^2);    %随适应度函数改变（注意实际编程讨论分母为0）
[bestf bestnum]=max(individual.fitness);
bestchrom=individual.chrom(bestnum,:);
for i=1:maxgen
    individual=Select(individual,size);
    individual.chrom=Cross(pcro,individual,size,n);
    individual.chrom=Variation(pvar,individual,size,range,n);
    individual.fitness=1./((individual.chrom(:,1)).^2+(individual.chrom(:,2)).^2);
    [newbestf newbestnum]=max(individual.fitness);
    if newbestf>bestf
        bestf=newbestf;
        bestchrom=individual.chrom(newbestnum,:);
    end
end
1/bestf
