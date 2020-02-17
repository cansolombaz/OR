function [ cost ] = TourCost(tour, points)
n = length(tour);
cost=0;

for i=1:1:n-1
   cost=cost + norm(points(tour(i), :) - points(tour(i+1),:), 2);
end
  
end
