function [dy] = daohamOh (fx, x, h, pp)
    fx = str2func(['@(x)', fx]);
    if pp == "Tiến"
        dy = (fx(x+h)-fx(x))/h;
    elseif pp == "Lùi"
        dy = (fx(x)-fx(x-h))/h;
    else
        dy = (fx(x+h) - fx(x-h))/(2*h);
    end
end
