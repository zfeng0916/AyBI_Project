%% StateFeedbackCtrl所有参数初始化
% 文件名：StateFeedbackCtrl_All_Para_Init
% _4_n 代表作用域为第四章的第几个变量

%% 1
% %% S函数和Lambda函数的参数定义:
% global a_1_CP a_2_CP k_1_CP k_2_CP
% a_1_CP = 1 + 1e-1;   a_2_CP = 2 - 6e-1;
% k_1_CP = 1e2;          k_2_CP = 1e2;
% 
% %% delta控制器参数定义
% global gamma_1_CP gamma_2_CP alpha_CP beta_CP
% gamma_1_CP = 1 + 5e1;    gamma_2_CP = 1 - 5e-4;
% alpha_CP = 2e0;          beta_CP = 2e0;
% 
% %% 计算收敛时间 T_cp1 = 1e3
% T_cp1 = (alpha_CP * (gamma_1_CP - 1) * 2 ^ ((gamma_1_CP - 1)/2))^-1 + (beta_CP * (1 - gamma_2_CP) * 2 ^ ((gamma_2_CP - 1)/2))^-1

% %% 超调严重，
% %% S函数和Lambda函数的参数定义:
% global a_1_CP a_2_CP k_1_CP k_2_CP
% a_1_CP = 1 + 4e-1;   a_2_CP = 2 - 4e-1;
% k_1_CP = 2e0;          k_2_CP = 2e0;
% 
% %% delta控制器参数定义
% global gamma_1_CP gamma_2_CP alpha_CP beta_CP
% gamma_1_CP = 1 + 5e1;    gamma_2_CP = 1 - 5e-4;
% alpha_CP = 2e1;          beta_CP = 2e1;
% 
% %% 计算收敛时间 T_cp1 = 100.0173 补偿0.01s
% T_cp1 = (alpha_CP * (gamma_1_CP - 1) * 2 ^ ((gamma_1_CP - 1)/2))^-1 + (beta_CP * (1 - gamma_2_CP) * 2 ^ ((gamma_2_CP - 1)/2))^-1

% %% 超调严重，
% %% S函数和Lambda函数的参数定义:
% global a_1_CP a_2_CP k_1_CP k_2_CP
% a_1_CP = 1 + 4e-1;   a_2_CP = 2 - 4e-1;
% k_1_CP = 2e-1;          k_2_CP = 2e1;
% 
% %% delta控制器参数定义
% global gamma_1_CP gamma_2_CP alpha_CP beta_CP
% gamma_1_CP = 1 + 5e-1;    gamma_2_CP = 1 - 5e-4;
% alpha_CP = 2e1;          beta_CP = 2e1;

%% 超调严重，
%% S函数和Lambda函数的参数定义:
global a_1_CP a_2_CP k_1_CP k_2_CP
a_1_CP = 1 + 4e-1;   a_2_CP = 2 - 4e-1;
k_1_CP = 2e-1;          k_2_CP = 2e1;

%% delta控制器参数定义
global gamma_1_CP gamma_2_CP alpha_CP beta_CP
gamma_1_CP = 1 + 1e-6;    gamma_2_CP = 1 - 5e-2;
alpha_CP = 2e1;          beta_CP = 2e1;

%% 计算收敛时间 T_cp1 = 100.0173 补偿0.01s
T_cp1 = (alpha_CP * (gamma_1_CP - 1) * 2 ^ ((gamma_1_CP - 1)/2))^-1 + (beta_CP * (1 - gamma_2_CP) * 2 ^ ((gamma_2_CP - 1)/2))^-1

%% 显示初始化完成:
disp("###########   StateFeedbackCtrl参数初始化完成     ###########");




