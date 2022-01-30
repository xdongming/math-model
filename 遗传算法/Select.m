function y=Select(individual,size)
sumf=sum(individual.fitness);
f=individual.fitness./sumf;      %ÂÖÅÌ¶Ä·¨¸ÅÂÊ
select=zeros(size,1);
for i=1:size
    r=rand();
    for j=1:size
        r=r-f(j);
        if r<=0
            select(i)=j;
            break;
        end
    end
end
individual.fitness=individual.fitness(select);
individual.chrom=individual.chrom(select,:);
y=individual;
end