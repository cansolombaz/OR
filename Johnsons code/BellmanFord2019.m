function [Dist, ERROR] = BellmanFord2019(qGraph,q)
m=length(qGraph(1,:));
for i=1:1:m
    A(i,find(qGraph(i,:))) = 1;
    % q is added
    A(m,i)=1;
    A(i,m)=0;
end
Dist = inf*ones(1,m);
Dist(q) = 0;
Pred = zeros(1,m);
Pred(q) = q;
ERROR = 0;

for iter=1:1:m-1
    for u=1:1:m
        for v=1:1:m
          dist = qGraph(u,v);   
              if A(u,v)==1 && Dist(u) + dist < Dist(v)
                  Dist(v) = Dist(u) + dist;
                  Pred(v)=u;
              end    
        end
    end
end
    
 for u=1:1:m
        for v=1:1:m
            if A(u,v)==1 && Dist(u) + qGraph(u,v) < Dist(v)
                ERROR=1;
            end
        end
 end
