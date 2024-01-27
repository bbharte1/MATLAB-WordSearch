function d = ifElseMystery(a,b,c);
if (a < b) && c > 0
    d = b-a; 
elseif rem(c,b) == 1
    d = c;
else
    if a > c
        d = 2*a;
    else
        d = a; 
    end
end
end