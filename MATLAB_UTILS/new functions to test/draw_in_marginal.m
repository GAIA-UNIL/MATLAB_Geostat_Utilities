function r=draw_in_marginal(prob)

%to pick a random candidate according to their probabilities
prob = prob/sum(prob);

r=0;
a=rand;
s=0;
for i=1:size(prob,1)-1
    s=s+prob(i);
    if a<s
        r=i;
        return
    end
end

%if not found, return the max
r=size(prob,1);
