function y=Variation(p,individual,size,range,n)
for i=1:size
    p0=rand();
    if p0>p
        continue;
    else
        choose=randi([1,n],[1,1]);
        individual.chrom(i,choose)=(range(2)-range(1)).*rand()+range(1);
    end
end
y=individual.chrom;
        