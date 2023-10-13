%% 文件名：StateFeedbackCtrl_CP_delta2
%% 作用：输出第四章delta
%% 输入：e_eta(2*1)、e_varv_hat(2 * 1)、eta(2 * 1)、Ff(2 * 1)、Flambda(2 * 1)、FS(2 * 1)、m_b(2 * 1) 共有 7 * 2 = 14 个参数
function output = StateFeedbackCtrl_CP_delta2(input)

%% 参数输入：
e_eta = zeros(2,1);
for i = 1:2
    e_eta(i) = input(i);
end
e_varv_hat = zeros(2,1);
for i = 3:4
    e_varv_hat(i - 2) = input(i);
end
eta = zeros(2,1);
for i = 5:6
    eta(i - 4) = input(i);
end
Ff = zeros(2,1);
for i = 7:8
    Ff(i - 6) = input(i);
end
Flambda = zeros(2,1);
for i = 9:10
    Flambda(i - 8) = input(i);
end
FS = zeros(2,1);
for i = 11:12
    FS(i - 10) = input(i);
end
m_b = zeros(2,1);
for i = 13:14
    m_b(i - 12) = input(i); 
end

%% 中间变量定义：
% FrameTrans var
R_1 = [cos(eta(2)) 0; 0 1];

%% 全局变量引入&系数定义
% 刚体参数：定义质量、重心位置、惯性张量
global m_0 x_G I_yy
% M_RB矩阵改写
m = m_0 + m_b(1) + m_b(2);
M_RB = [m, -m * x_G;
    -m * x_G, I_yy;];
% 惯性水动力系数
global Z_w_dot Z_q_dot M_q_dot M_w_dot
% 惯性类水动力建模
M_A = -[Z_w_dot Z_q_dot;
    M_w_dot M_q_dot];
M = M_RB + M_A;
b = -1 * R_1 / M;
% 舵参数
global Z_uudbcp Z_uudscp M_uudbcp M_uudscp
% 潜艇运动参数（弱机动状态）
global u_0
b_cp = u_0 ^ 2 * [Z_uudbcp, Z_uudscp; M_uudbcp, M_uudscp];

%% 控制参数引入
global a_1_CP k_1_CP
global gamma_1_CP gamma_2_CP alpha_CP beta_CP

%% 计算值
output = -inv(b_cp) * inv(b) * (Ff + a_1_CP * k_1_CP * diag(abs(e_eta) .^ (a_1_CP - 1))) * (Flambda /  k_1_CP + e_varv_hat) + alpha_CP * PublicFunc_sig(gamma_1_CP, FS + beta_CP * PublicFunc_sig(gamma_2_CP, FS));
end