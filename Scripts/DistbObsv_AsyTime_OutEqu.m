%% 依渐进时间扰动观测器(Disturbance observer in progressive time)输出方程(Output Equation)
% 作用：将输入的这些量转化成状态量导数值输出
% 输入参数：xi(2*2 辅助状态量) 、V_hat(2*2:w_hat q_hat)、m_b(2*2:m_bb m_sb)
% 输入参数共计 3 * 2 = 6
% 输出参数：tau_w_hat(2*2)
% 运行此函数需要运行参数化脚本 REMUS_All_Para_Init & DistObsv_All_Para_Init
function output = DistbObsv_AsyTime_OutEqu(input)
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
% m_b
m_b = zeros(2,1);
for i = 5:6
    m_b(i - 4) = input(i);
end

%% 全局变量
% 刚体参数：定义质量、重心位置、惯性张量
global m_0 x_G I_yy
% 惯性水动力系数
global Z_w_dot Z_q_dot M_q_dot M_w_dot
% 控制参数
global K_0

%% 广义力建模
% M_RB矩阵改写
m = m_0 + m_b(1) + m_b(2);
M_RB = [m -m * x_G;
       -m * x_G I_yy;];
% 惯性类水动力建模
M_A = -[Z_w_dot Z_q_dot;
        M_w_dot M_q_dot];
M = M_A + M_RB;

%% 微分方程
output = xi + K_0 * M * V_hat;
end