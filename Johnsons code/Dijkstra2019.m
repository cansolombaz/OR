% this is HATALI Dijkstra on LMS, I fixed it before and sent it to ie343sub

function [path] = Dijkstra2019(reweightedGraph, source, destination)

n=length(reweightedGraph(1,:));
Pred(source) = [source];
Dist = [10^n*ones(1, n)]; Dist(source)=0;
visit = [1:n]; visit(source) = []; 
node = source;
j=[1:n];

while length(visit)>0
    dist=[];
    for i=1:1:length(visit)
        if reweightedGraph(node,visit(i)) >=0
            dist(visit(i)) = Dist(node) + reweightedGraph(node,visit(i));
           if dist(visit(i)) <= Dist(visit(i))
                Dist(visit(i))=dist(visit(i));
                Pred(visit(i))=node;
           end  
        end
    end
    
    % below is fixed part, rest is same
    % this part eliminates visited nodes 
    % and find min of all available options
    Dist2=Dist;
    Dist2(setdiff(j,visit))=1000000;
    [mini,I] = min(Dist2);
    node=I;
    visit(find(visit==I))=[];
end

path    = [destination];
next = destination;

while next ~= source
    next = Pred(next);
    path = [next path];
end

end
