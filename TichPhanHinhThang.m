function [I] = TichPhanHinhThang(fx, a, b, N)
    fx = str2func(['@(x)', fx]);
    h = (b - a) / N;
    fi = fx(a) + fx(b);
    for i = 1:N-1
        x_i = a + i * h;
        fi = fi + 2 * fx(x_i);
    end
    
    %áp dụng công thức hình thang
    I = h / 2 * fi;
end
