%% 包括ModelPara.mlx中的全部参数和控制器所需的全部参数
% 文件名：REMUS_All_Para_Init
%% 刚体参数：定义质量、重心位置、惯性张量
global  m_0 g x_G y_G z_G I_yy 
m_0 = 733.1454143; g = 9.801; 
x_G = 0; y_G = 0; z_G = 0.056565657;
I_yy = 690.7213821; 
%% 水动力系数
% 惯性水动力系数
global X_u_dot Z_w_dot Z_q_dot M_q_dot M_w_dot
X_u_dot = -10.37397298; Z_q_dot = -62.13212883;
M_q_dot = -453.3937281;
Z_w_dot = -481.6; M_w_dot = -62.13212883;
% 粘性水动力系数
%   线性水动力系数
global Z_w M_q Z_q M_w
Z_w = -6; M_q = -14; Z_q = -0.3; M_w = 0.56;
%   二阶非线性水动力系数
global Z_ww M_ww Z_qq M_qq
Z_ww = -396; M_ww = 34.91229471;
Z_qq = -20.04585773; M_qq = -859.3403779;
%% 潜艇运动参数
global u_0
u_0 = 0.514 * 1;    % 0.514 * 2
%% 潜艇控制力参数
% 桨的控制力
global Z_uudbcp Z_uudscp M_uudbcp M_uudscp
% Z_uudbcp = -41.44; Z_uudscp = -37.25996451;
% M_uudbcp = 34.3010397; M_uudscp = -68.6020794;
Z_uudbcp = -80.29168202; Z_uudscp = -80.29168202;
M_uudbcp = 147.8309606; M_uudscp = -147.8309606;
% VBS的控制力
global z_bg z_sg x_bg x_sg
z_bg = 0;
z_sg = 0;
x_bg = 1.5;
x_sg = -1.5;

disp("########### REMUS 参数初始化完成 ###########");
%%%% 初始化 %%%%