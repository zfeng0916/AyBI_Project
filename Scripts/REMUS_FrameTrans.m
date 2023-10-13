%% suboff纵深控制运动学方程
%% 运动学方程
function eta_dot = REMUS_FrameTrans(input)
%% 输入变量声明
% w q 随体坐标系下的UUV速度         V：向量形式速度信息
V = zeros(2,1);
for i = 1:2
    V(i) = input(i);
end

% z theta: NED系下的UUV位姿定义     eta：向量形式表示位姿信息
eta = zeros(2,1);
for i = 3:4
    eta(i-2) = input(i);
end
%% 旋转矩阵R_theta和S_theta
global u_0
R_theta = [cos(eta(2)) 0; 0 1];
S_theta = [-u_0*sin(eta(2)); 0];
%% 动力学计算方程
eta_dot = R_theta * V + S_theta;
end