function dydt = differentialEquations(t, y, T_span, P_span, V_m, K, lambda)
    % 计算温度和湿度
    T = 15 + 10 * sin(2 * pi / 365 * t + pi);
    P = -0.5 + 0.4 * sin(2 * pi / 365 * t + pi);

    % 根据当前温度和湿度计算每个物种的最大生长速度
    for i = 1:3
        v(i) = maxGrowthRate(T, P, T_span(i), P_span(i), V_m(i));
    end

    f1 = y(1);
    f2 = y(2);
    f3 = y(3);
    x = y(4);

    df1dt = v(1) * (1 - (f1 + f2 + f3) / K) * f1;
    df2dt = v(2) * (1 - (f1 + f2 + f3) / K) * f2;
    df3dt = v(3) * (1 - (f1 + f2 + f3) / K) * f3;
    dxdt = -lambda * (0.72 * x * log(v(1)+1) * V_m(1) * f1 + ...
                      0.72 * x * log(v(2)+1) * V_m(2) * f2 + ...
                      0.72 * x * log(v(3)+1) * V_m(3) * f3 + ...
                      0.28 * (T - 5));

    dydt = [df1dt; df2dt; df3dt; dxdt];
end
