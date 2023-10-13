%% 文件名称 FTD_test_m

%% 载入数据
load("Data\FTD_test_d.mat");
% 几个量：V eta V_hat eta_hat error_V_hat error_eta_hat
% 这几个量都是二维的并且都具有step ramp 和 sinewave 这三种维度

%% 计算IAE ITAE ISE ITSE 参数
% trapz(t,abs(e));          % IAE trapz=numerical integration
% trapz(t,e.^2);            % ISE
% trapz(t, t'.*abs(e));     % ITAE
% trapz(t,t'.*(e.^2));      % ITSE
% 分别计算error_V_hat 中 z 和 theta 
% 分别计算error_eta_hat 中 z 和 theta
index_value = cell(2,2,3);
% V_hat_step w q 四个指标 
index_value{1,1,1} = zeros(4,1);
index_value{2,1,1} = zeros(4,1);
index_value{1,1,1}(1) = trapz(out.t.Data,abs(out.error_V_hat_step.Data(:,1)));   % IAE
index_value{2,1,1}(1) = trapz(out.t.Data,abs(out.error_V_hat_step.Data(:,2)));   % IAE
index_value{1,1,1}(2) = trapz(out.t.Data,out.error_V_hat_step.Data(:,1).^2);     % ISE
index_value{2,1,1}(2) = trapz(out.t.Data,out.error_V_hat_step.Data(:,2).^2);     % ISE
index_value{1,1,1}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_V_hat_step.Data(:,1)));     % ITAE
index_value{2,1,1}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_V_hat_step.Data(:,2)));     % ITAE
index_value{1,1,1}(4) = trapz(out.t.Data,out.t.Data .* (out.error_V_hat_step.Data(:,1).^2));     % ITSE
index_value{2,1,1}(4) = trapz(out.t.Data,out.t.Data .* (out.error_V_hat_step.Data(:,2).^2));     % ITSE
% V_hat_ramp w q 四个指标 
index_value{1,1,2} = zeros(4,1);
index_value{2,1,2} = zeros(4,1);
index_value{1,1,2}(1) = trapz(out.t.Data,abs(out.error_V_hat_ramp.Data(:,1)));   % IAE
index_value{2,1,2}(1) = trapz(out.t.Data,abs(out.error_V_hat_ramp.Data(:,2)));   % IAE
index_value{1,1,2}(2) = trapz(out.t.Data,out.error_V_hat_ramp.Data(:,1).^2);     % ISE
index_value{2,1,2}(2) = trapz(out.t.Data,out.error_V_hat_ramp.Data(:,2).^2);     % ISE
index_value{1,1,2}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_V_hat_ramp.Data(:,1)));     % ITAE
index_value{2,1,2}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_V_hat_ramp.Data(:,2)));     % ITAE
index_value{1,1,2}(4) = trapz(out.t.Data,out.t.Data .* (out.error_V_hat_ramp.Data(:,1).^2));     % ITSE
index_value{2,1,2}(4) = trapz(out.t.Data,out.t.Data .* (out.error_V_hat_ramp.Data(:,2).^2));     % ITSE
% V_hat_sine_wave w q 四个指标 
index_value{1,1,3} = zeros(4,1);
index_value{2,1,3} = zeros(4,1);
index_value{1,1,3}(1) = trapz(out.t.Data,abs(out.error_V_hat_sine_wave.Data(:,1)));   % IAE
index_value{2,1,3}(1) = trapz(out.t.Data,abs(out.error_V_hat_sine_wave.Data(:,2)));   % IAE
index_value{1,1,3}(2) = trapz(out.t.Data,out.error_V_hat_sine_wave.Data(:,1).^2);     % ISE
index_value{2,1,3}(2) = trapz(out.t.Data,out.error_V_hat_sine_wave.Data(:,2).^2);     % ISE
index_value{1,1,3}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_V_hat_sine_wave.Data(:,1)));     % ITAE
index_value{2,1,3}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_V_hat_sine_wave.Data(:,2)));     % ITAE
index_value{1,1,3}(4) = trapz(out.t.Data,out.t.Data .* (out.error_V_hat_sine_wave.Data(:,1).^2));     % ITSE
index_value{2,1,3}(4) = trapz(out.t.Data,out.t.Data .* (out.error_V_hat_sine_wave.Data(:,2).^2));     % ITSE
% eta_hat_step z theta 四个指标 
index_value{1,2,1} = zeros(4,1);
index_value{2,2,1} = zeros(4,1);
index_value{1,2,1}(1) = trapz(out.t.Data,abs(out.error_eta_step.Data(:,1)));   % IAE
index_value{2,2,1}(1) = trapz(out.t.Data,abs(out.error_eta_step.Data(:,2)));   % IAE
index_value{1,2,1}(2) = trapz(out.t.Data,out.error_eta_step.Data(:,1).^2);     % ISE
index_value{2,2,1}(2) = trapz(out.t.Data,out.error_eta_step.Data(:,2).^2);     % ISE
index_value{1,2,1}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_eta_step.Data(:,1)));     % ITAE
index_value{2,2,1}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_eta_step.Data(:,2)));     % ITAE
index_value{1,2,1}(4) = trapz(out.t.Data,out.t.Data .* (out.error_eta_step.Data(:,1).^2));     % ITSE
index_value{2,2,1}(4) = trapz(out.t.Data,out.t.Data .* (out.error_eta_step.Data(:,2).^2));     % ITSE
% eta_hat_ramp z theta 四个指标 
index_value{1,2,2} = zeros(4,1);
index_value{2,2,2} = zeros(4,1);
index_value{1,2,2}(1) = trapz(out.t.Data,abs(out.error_eta_ramp.Data(:,1)));   % IAE
index_value{2,2,2}(1) = trapz(out.t.Data,abs(out.error_eta_ramp.Data(:,2)));   % IAE
index_value{1,2,2}(2) = trapz(out.t.Data,out.error_eta_ramp.Data(:,1).^2);     % ISE
index_value{2,2,2}(2) = trapz(out.t.Data,out.error_eta_ramp.Data(:,2).^2);     % ISE
index_value{1,2,2}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_eta_ramp.Data(:,1)));     % ITAE
index_value{2,2,2}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_eta_ramp.Data(:,2)));     % ITAE
index_value{1,2,2}(4) = trapz(out.t.Data,out.t.Data .* (out.error_eta_ramp.Data(:,1).^2));     % ITSE
index_value{2,2,2}(4) = trapz(out.t.Data,out.t.Data .* (out.error_eta_ramp.Data(:,2).^2));     % ITSE
% eta_hat_sine_wave z theta 四个指标 
index_value{1,2,3} = zeros(4,1);
index_value{2,2,3} = zeros(4,1);
index_value{1,2,3}(1) = trapz(out.t.Data,abs(out.error_eta_sine_wave.Data(:,1)));   % IAE
index_value{2,2,3}(1) = trapz(out.t.Data,abs(out.error_eta_sine_wave.Data(:,2)));   % IAE
index_value{1,2,3}(2) = trapz(out.t.Data,out.error_eta_sine_wave.Data(:,1).^2);     % ISE
index_value{2,2,3}(2) = trapz(out.t.Data,out.error_eta_sine_wave.Data(:,2).^2);     % ISE
index_value{1,2,3}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_eta_sine_wave.Data(:,1)));     % ITAE
index_value{2,2,3}(3) = trapz(out.t.Data,out.t.Data .* abs(out.error_eta_sine_wave.Data(:,2)));     % ITAE
index_value{1,2,3}(4) = trapz(out.t.Data,out.t.Data .* (out.error_eta_sine_wave.Data(:,1).^2));     % ITSE
index_value{2,2,3}(4) = trapz(out.t.Data,out.t.Data .* (out.error_eta_sine_wave.Data(:,2).^2));     % ITSE

