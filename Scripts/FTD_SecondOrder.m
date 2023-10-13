%% 固定时间微分器二阶微分方程
% 输入 eta_hat(2*2) eta(2*2)
% 输出 varV_hat_dot(2*2)
function output = FTD_SecondOrder(input)
    % 系数载入
    global l_2 varl_2 alpha_2 beta_2
    % 微分方程输入载入
    
    eta_hat = zeros(2,1); 
    for i = 1:2
        eta_hat(i) = input(i);
    end
    
    eta = zeros(2,1);
    for i = 3:4
        eta(i - 2) = input(i);
    end

    output = - l_2 .* PublicFunc_sig(alpha_2,(eta_hat - eta)) - varl_2 .* PublicFunc_sig(beta_2,(eta_hat - eta));

end