function v = maxGrowthRate(T, P, T_span, P_span, V_m)
    T_star = 25;
    P_star = -0.5;
    
    if T <= T_star
        v_T = V_m / (1 + exp(-(8*T/T_span - 8*T_star/T_span + 4)));
    else
        v_T = V_m / (1 + exp(-(-8*T/T_span + 8*T_star/T_span + 4)));
    end

    if P <= P_star
        v_P = V_m / (1 + exp(-(8*P/P_span - 8*P_star/P_span + 4)));
    else
        v_P = V_m / (1 + exp(-(-8*P/P_span + 8*P_star/P_span + 4)));
    end

    v = min(v_T, v_P);
end