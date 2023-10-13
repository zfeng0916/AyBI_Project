%% FTD 所有参数定义
% 文件名: FTD_All_Para_Init

%% 微分器一二阶微分方程系数选取
% 一阶微分器系数为下标1的参数；二阶微分器系数为下标2的参数
global l_1 varl_1 l_2 varl_2 alpha_1 alpha_2 beta_1 beta_2 epsilon varepsilon
% l_1 = 177.8279; l_2 = 177.8279;
% varl_1 = 0.6183; varl_2 = 0.6183;
% epsilon = 0.1075; varepsilon = 0.1075;  % Tdf = 34.5s
% l_1 = 160; l_2 = 160;
% varl_1 = 0.5; varl_2 = 0.5;
% epsilon = 0.1; varepsilon = 0.1;  % Tdf = 45.06s
% l_1 = 1000; l_2 = 1000;
% varl_1 = 1000; varl_2 = 1000;
% epsilon = 1e-4; varepsilon = 1e-4;  % Tdf = 20017.6125s
l_1 = 1e3; l_2 = 1e3;
varl_1 = 1e3; varl_2 = 1e3;
epsilon = 0.1; varepsilon = 0.1;  % Tdf = 31.399823s % 适用于AsyTime
alpha_1 = 1 - epsilon; alpha_2 = 2 * alpha_1 - 1;
beta_1 = 1 + varepsilon; beta_2 = 2 * beta_1 - 1;

%% 特征值计算
Q_1 = diag([1,1]);
Q_2 = diag([1,1]);
A_1 = [-l_1, 1;-l_2 0]; A_2 = [-varl_1, 1; -varl_2 0];
P_1 = lyap(A_1',Q_1); P_2 = lyap(A_2', Q_2);
T_df = (max(eig(P_1))) ^ (1 + epsilon) / epsilon + max(eig(P_2)) / (varepsilon * min(eig(P_2)) ^ varepsilon);
% P_1_max = max(eig(P_1));
% P_1_min = min(eig(P_1));
% P_2_max = max(eig(P_2));
% P_2_min = min(eig(P_2));
fprintf("p_11, p_12 = %f, %f\n", max(eig(P_1)),min(eig(P_1)));
fprintf("p_21, p_22 = %f, %f\n", max(eig(P_2)),min(eig(P_2)));
fprintf("T_df = %f\n", T_df);

disp("########### FTD   参数初始化完成 ###########");

%% 调参过程 
% alpha_1 = 0.5 * (2 - epsilon);
% beta_1 = 0.5 * (2 + varepsilon);
