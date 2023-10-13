%% %% 依有限时间收敛扰动观测器(Disturbance observer in finite time)输出方程(Output Equation)
% 作用：将输入的这些量转化成状态量导数值输出
% 输入参数：xi(2*2 辅助状态量) 、V_hat(2*2:w_hat q_hat)
% 输入参数共计 2 * 2 = 4
% 输出参数：tau_w_hat(2*2)
% 运行此函数需要运行参数化脚本 REMUS_All_Para_Init & DistObsv_All_Para_Init

function output = DistbObsv_FiniteTime_OutEqu(input)
%% 输入获取
% xi 构造的辅助状态
xi = zeros(2,1);
for i = 1:2
    xi(i) = input(i);
end
% V_hat
V_hat = zeros(2,1);
for i = 3:4
    V_hat(i - 2) = input(i);
end

%% 全局变量
% 控制参数
global K_1  K_2  K_3 
global b_1 b_2

%% 微分方程
% 辅助变量定义
varrho = V_hat - xi;
output = K_1 * varrho + K_2 * PublicFunc_sgn(xi); % + K_3 * PublicFunc_sig((b_1 / b_2), varrho);

end