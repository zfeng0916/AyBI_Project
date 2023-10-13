%% suboff纵深控制动力
% 注：输入12个量 输出V_dot(2*2);
function V_dot = REMUS_DynEqn(input)
%% 输入值声明 %修改成2自由度模型
% w q：随体坐标系中定义的速度           V：向量形式速度信息
V = zeros(2,1);
for i = 1:2
    V(i) = input(i);
end

% z theta：NED坐标                     eta：向量形式位姿信息
eta = zeros(2,1);
for i = 3:4
    eta(i-2) = input(i);
end

% tau_cp: Z_cp M_cp 控制面控制力
tau_cp = zeros(2,1);
for i = 5:6
    tau_cp(i - 4) = input(i);
end
% tau_VBS: Z_VBS M_VBS VBS控制力
tau_VBS = zeros(2,1);
for i = 7:8
    tau_VBS(i - 6) = input(i);
end
% tau_w: 环境绕动力
tau_w = zeros(2,1);
for i = 9:10
    tau_w(i - 8) = input(i); 
end
% m_b: VBS控制量 m_bb m_sb
m_b = zeros(2,1);
for i = 11:12
    m_b(i - 10) = input(i);
end
%% 参数定义：.slx文件中无法使用.m文件的全局变量，所以需要在动力学方程中重新定义需要用到的全局变量
%% 通用参数定义
global m_0 g x_G z_G x_B z_B I_yy
G_loca = [x_G; z_G]; %重心位置
B_loca = [x_B; z_B]; %浮心位置
%% 刚体参数定义
% M_RB矩阵改写
m = m_0 + m_b(1) + m_b(2);
M_RB = [m, -m * x_G;
        -m * x_G, I_yy;];
% C_RB矩阵改写
C_RB = [0 ,-m * z_G * V(2);
        0 ,+m * z_G * V(1)];
%% 潜艇弱机动状态
global u_0
%% 惯性类水动力建模
global X_u_dot Z_w_dot Z_q_dot M_q_dot M_w_dot
M_A = -[Z_w_dot Z_q_dot;
        M_w_dot M_q_dot];
C_A = [0, (X_u_dot - m) * u_0;
        (Z_w_dot-X_u_dot) * u_0, (Z_q_dot + m) * u_0];
%% 粘性类水动力建模
global Z_q M_q Z_w M_w
D_linear = -[Z_w Z_q;
            M_w M_q];
global Z_qq Z_ww M_qq M_ww
D_nonlinear = -[Z_ww Z_qq;
                M_ww M_qq];
D = D_linear + D_nonlinear .* abs(V)';
%% 恢复力建模
g_eta = [0; m_0 * g * (x_G * cos(eta(2)) + z_G * sin(eta(2)))];
%% 控制力建模
% 桨舵控制力建模（单独模块）
% VBS控制力向量（单独模块）
%% 环境（波浪）扰动力建模
% 这个放在simulink里面进行处理
%% 六自由度水下机器人建模公式 
% M * V_dot + CV + DV + g_eta = tau_w + tau_cp + tau_VBS
M = M_RB + M_A;
C = C_RB + C_A;
V_dot = M \ (-C * V - D * V - g_eta + tau_w + tau_cp + tau_VBS);
% V_dot(2) = 0;
end