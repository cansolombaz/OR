function [value,f] = Topdown2(i,v,w,size)
%sample
% v=[10 40 30 50];
% w=[5 4 6 3];
% i=4;
% size=10; 
    
    global e;
    global f;
    
    take=0; donottake=0;
    
    if i==0
        value=0;
    end
    
    if i>=1
        if w(i)<=size
            
            take = v(i) + Topdown2(i-1,v,w,size-w(i));  
            
        end
            donottake = Topdown2(i-1,v,w,size);

        value = max(take, donottake);
        if value~=0
            e(i,size)=value; %saving all necessary values
        end     

    end
    
 if i==length(v) %entering here only at the end
  % read all value from e matrix and determine dec. var.
   while i>1   
    
    if e(i,size)~=e(i-1,size)
     f(i)=1;
     size=size-w(i);
     i=i-1;
     
    elseif e(i,size)==e(i-1,size) 
     f(i)=0;
     i=i-1;
    end
    
   end
   if i==1&&size>=w(i)
       f(i)=1;
       
   elseif i==1&&size<w(i)
       f(i)=0;
       
   end
 f
 end
 
end    