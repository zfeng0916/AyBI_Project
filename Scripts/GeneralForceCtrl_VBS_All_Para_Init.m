%% 文件名： GeneralForceCtrl_VBS_All_Para_Init
% 用于第三章VBS进行广义力控制器所有参数设置
global varalpha_1 varalpha_2 % varalpha_1∈(0,Inf),varalpha_2∈(0,Inf)
% varalpha_1 = 1e2; varalpha_2 = 1e2;
% global varl_1_VBS varl_2_VBS % varl_1_VBS∈(1,Inf),varl_2_VBS∈(0,1)
% e = 1e-2;

% varalpha_1 = 2e1; varalpha_2 = 4e1;
% global varl_1_VBS varl_2_VBS % varl_1_VBS∈(1,Inf),varl_2_VBS∈(0,1)
% e = 5e-2;
% 
% varalpha_1 = 4e2; varalpha_2 = 4e2;
% global varl_1_VBS varl_2_VBS % varl_1_VBS∈(1,Inf),varl_2_VBS∈(0,1)
% e = 1e-3;

%% 效果最好的
% varalpha_1 = 6e3; varalpha_2 = 6e3;
% global varl_1_VBS varl_2_VBS % varl_1_VBS∈(1,Inf),varl_2_VBS∈(0,1)
% e = 1e-5;

% varalpha_1 = 2e1; varalpha_2 = 2e1;
% global varl_1_VBS varl_2_VBS % varl_1_VBS∈(1,Inf),varl_2_VBS∈(0,1)
% e = 1e-5;

% varalpha_1 = 2e0; varalpha_2 = 2e0;
% global varl_1_VBS varl_2_VBS % varl_1_VBS∈(1,Inf),varl_2_VBS∈(0,1)
% e = 1e-5;

% gain = 2;
% varalpha_1 = gain*2e0; varalpha_2 = gain*2e0;
% global varl_1_VBS varl_2_VBS % varl_1_VBS∈(1,Inf),varl_2_VBS∈(0,1)
% e = 1e-1;

gain = 3;
varalpha_1 = gain*2e0; varalpha_2 = gain*2e0;
global varl_1_VBS varl_2_VBS % varl_1_VBS∈(1,Inf),varl_2_VBS∈(0,1)
e = 1e-2;

varl_1_VBS = 1 + e;
varl_2_VBS = 1 - e;
clear e;

%% 计算收敛时间的函数
T_max = 1/(varalpha_1 * (varl_1_VBS - 1)) + 1/(varalpha_2 * (1 - varl_2_VBS));
T_max

%% 初始化完成显示
disp("###########   GeneralForceCtro 参数初始化完成     ###########");