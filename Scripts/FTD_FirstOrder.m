%% 固定时间微分器一阶微分方程
% 输入 eta_hat(2*1) eta(2*1) varV(2*1)
% 输出 eta_hat_dot(2*1)
function output = FTD_FirstOrder(input)
    % 系数载入
    global l_1 varl_1 alpha_1 beta_1
    % 微分方程输入载入
    eta_hat = zeros(2,1); 
    for i = 1:2
        eta_hat(i) = input(i);
    end
    eta = zeros(2,1);
    for i = 3:4
        eta(i - 2) = input(i);
    end
    varV_hat = zeros(2,1);
    for i = 5:6
        varV_hat(i - 4) = input(i);
    end
    
    output = varV_hat - l_1 .* PublicFunc_sig(alpha_1,(eta_hat - eta)) - varl_1 .* PublicFunc_sig(beta_1,(eta_hat - eta));
    
end
