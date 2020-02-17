function [path,distance] = Johnsons(Graph, source, destination)
    qGraph=Graph;
    n=length(qGraph(1,:));
    qGraph(n+1,:)=0; qGraph(:,n+1)=0; % new vertex q added
    n=n+1;
    q=n;
    
    [Dist,ERROR] = BellmanFord2019(qGraph, q); %detect negative cycles and calculate min distances from q
  
    if ERROR ==1
       disp("negative cycle");
       return 
    end
    
    % reweight the graph
    reweightedGraph = inf*ones(n-1,n-1);  % used inf to avoid including arcs with 0 distance
    for i=1:1:n-1
        for j=1:1:n-1
            if Graph(i,j)~=0 % updated only there is an arc
                reweightedGraph(i,j)= Graph(i,j)+Dist(i)-Dist(j);
            end
        end
    end
    
    % find shortest path with Dijkstra using reweighted graph (without q)
    [path] = Dijkstra2019(reweightedGraph, source, destination);   
                                                                                                                               
    distance=0;  % find real distance using input Graph
    for i=1:1:length(path)-1
    distance= distance+Graph(path(i),path(i+1));
    end
    distance
    
end