function [KQ, PT, A, B] = HoiQuy(x, y, n, x1, hq, pp)
    if(length(x) ~= length(y))
        fprintf('x và y BẮT BUỘC phải cùng độ dài');
    end
    switch(pp)
        case 'Tuyến tính'
            sigma_x2 = x.*x;
            sigma_xy = x.*y;
            a = (n*sum(sigma_xy)-sum(x)*sum(y))/(n*sum(sigma_x2)-sum(x)^2);
            b = sum(y)/n-a*sum(x)/n;

            A = a;
            B = b;

            PT = A.*x1+B;
            KQ = A.*hq+B;
           
        case 'Hàm mũ'
            Y = log10(y);
            X = log10(x);
            sigma_x2 = X.*X;
            sigma_xy = X.*Y;
            a = (n*sum(sigma_xy)-sum(X)*sum(Y))/(n*sum(sigma_x2)-sum(X)^2);
            b = sum(Y)/n-a*sum(X)/n;

            A = 10.^b;
            B = a;

            PT = A.*x1.^B;
            KQ = A.*hq.^B;

        case 'Logarit'
            Y = 1./y;
            X = 1./x;
            sigma_x2 = X.*X;
            sigma_xy = X.*Y;
            a = (n*sum(sigma_xy)-sum(X)*sum(Y))/(n*sum(sigma_x2)-sum(X)^2);
            b = sum(Y)/n-a*sum(X)/n;

            A = 1/b;
            B = a*A;

            PT = A.*x1./(B+x1);
            KQ = A.*hq./(B+hq);

    end

end