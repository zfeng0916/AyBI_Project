%% 程序名称：FTD_test_tau_w_m

%% 载入数据
load("Data\FTD_test_tau_w_d.mat");

%% 计算IAE ITAE ISE ITSE 参数
index_value = zeros(4,2);
index_value(1,1) = trapz(out.tout,abs(out.error_V_hat_tau_w.Data(:,1)));   % IAE
index_value(1,2) = trapz(out.tout,abs(out.error_V_hat_tau_w.Data(:,2)));   % IAE
index_value(2,1) = trapz(out.tout,out.error_V_hat_tau_w.Data(:,1).^2);     % ISE
index_value(2,2) = trapz(out.tout,out.error_V_hat_tau_w.Data(:,2).^2);     % ISE
index_value(3,1) = trapz(out.tout,out.tout .* abs(out.error_V_hat_tau_w.Data(:,1)));     % ITAE
index_value(3,2) = trapz(out.tout,out.tout .* abs(out.error_V_hat_tau_w.Data(:,2)));     % ITAE
index_value(4,1) = trapz(out.tout,out.tout .* (out.error_V_hat_tau_w.Data(:,1).^2));     % ITSE
index_value(4,2) = trapz(out.tout,out.tout .* (out.error_V_hat_tau_w.Data(:,2).^2));     % ITSE

%% Plot
% Heave
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave velocity estimation of FTD under Gaussian white noise disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Heave velocity (m/s)}','fontsize',12,Interpreter="latex");
plot(out.tout,out.V_real.Data(:,1),'-. k','LineWidth',1.0);
p2 = plot(out.tout,out.V_hat.Data(:,1),'- r','LineWidth',1.0);
plot(out.tout,out.error_V_hat_tau_w.Data(:,1),'- b','LineWidth',1.0);
% p2.MarkerSize = 5;
% p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
h=legend('\textbf{Actual ($w$)}','\textbf {Estimated ($\hat{w}$)}','\textbf {Estimated error ($e_w$)}'); 
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/FTD/FTD_tracking_w_Gaussian_white_noise.png','-dpng','-r600');

% Pitch
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Pitch velocity estimation of FTD under Gaussian white noise disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch velocity (rad/s)}','fontsize',12,Interpreter="latex");
plot(out.tout,out.V_real.Data(:,2),'-. k','LineWidth',1.0);
p2 = plot(out.tout,out.V_hat.Data(:,2),'- r','LineWidth',1.0);
plot(out.tout,out.error_V_hat_tau_w.Data(:,2),'- b','LineWidth',1.0);
% p2.MarkerSize = 5;
% p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
h=legend('\textbf{Actual ($q$)}','\textbf {Estimated ($\hat{q}$)}','\textbf {Estimated error ($e_q$)}'); 
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/FTD/FTD_tracking_q_Gaussian_white_noise.png','-dpng','-r600');








