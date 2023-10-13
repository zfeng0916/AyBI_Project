%% 文件名： GeneralForceCtro_BallastPlanner
%% 作用：通过传入扰动力和姿态信息的到期望的压载水质量输出m_bd
function output = GeneralForceCtrl_VBS_BallastPlanner(input)
%% 参数输入 
% 输入参数分别为eta(2 * 1)、tau_w_hat(2 * 1);
% 总计4 * 1个参数
eta = zeros(2,1);
for i = 1:2
    eta(i) = input(i);
end
tau_w_hat = zeros(2,1);
for i = 3:4
    tau_w_hat(i -2) = input(i);
end
%% 参数传递
global g            % 重力加速度参数
global x_bg x_sg z_bg z_sg   % VBS位置参数

%% 计算过程
% b_VBS_inv 解算公式 
% 前提是z_bg和z_sg布置在同样高度
b_VBS_inv = (g * (x_bg - x_sg) * cos(eta(2)) ^ 2) ^ -1 .* ...
            [-z_sg * sin(eta(2)) - x_sg * cos(eta(2)), -cos(eta(2));...
             z_bg * sin(eta(2)) + x_bg * cos(eta(2)), cos(eta(2))]; 
% m_bd 解算公式
output = -1 * (b_VBS_inv * tau_w_hat);
end