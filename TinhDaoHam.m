function [dx] = TinhDaoHam(fx, x, h, pp)
    fx = str2func(['@(x)', fx]);
    if pp == "Tiến"
        dx = (4*fx(x+h) - 3*fx(x) - fx(x+2*h))/(2*h);
    elseif pp == "Lùi"
        dx = (3*fx(x) - 4*fx(x-h) + fx(x-2*h))/(2*h);
    else
        dx = (fx(x+h) - fx(x-h))/(2*h);
    end
end