% %% 数据采集：
% % 注：1：e_abs_V_hat   2：e_abs_eta_hat 3:V_real    4:V_hat 5:eta_real  6.eta_hat
% % model = 'FTD_test_tau_w.slx';
% % simOut = sim(model);
% % load('FTD_test_tau_w.mat');
% % save('FTD_test_tau_w.mat','out');
% e_abs_V_hat = cat(2,simOut.tout, simOut.yout{1}.Values.Data(:,1), simOut.yout{1}.Values.Data(:,2));
% e_abs_eta_hat = cat(2,simOut.tout, simOut.yout{2}.Values.Data(:,1), simOut.yout{2}.Values.Data(:,2));
% V_real = cat(2,simOut.tout, simOut.yout{3}.Values.Data(:,1), simOut.yout{3}.Values.Data(:,2));
% V_hat = cat(2,simOut.tout, simOut.yout{4}.Values.Data(:,1), simOut.yout{4}.Values.Data(:,2));
% eta_real = cat(2,simOut.tout, simOut.yout{5}.Values.Data(:,1), simOut.yout{5}.Values.Data(:,2));
% eta_hat = cat(2,simOut.tout, simOut.yout{6}.Values.Data(:,1), simOut.yout{6}.Values.Data(:,2));
% e_ral_V_hat = cat(2,simOut.tout,e_abs_V_hat(:,[2,3])./V_real(:,[2,3]));
% e_ral_eta_hat = cat(2,simOut.tout,e_abs_eta_hat(:,[2,3])./eta_real(:,[2,3]));
% e = {1,8};
% e = {e_abs_V_hat,e_abs_eta_hat,V_real,V_hat,eta_real,eta_hat,e_ral_V_hat,e_ral_eta_hat};
% %% 计算MAPE分值：
% % 计算
% mape_w = mean(abs(e_ral_V_hat(:,2)));
% mape_q = mean(abs(e_ral_V_hat(:,3)));
% mape_z = mean(abs(e_ral_eta_hat(:,2)));
% mape_theta = mean(abs(e_ral_eta_hat(:,3)));
% % 打印输出
% fprintf("mape_z = %f\n", mape_z);
% fprintf("mape_theta = %f\n", mape_theta);
% fprintf("mape_w = %f\n", mape_w);
% fprintf("mape_q = %f\n", mape_q);
% % 导入到txt文件
% MAPE = struct('mape_z',mape_z,'mape_theta',mape_theta,'mape_w',mape_w,'mape_q',mape_q);
% MAPE=struct2cell(MAPE);
% MAPE=cell2mat(MAPE);
% save D:\SJTU-YJS\BaiduNetdiskWorkspace\水下航行器动力学建模和控制\DM_动力学建模框架\程序和仿真\程序和仿真2023.8.7debug\FTD_MAPE.txt -ascii MAPE
% 
% %% 绘图
% % Readme.txt:从1-4 z theta w q 绝对误差；5-8 z theta w q 相对误差；9-12 z theta w q跟踪曲线
% 
% f1 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('absolute error of z');
% xlabel('Time(s)','fontsize',20);
% ylabel('error(m)','fontsize',20);
% plot(e{2}(:,1),e{2}(:,2),'b','LineWidth',1.5);
% legend('error of z');
% axis normal;
% hold off;
% print FTD_1.png -dpng -r600
% 
% f2 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('absolute error of theta');
% xlabel('Time(s)','fontsize',20);
% ylabel('error(rad)','fontsize',20);
% plot(e{2}(:,1),e{2}(:,3),'b','LineWidth',1.5);
% legend('error of theta');
% axis normal;
% hold off;
% print FTD_2.png -dpng -r600
% 
% f3 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('absolute error of w');
% xlabel('Time(s)','fontsize',20);
% ylabel('error(m/s)','fontsize',20);
% plot(e{1}(:,1),e{1}(:,2),'b','LineWidth',1.5);
% legend('error of w');
% axis normal;
% hold off;
% print FTD_3.png -dpng -r600
% 
% f4 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('absolute error of q');
% xlabel('Time(s)','fontsize',20);
% ylabel('error(rad/s)','fontsize',20);
% plot(e{1}(:,1),e{1}(:,3),'b','LineWidth',1.5);
% legend('error of q');
% axis normal;
% hold off;
% print FTD_4.png -dpng -r600
% 
% f5 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('relative error of z');
% xlabel('Time(s)','fontsize',20);
% ylabel('error','fontsize',20);
% ylim([-1.2 1.2]);
% plot(e{8}(:,1),e{8}(:,2),'b','LineWidth',1.5);
% legend('error of z');
% axis normal;
% hold off;
% print FTD_5.png -dpng -r600
% 
% f6 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('relative error of theta');
% xlabel('Time(s)','fontsize',20);
% ylabel('error','fontsize',20);
% ylim([-1.2 1.2]);
% plot(e{8}(:,1),e{8}(:,3),'b','LineWidth',1.5);
% legend('error of theta');
% axis normal;
% hold off;
% print FTD_6.png -dpng -r600
% 
% f7 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('relative error of w');
% xlabel('Time(s)','fontsize',20);
% ylabel('error','fontsize',20);
% ylim([-1.2 1.2]);
% plot(e{7}(:,1),e{7}(:,2),'b','LineWidth',1.5);
% legend('error of w');
% axis normal;
% hold off;
% print FTD_7.png -dpng -r600
% 
% f8 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('relative error of q');
% xlabel('Time(s)','fontsize',20);
% ylabel('error','fontsize',20);
% ylim([-1.2 1.2]);
% plot(e{7}(:,1),e{7}(:,3),'b','LineWidth',1.5);
% legend('error of q');
% axis normal;
% hold off;
% print FTD_8.png -dpng -r600
% 
% f9 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('tracking curve of z');
% xlabel('Time(s)','fontsize',20);
% ylabel('z(m)','fontsize',20);
% plot(e{1}(:,1),e{5}(:,2),'b-','LineWidth',1.5);
% plot(e{1}(:,1),e{6}(:,2),'g--','LineWidth',1.5);
% legend('z real','z hat');
% axis normal;
% hold off;
% print FTD_9.png -dpng -r600
% 
% f10 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('tracking curve of theta');
% xlabel('Time(s)','fontsize',20);
% ylabel('theta(rad)','fontsize',20);
% plot(e{1}(:,1),e{5}(:,3),'b-','LineWidth',1.5);
% plot(e{1}(:,1),e{6}(:,3),'g--','LineWidth',1.5);
% legend('theta real','theta hat');
% axis normal;
% hold off;
% print FTD_10.png -dpng -r600
% 
% f11 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('tracking curve of w');
% xlabel('Time(s)','fontsize',20);
% ylabel('theta(m/s)','fontsize',20);
% plot(e{1}(:,1),e{3}(:,2),'b-','LineWidth',1.5);
% plot(e{1}(:,1),e{4}(:,2),'g--','LineWidth',1.5);
% legend('w real','w hat');
% axis normal;
% hold off;
% print FTD_11.png -dpng -r600
% 
% f12 = figure;
% hold on;
% set(gca,'FontSize',16);
% set(legend,'Location','SouthEast');
% title('tracking curve of q');
% xlabel('Time(s)','fontsize',20);
% ylabel('q(rad/s)','fontsize',20);
% plot(e{1}(:,1),e{3}(:,3),'b-','LineWidth',1.5);
% plot(e{1}(:,1),e{4}(:,3),'g--','LineWidth',1.5);
% legend('w real','w hat');
% axis normal;
% hold off;
% print FTD_12.png -dpng -r600
% 
% %% 清理局部变量
% clear e e_abs_V_hat e_abs_eta_hat V_real V_hat eta_real eta_hat e_ral_V_hat e_ral_eta_hat
% clear f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12