%% 文件名：StateFeedbackCtrl_CP_FLambda
%% 作用：辅助函数Lambda
%% 输入：e_eta(2 * 1)、e_varv_hat(2 * 1) 共有 2 * 2 = 4 个参数
function output = StateFeedbackCtrl_CP_FLambda(input)

% 参数输入：
    e_eta = zeros(2,1);
    for i = 1:2
        e_eta(i) = input(i);
    end
    e_varv_hat = zeros(2,1);
    for i = 3:4
        e_varv_hat = input(i - 2);
    end

% 全局变量引入：
global a_1_CP a_2_CP k_1_CP k_2_CP

% 计算值
output = (a_2_CP * k_2_CP) ^ -1 * PublicFunc_sig(2 - a_2_CP, k_1_CP * PublicFunc_sig(a_1_CP, e_eta) + e_varv_hat) + (k_1_CP/a_2_CP) * (k_1_CP * PublicFunc_sig(a_1_CP, e_eta) + e_varv_hat);
end