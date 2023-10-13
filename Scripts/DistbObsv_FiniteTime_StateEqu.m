%% 依有限时间收敛扰动观测器(Disturbance observer in finite time)状态方程(State Equation)
% 作用：将输入的这些量转化成状态量导数值输出
% 输入参数：xi(2*2 辅助状态量)、eta(2*2:z theta)、V_hat(2*2)、m_b(2*2:m_bb m_sb)、q_b(2*2:q_bb q_sb)、tau_cp(2*2:Z_cp M_cp)、tau_VBS(2*2)、tau_w_hat(2*2)
% 输入参数共计 8 * 2 = 16
% 输出参数：xi_dot(2*2)
% 运行此函数需要运行参数化脚本 REMUS_All_Para_Init & DistObsv_All_Para_Init

function output =  DistbObsv_FiniteTime_StateEqu(input)
    %% 输入量采集
    % xi: 2*2 辅助状态量
    xi = zeros(2,1);
    for i = 1:2
        xi(i) = input(i);
    end
    % eta:z theta NED坐标系下位姿状态
    eta = zeros(2,1);
    for i = 3:4
        eta(i - 2) = input(i);
    end
    % V_hat:w_hat q_hat
    V_hat = zeros(2,1);
    for i = 5:6
        V_hat(i - 4) = input(i);
    end
    % m_b:m_bb m_sb 首尾VBS压载水量
    m_b = zeros(2,1);
    for i = 7:8
        m_b(i - 6) = input(i);
    end
    % q_b:q_bb q_sb 首尾VBS流速，也就是质量的导数，这里还没想好是使用q还是simulink微分器模块（暂时先使用微分器模块）
    q_b = zeros(2,1);
    for i = 9:10
        q_b(i - 8) = input(i);
    end
    % tau_cp:Z_cp M_cp 控制面控制力
    tau_cp = zeros(2,1);
    for i = 11:12
        tau_cp(i - 10) = input(i);
    end
    % tau_VBS: Z_VBS M_VBS VBS控制力
    tau_VBS = zeros(2,1);
    for i = 13:14
        tau_VBS(i - 12) = input(i);
    end
    % tau_w_hat: Z_w_hat M_w_hat 波浪观测力
    tau_w_hat = zeros(2,1);
    for i = 15:16
        tau_w_hat(i - 14) = input(i);
    end

    %% 全局变量引入&系数定义
    % 刚体参数：定义质量、重心位置、惯性张量
    global m_0 g x_G z_G I_yy
    % M_dot矩阵改写
    q = sum(q_b);
    M_dot = [q, -q * x_G;
             -q * x_G, 0];
    % M_RB矩阵改写
    m = m_0 + m_b(1) + m_b(2);
    M_RB = [m, -m * x_G;
            -m * x_G, I_yy;];
    % C_RB矩阵改写
    C_RB = [0 ,-m * z_G * V_hat(2);
            0 ,+m * z_G * V_hat(1)];
    % 潜艇运动参数（弱机动状态）
    global u_0
    % 惯性水动力系数
    global X_u_dot Z_w_dot Z_q_dot M_q_dot M_w_dot
    % 惯性类水动力建模
    M_A = -[Z_w_dot Z_q_dot;
            M_w_dot M_q_dot];
    M = M_RB + M_A;
    C_A = [0, (X_u_dot-m_0) * u_0;
            (Z_w_dot-X_u_dot) * u_0, (Z_q_dot + m_0) * u_0];
    C = C_RB + C_A;
    % 粘性水动力系数
    %   线性水动力系数
    global Z_w M_q Z_q M_w
    %   二阶非线性水动力系数
    global Z_ww M_ww Z_qq M_qq
    % 阻尼力建模
    D_linear = -[Z_w, Z_q;
                M_w, M_q];
    D_nonlinear = -[Z_ww, Z_qq;
                    M_ww, M_qq];
    D = D_linear + D_nonlinear .* abs(V_hat');
    % 恢复力建模
    g_eta = [0; m_0 * g * (x_G * cos(eta(2)) + z_G * sin(eta(2)))];

    %% 微分方程书写
    % 辅助状态量书写
    varrho = V_hat - xi;
    output = M \ (0.5 * M_dot * varrho + tau_w_hat - C * V_hat - D * V_hat - g_eta + tau_cp + tau_VBS );

end