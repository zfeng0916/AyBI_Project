%% 文件名：StateFeedbackCtrl_CP_FS
%% 作用：第四章固定时间非奇异快速终端滑模流形 S 函数
%% 输入：e_eta(2 * 1)、e_varv_hat(2 * 1) 共有 2 * 2 = 4 个参数
function output = StateFeedbackCtrl_CP_FS(input)

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
output = PublicFunc_sig(a_1_CP, e_eta) + k_2_CP * PublicFunc_sig(a_2_CP, (k_1_CP * PublicFunc_sig(a_1_CP, e_eta) + e_varv_hat));
end


