function [ i, s_ ] = choise_solve( s, i )

if i < 0
    l = length(s);
    if l > 1
        for i = 1:l
            if s > 0
                s_=double(s(i));
                return;
            end
            if i == l
                s_=double(s(i));
            end
        end
    else
       s_ = s; 
    end   
else
    s_ = double(s(i));
end
            

end