%% 画图模块
% V_hat六张图
% Heave
figure;
hold on;
set(gca,'FontSize',10);
set(legend,'Location','SouthEast');
set(gcf,'unit','centimeters','position',[0 0 32 18])
title('\textup {Heave velocity estimation of FTD under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Heave Velocity (m/s)}','fontsize',12,Interpreter="latex");
plot(out.t.Data,out.V_hat_step.Data(:,1),'- r','LineWidth',0.2);
plot(out.t.Data,out.error_V_hat_step.Data(:,1),'b','LineWidth',0.2);
plot(out.t.Data,out.out_V_step.Data(:,1),'k','LineWidth',1.2);
h=legend('\textbf {Estimated ($\hat{w}$)}','\textbf {Estimated Error ($e_w$)}','\textbf{Actual ($w$)}'); 
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
grid on;
hold off;
print('./Pictures/FTD/FTD_tracking_w_step.png','-dpng','-r600');

figure;
hold on;
set(gca,'FontSize',10);
set(legend,'Location','SouthEast');
set(gcf,'unit','centimeters','position',[0 0 32 18])
title('\textup {Heave velocity estimation of FTD under ramp disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Heave Velocity (m/s)}','fontsize',12,Interpreter="latex");
plot(out.t.Data,out.V_hat_ramp.Data(:,1),'- r','LineWidth',0.2);
plot(out.t.Data,out.error_V_hat_ramp.Data(:,1),'b','LineWidth',0.2);
plot(out.t.Data,out.V_ramp.Data(:,1),'k','LineWidth',1.2);
h=legend('\textbf {Estimated ($\hat{w}$)}','\textbf {Estimated Error ($e_w$)}','\textbf{Actual ($w$)}'); 
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
grid on;
hold off;
print('./Pictures/FTD/FTD_tracking_w_ramp.png','-dpng','-r600');

