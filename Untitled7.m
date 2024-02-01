% 参数设置
T_span = [10, 15, 25]; P_span = [1, 2, 4]; V_m = [15, 10, 5];
K = 800; lambda = 0.000001;
f0 = [1; 1; 1; 800000]; % 初始条件
tspan = [0 500]; % 时间范围，例如一年

% 求解微分方程组
[t, y] = ode45(@(t, y) differentialEquations(t, y, T_span, P_span, V_m, K, lambda), tspan, f0);

% 绘图
figure;
subplot(2, 1, 1);
plot(t, y(:, 1), t, y(:, 2), t, y(:, 3));
title('物种的生物量随时间的变化');
xlabel('时间 (天)');
ylabel('生物量 (kg)');
legend('物种A', '物种B', '物种C');

subplot(2, 1, 2);
plot(t, y(:, 4));
title('枯木量随时间的变化');
xlabel('时间 (天)');
ylabel('枯木量 (kg)');
legend('枯木量');
