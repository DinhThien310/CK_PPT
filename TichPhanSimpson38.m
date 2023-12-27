function y = TichPhanSimpson38(fx, a, b, N)
    fx = str2func(['@(x)', fx]);
    h = (b - a) / N;
    fi = fx(a) + fx(b);

    % Tính tổng cho các nút có chỉ số chẵn (trừ đi nút cuối cùng)
    for i = 2:3:N-2
        x_i = a + i * h;
        fi = fi + 3 * fx(x_i);
    end

    % Tính tổng cho các nút có chỉ số lẻ
    for i = 1:3:N-1
        x_i = a + i * h;
        fi = fi + 3 * fx(x_i);
    end
    
    % Áp dụng công thức Simpson 3/8
    y = 3 * h / 8 * fi;
end