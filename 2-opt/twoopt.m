function [best_tour, best_cost, old_cost, per_imp] = twoopt(tour, distmatrix)

n = length(tour);
new_tour = tour;
dist = distmatrix;
minchange= -1;
while minchange <0
        minchange=0;
for i=1:1:n-3
    for j=i+2:1:n-1
        change = norm(dist(new_tour(i),:) - dist(new_tour(j),:),2) + norm(dist(new_tour(i+1),:)- dist(new_tour(j+1),:),2) - norm(dist(new_tour(i),:)-dist(new_tour(i+1),:),2) - norm(dist(new_tour(j),:)-dist(new_tour(j+1),:),2);
        if minchange > change
            minchange = change;
            mini=i;
            minj=j;
        end
    end
end

if minchange < 0
    new_tour = [new_tour(1:mini) fliplr(new_tour(mini+1:minj)) new_tour(minj+1:n)];
end
end
best_tour = new_tour;
best_cost = TourCost(best_tour,distmatrix);
old_cost = TourCost(tour,distmatrix);
per_imp = (( old_cost - best_cost) / old_cost)*100;
end
