%% 所有参数初始化程序
% 程序名称：All_Para_Init
clc;
clear;
REMUS_All_Para_Init;    %REMUS平台参数初始化 
FTD_All_Para_Init;      %固定时间微分器FTD参数初始化
DistObsv_All_Para_Init; %波吸力扰动观测器参数初始化
GeneralForceCtrl_VBS_All_Para_Init  %VBS消除扰动力控制器参数初始化
StateFeedbackCtrl_All_Para_Init     %StateFeedbackCtrl所有参数初始化
disp("###########   参数初始化完成     ###########");