figure;
hold on;
set(gca,'FontSize',10);
set(legend,'Location','SouthEast');
set(gcf,'unit','centimeters','position',[0 0 32 18])
title('\textup {Heave velocity estimation of FTD under sinusoidal disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Heave Velocity (m/s)}','fontsize',12,Interpreter="latex");
plot(out.t.Data,out.V_hat_sine_wave.Data(:,1),'- r','LineWidth',0.2);
plot(out.t.Data,out.error_V_hat_sine_wave.Data(:,1),'b','LineWidth',0.2);
plot(out.t.Data,out.V_sine_wave.Data(:,1),'k','LineWidth',1.2);
h=legend('\textbf {Estimated ($\hat{w}$)}','\textbf {Estimated Error ($e_w$)}','\textbf{Actual ($w$)}'); 
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
grid on;
hold off;
print('./Pictures/FTD/FTD_tracking_w_sinusoidal.png','-dpng','-r600');

% Pitch
figure;
hold on;
set(gca,'FontSize',10);
set(legend,'Location','SouthEast');
set(gcf,'unit','centimeters','position',[0 0 32 18])
title('\textup {Pitch velocity estimation of FTD under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch Velocity (m/s)}','fontsize',12,Interpreter="latex");
plot(out.t.Data,out.V_hat_step.Data(:,2),'- r','LineWidth',0.2);
plot(out.t.Data,out.error_V_hat_step.Data(:,2),'b','LineWidth',0.2);
plot(out.t.Data,out.out_V_step.Data(:,2),'k','LineWidth',1.2);
h=legend('\textbf {Estimated ($\hat{w}$)}','\textbf {Estimated Error ($e_w$)}','\textbf{Actual ($w$)}'); 
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
grid on;
hold off;
print('./Pictures/FTD/FTD_tracking_q_step.png','-dpng','-r600');

figure;
hold on;
set(gca,'FontSize',10);
set(legend,'Location','SouthEast');
set(gcf,'unit','centimeters','position',[0 0 32 18])
title('\textup {Pitch velocity estimation of FTD under ramp disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch Velocity (m/s)}','fontsize',12,Interpreter="latex");
plot(out.t.Data,out.V_hat_ramp.Data(:,2),'- r','LineWidth',0.2);
plot(out.t.Data,out.error_V_hat_ramp.Data(:,2),'b','LineWidth',0.2);
plot(out.t.Data,out.V_ramp.Data(:,2),'k','LineWidth',1.2);
h=legend('\textbf {Estimated ($\hat{w}$)}','\textbf {Estimated Error ($e_w$)}','\textbf{Actual ($w$)}'); 
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
grid on;
hold off;
print('./Pictures/FTD/FTD_tracking_q_ramp.png','-dpng','-r600');

figure;
hold on;
set(gca,'FontSize',10);
set(legend,'Location','SouthEast');
set(gcf,'unit','centimeters','position',[0 0 32 18])
title('\textup {Pitch velocity estimation of FTD under sinusoidal disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch Velocity (m/s)}','fontsize',12,Interpreter="latex");
plot(out.t.Data,out.V_hat_sine_wave.Data(:,2),'- r','LineWidth',0.2);
plot(out.t.Data,out.error_V_hat_sine_wave.Data(:,2),'b','LineWidth',0.2);
plot(out.t.Data,out.V_sine_wave.Data(:,2),'k','LineWidth',1.2);
h=legend('\textbf {Estimated ($\hat{w}$)}','\textbf {Estimated Error ($e_w$)}','\textbf{Actual ($w$)}'); 
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
grid on;
hold off;
print('./Pictures/FTD/FTD_tracking_q_sinusoidal.png','-dpng','-r600');

