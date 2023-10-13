%% 输出转换模块
% 作用将NED系下的速度转化输出为随体系下的速度
% 输入 eta(2*2 z theta)、varv_hat or varv_hat_dot
% 输出 v_hat or v_hat_dot
% 注：运行此程序需进行 REMUS_All_Para_Init 初始化操作
function output = FTD_FrameTrans(input)
    global u_0
    
    eta = zeros(2,1);
    for i = 1:2
        eta(i) = input(i);
    end
    
    varV_hat = zeros(2,1);
    for i = 3:4
        varV_hat(i - 2) = input(i);
    end
    
    R_1 = [cos(eta(2)) 0; 0 1];
    R_2 = [-1 * u_0 * sin(eta(2)); 0];
    output = R_1\(varV_hat - R_2);
end