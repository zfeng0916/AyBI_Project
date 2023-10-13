%% VBS控制力建模
% 输入参数 
%   位姿向量 eta:z tehta
%   控制量 var_c_VBS(m_b):m_bb m_sb
% 全局换参数 VBS安装位置
% 输出 tau_VBS
% 运行此函数需要运行脚本 REMUS_All_Para_Init
function output =  REMUS_tau_VBS(input)
% 全局变量
%   VBS位置参数
global z_bg z_sg x_bg x_sg
%   刚体位姿参数
global g
% 位姿向量
eta = zeros(2,1);
for i = 1:2
    eta(i) = input(i);
end
% VBS控制量 var_c_VBS:m_bb m_sb
m_b = zeros(2,1);
for i = 3:4
    m_b(i - 2) = input(i);
end

b = g * [cos(eta(2)), cos(eta(2));
         -(z_bg * sin(eta(2)) + x_bg * cos(eta(2))), -(z_sg * sin(eta(2)) + x_sg * cos(eta(2)))];

output = b * m_b;

% output = [(m_b(1) + m_b(2)) * g * cos(eta(2));
%     -(z_bg * m_b(1) + z_sg * m_b(2)) * g * sin(eta(2)) - (x_bg * m_b(1) + x_sg * m_b(2)) * g * cos(eta(2))];
end