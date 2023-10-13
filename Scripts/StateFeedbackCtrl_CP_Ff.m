%% 文件名：StateFeedbackCtrl_CP_Ff
%% 作用：输出第四章辅助函数f
%% 输入：eta(2 * 1)、varv_hat(2 * 1)、varv_d_dot(2 * 1)、m_b(2 * 1) 共有 4 * 2 = 8 个参数
function output = StateFeedbackCtrl_CP_Ff(input)

% 参数输入：
eta = zeros(2,1);
for i = 1:2
    eta(i) = input(i);
end
varv_hat = zeros(2,1);
for i = 3:4
    varv_hat(i - 2) = input(i);
end
varv_d_dot = zeros(2,1);
for i = 5:6
    varv_d_dot(i - 4) = input(i);
end
m_b = zeros(2,1);
for i = 7:8
    m_b(i - 6) = input(i);
end

%% 中间变量定义：
% 潜艇运动参数（弱机动状态）
global u_0
% FrameTrans var
R_1 = [cos(eta(2)) 0; 0 1];
R_2 = [-1 * u_0 * sin(eta(2)); 0];
R_1_dot = [-1 * sin(eta(2)) * varv_hat(2), 0; 0, 0];
R_2_dot = [-1 * u_0 * cos(eta(2)) * varv_hat(2); 0];
v_hat = R_1\(varv_hat - R_2);

%% 全局变量引入&系数定义
% 刚体参数：定义质量、重心位置、惯性张量
global m_0 g x_G z_G I_yy
% M_RB矩阵改写
m = m_0 + m_b(1) + m_b(2);
M_RB = [m, -m * x_G;
    -m * x_G, I_yy;];
% C_RB矩阵改写
C_RB = [0 ,-m * z_G * v_hat(2);
    0 ,+m * z_G * v_hat(1)];
% 惯性水动力系数
global X_u_dot Z_w_dot Z_q_dot M_q_dot M_w_dot
% 惯性类水动力建模
M_A = -[Z_w_dot Z_q_dot;
    M_w_dot M_q_dot];
M = M_RB + M_A;
C_A = [0, (X_u_dot - m) * u_0;
    (Z_w_dot-X_u_dot) * u_0, (Z_q_dot + m_0) * u_0];
C = C_RB + C_A;
% 粘性水动力系数
%   线性水动力系数
global Z_w M_q Z_q M_w
% 二阶非线性水动力系数
global Z_ww M_ww Z_qq M_qq
% 阻尼力建模
D_linear = -[Z_w, Z_q;
    M_w, M_q];
D_nonlinear = -[Z_ww, Z_qq;
    M_ww, M_qq];
D = D_linear + D_nonlinear .* abs(v_hat');
% 恢复力建模
g_eta = [0; m_0 * g * (x_G * cos(eta(2)) + z_G * sin(eta(2)))];

%% 计算值
output = (R_1 / M ) * (C * v_hat + D * v_hat + g_eta) - R_1_dot * v_hat - R_2_dot + varv_d_dot;
end