%% 计算FTD的增益阵的Tdf系数，估计收敛时间，便于调参
% 
% 
% %% FTD的平均绝对百分比误差(MAPE)
% model = 'Fixed_time_differentiator_Model';
% simOut = sim(model);
% e = cat(2,simOut.tout, simOut.yout{4}.Values.Data(:,1), simOut.yout{4}.Values.Data(:,2));
% 
% %% 计算仿真计算得分
% mape_z = mean(abs(e(:,2)));
% mape_theta = mean(abs(e(:,3)));
% 
% %% 进行误差画图
% subplot(1,2,1);
% plot(simOut.tout,e(:,2),'b');
% subplot(1,2,2);
% plot(simOut.tout,e(:,3),'g');
% 
% 
% %% 获得相应参数指标
% len = size(e,1);
% Tp_z = 0;
% Tp_theta = 0;
% Tp_z_count = 1;
% Tp_theta_count = 1;
% 
% % 上升时间Tr
% for i = 1:len-1
%     if (e(i, 2) * e(i+1, 2) < 0)
%         Tr_z = e(i, 1);break
%     end
% end
% for i = 1:len-1
%     if (e(i, 3) * e(i+1, 3) < 0)
%         Tr_theta = e(i, 1);break
%     end
% end
% 
% 
% for  i = 1:len-2
%     % 谱峰时间Tp
%     if ((e(i, 2) - e(i+1, 2)) >= 0)
%         Tp_z_temp = e(i, 1);
%         if (e(i, 2) >= e(Tp_z_count, 2))
%             Tp_z = Tp_z_temp;
%             Tp_z_count = i;
%         end
%     end
%     if ((e(i, 3) - e(i+1, 3)) >= 0)
%         Tp_theta_temp = e(i, 1);
%         if (e(i, 3) >= e(Tp_theta_count, 3))
%             Tp_theta = Tp_theta_temp;
%             Tp_theta_count = i;
%         end
%     end
% 
% end
% 
% % 超调量sigma
% sigma_z = 0;
% sigma_theta = 0;
% sigma_z_count = 0;
% sigma_theta_count = 0;
% for i = Tp_z_count:len-2
%     if((e(i,2)-e(i+1,2))*(e(i+1,2)-e(i+2,2)) <= 0)
%         sigma_z_count = i+1;break
%     end
% end
% for i = Tp_theta_count:len-2
%     if((e(i,3)-e(i+1,3))*(e(i+1,3)-e(i+2,3) <= 0))
%         sigma_theta_count = i+1;break
%     end
% end
% if (e(sigma_z_count, 2) < 0)
%     sigma_z = abs(e(sigma_z_count, 2));
% end
% if (e(sigma_theta_count, 3) < 0)
%     sigma_theta = abs(e(sigma_theta_count, 3));
% end
% 
% % 调节时间 Ts
% % 标定位误差范围e在百分之5时进入正常调节
% % e_std = 0.05;s
% % Ts = 0;
% % for i = 1:len
% %     if (abs(e(2,i) - 1) < e_std)
% %         Ts_z = e(1,i);
% %         break
% %     end
% % end
% % for i = 1:len
% %     if (abs(e(3,i) - 1) < e_std)
% %         Ts_theta = e(1,i);
% %         break
% %     end
% % end
% 
% %% 结果打印输出
% 
% % mape指标
% fprintf("mape_z = %f\n", mape_z);
% fprintf("mape_theta = %f\n", mape_theta);
% 
% % 动态性能指标
% fprintf("Tr_z = %f\n", Tr_z);
% fprintf("Tr_theta = %f\n", Tr_theta);
% fprintf("Tp_z = %f\n", Tp_z);
% fprintf("Tp_theta = %f\n", Tp_theta);
% fprintf("sigma_z = %f\n", sigma_z);
% fprintf("sigma_theta = %f\n", sigma_theta);
% 
% 
% % T = table(l_1,l_2,varl_1,varl_2,alpha_1,beta_1,Q_1_max,Q_1_min,Q_2_max,Q_2_min,Tr_z,Tr_theta,sigma_z,sigma_theta,mape_z,mape_theta);
% % fileID = fopen('FTD_test.txt','w', 'a');
% % writetable(T,'FTD_test.txt','WriteRowNames',true);
% % fclose(fileID);
% 
