%% 桨舵控制力建模
%% 在 State feedback controllor 中叫做Control Planes模块的b_cp
% 输入参数 var_c_cp(3*1) 控制量 u_0 delta_bcp delta_scp
% 全局换参数 水动力系数、潜器航行状态
% 输出 tau_cp
% 运行此函数需要运行脚本 REMUS_All_Para_Init
function output =  REMUS_tau_cp(input)
global Z_uudbcp Z_uudscp M_uudbcp M_uudscp u_0
var_c_cp = zeros(3,1);
for i = 1:3
    var_c_cp(i) = input(i);
end
output = u_0^2 * [Z_uudbcp * var_c_cp(1) ^ 2 * var_c_cp(2) + Z_uudscp * var_c_cp(1) ^ 2 * var_c_cp(3); M_uudbcp * var_c_cp(1) ^ 2 * var_c_cp(2) + M_uudscp * var_c_cp(1) ^ 2 * var_c_cp(3)];
end