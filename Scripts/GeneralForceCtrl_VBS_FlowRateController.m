%% 文件名： GeneralForceCtro_VBS_FlowRateController
%% 作用： 将输入的V_hat（2 * 1 from FTD)、eta(2 * 1 from Plant)、tau_w_hat(2 * 1 from DistbObsv_FixedTime)、tau_w_hat_dot(2 * 1 from DistbObsv_FixedTime中间的状态)、e_mb转换成所需的流量
%         实际上是压载水质量跟踪器
%% 输入参数： 共5 * 2 = 10 个参数V_hat(w_hat, q_hat)、eta(z, theta)、tau_w_hat(Z_w_hat, M_w_hat)、tau_w_hat_dot(Z_w_hat_dot, M_w_hat_dot)、m_b(m_bb, m_sb)、m_bd(m_bbd, m_sbd)

function output = GeneralForceCtrl_VBS_FlowRateController(input)
%% 参数传入
V_hat = zeros(2,1);
for i = 1:2
    V_hat(i) = input(i);
end
eta = zeros(2,1);
for i = 3:4
    eta(i - 2) = input(i);
end
tau_w_hat = zeros(2,1);
for i = 5:6
    tau_w_hat(i - 4) = input(i);
end
tau_w_hat_dot = zeros(2,1);
for i = 7:8
    tau_w_hat_dot(i - 6) = input(i);
end
e_mb = zeros(2,1);
for i = 9:10
    e_mb(i - 8) = input(i);
end

%% 全局变量导入
global g % 重力量
global x_bg x_sg z_bg z_sg   % VBS位置参数
global varalpha_1 varalpha_2 varl_1_VBS varl_2_VBS

%% q_b解算公式
% b_VBS_inv
b_VBS_inv = (g * (x_bg - x_sg) * cos(eta(2)) ^ 2) ^ -1 .* ...
            [-z_sg * sin(eta(2)) - x_sg * cos(eta(2)), -cos(eta(2));...
            z_bg * sin(eta(2)) + x_bg * cos(eta(2)),    cos(eta(2))]; 
% b_VBS_inv_partial
b_VBS_inv_partial = (g * (x_bg - x_sg) * cos(eta(2)) ^ 3) ^ -1 .* ...
                    [-z_sg * (sin(eta(2)) ^ 2 + 1) - 0.5 * x_sg * sin(2 * eta(2)), -0.5 * sin(2 * eta(2));...
                    z_bg * (sin(eta(2)) ^ 2 + 1) + 0.5 * x_bg * sin(2 * eta(2)), 0.5 * sin(2 * eta(2))];
% q_b计算公式
output = V_hat(2) * (-1 * b_VBS_inv_partial) * tau_w_hat - b_VBS_inv * tau_w_hat_dot + varalpha_1 * PublicFunc_sig(varl_1_VBS, e_mb) + varalpha_2 * PublicFunc_sig(varl_2_VBS, e_mb);

end



% %% 文件名： GeneralForceCtro_FlowRateController
% %% 作用： 将输入的V_hat（2 * 1 from FTD)、eta(2 * 1 from Plant)、tau_w_hat(2 * 1 from DistbObsv_FixedTime)、tau_w_hat_dot(2 * 1 from DistbObsv_FixedTime中间的状态)、m_b(2 * 1 from Plant inout)、m_bd(2 *1 from Ballast planner)转换成所需的流量
% %% 输入参数： 共6 * 2 = 12 个参数V_hat(w_hat, q_hat)、eta(z, theta)、tau_w_hat(Z_w_hat, M_w_hat)、tau_w_hat_dot(Z_w_hat_dot, M_w_hat_dot)、m_b(m_bb, m_sb)、m_bd(m_bbd, m_sbd)
% 
% function output = GeneralForceCtro_VBS_FlowRateController(input)
% %% 参数传入
% V_hat = zeros(2,1);
% for i = 1:2
%     V_hat(i) = input(i);
% end
% eta = zeros(2,1);
% for i = 3:4
%     eta(i - 2) = input(i);
% end
% tau_w_hat = zeros(2,1);
% for i = 5:6
%     tau_w_hat(i - 4) = input(i);
% end
% tau_w_hat_dot = zeros(2,1);
% for i = 7:8
%     tau_w_hat_dot(i - 6) = input(i);
% end
% m_b = zeros(2,1);
% for i = 9:10
%     m_b(i - 8) = input(i);
% end
% m_bd = zeros(2,1);
% for i = 11:12
%     m_bd(i - 10) = input(i);
% end
% 
% %% 全局变量导入
% global g % 重力量
% global x_bg x_sg z_bg z_sg   % VBS位置参数
% global varalpha_1 varalpha_2 varl_1_VBS varl_2_VBS
% 
% %% q_b解算公式
% % e_mb
% e_mb = m_bd - m_b;
% % b_VBS_inv
% b_VBS_inv = (g * (x_bg - x_sg) * cos(eta(2)) ^ 2) ^ -1 .* ...
%             [-z_sg * sin(eta(2)) - x_sg * cos(eta(2)), -cos(eta(2));...
%             z_bg * sin(eta(2)) + x_bg * cos(eta(2)),    cos(eta(2))]; 
% % b_VBS_inv_partial
% b_VBS_inv_partial = (g * (x_bg - x_sg) * cos(eta(2))) ^ -1 .* ...
%                     [-z_sg * (sin(eta(2)) ^ 2 + 1) - 0.5 * x_sg * sin(2 * eta(2)), -0.5 * sin(2 * eta(2));...
%                     z_bg * (sin(eta(2)) ^ 2 + 1) + 0.5 * x_bg * sin(2 * eta(2)), 0.5 * sin(2 * eta(2))];
% % q_b计算公式
% output = V_hat(2) * (-1 * b_VBS_inv_partial) * tau_w_hat - b_VBS_inv * tau_w_hat_dot + varalpha_1 * PublicFunc_sig(varl_1_VBS, e_mb) + varalpha_2 * PublicFunc_sig(varl_2_VBS, e_mb);
% 
% end