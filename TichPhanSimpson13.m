function y = TichPhanSimpson13(fx, a, b, N)
    fx = str2func(['@(x)', fx]);
    h = (b - a) / N;
    fi = fx(a) + fx(b);

    % Tính tổng cho các nút có chỉ số chẵn
    for i = 2:2:N-1
        x_i = a + i * h;
        fi = fi + 4 * fx(x_i);
    end

    % Tính tổng cho các nút có chỉ số lẻ
    for i = 1:2:N-1
        x_i = a + i * h;
        fi = fi + 2 * fx(x_i);
    end
    
    % Áp dụng công thức Simpson 1/3
    y = h / 3 * fi;
end