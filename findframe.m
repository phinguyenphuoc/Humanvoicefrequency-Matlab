function [L1,L2] = findframe(ip)
    for i=1:length(ip)
        if(ip(i)>0.3)
            L1 = i;
            break;
        end
    end
    for j=length(ip):-1:1
        if(ip(j)>0.3)
            L2 = j;
            break;
        end
    end