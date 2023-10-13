%% 文件名：DO_test_m

%% 数据载入
val_struct = load('Test_of_Wave_Suction_Force_Observer_in_Asymptotic_d.mat');  % 载入 mat 数据，出来是一个结构体，我们需要的变量是【结构体.变量名】
val_names = fieldnames(val_struct);  % 获取结构体后那个未知的变量名
Asy = getfield(val_struct, val_names{1});  % 读取该变量名下的数据，并重新命名变量名val

val_struct = load('Test_of_Wave_Suction_Force_Observer_in_Asymptotic_tau_w_d.mat');  % 载入 mat 数据，出来是一个结构体，我们需要的变量是【结构体.变量名】
val_names = fieldnames(val_struct);  % 获取结构体后那个未知的变量名
Asy_w = getfield(val_struct, val_names{1});  % 读取该变量名下的数据，并重新命名变量名val

val_struct = load('Test_of_Wave_Suction_Force_Observer_in_Finite_Time_d_2.mat');  % 载入 mat 数据，出来是一个结构体，我们需要的变量是【结构体.变量名】
val_names = fieldnames(val_struct);  % 获取结构体后那个未知的变量名
Fin = getfield(val_struct, val_names{1});  % 读取该变量名下的数据，并重新命名变量名val

val_struct = load('Test_of_Wave_Suction_Force_Observer_in_Finite_Time_tau_w_d.mat');  % 载入 mat 数据，出来是一个结构体，我们需要的变量是【结构体.变量名】
val_names = fieldnames(val_struct);  % 获取结构体后那个未知的变量名
Fin_w = getfield(val_struct, val_names{1});  % 读取该变量名下的数据，并重新命名变量名val

val_struct = load('Test_of_Wave_Suction_Force_Observer_in_Fixed_Time_d_2.mat');  % 载入 mat 数据，出来是一个结构体，我们需要的变量是【结构体.变量名】
val_names = fieldnames(val_struct);  % 获取结构体后那个未知的变量名
Fix = getfield(val_struct, val_names{1});  % 读取该变量名下的数据，并重新命名变量名val

val_struct = load('Test_of_Wave_Suction_Force_Observer_in_Fixed_Time_tau_w_d.mat');  % 载入 mat 数据，出来是一个结构体，我们需要的变量是【结构体.变量名】
val_names = fieldnames(val_struct);  % 获取结构体后那个未知的变量名
Fix_w = getfield(val_struct, val_names{1});  % 读取该变量名下的数据，并重新命名变量名val

clear val_names val_struct i j;

%% 计算不同的IAE ITAE ISE ITSE
index_value = cell(4,3);
for i = 1:3
    for j = 1:4
        index_value{j,i} = zeros(4,2);
    end
end
% % Asy step
% index_value{1,1}(1,1) = IAE([Asy.tout,Asy.error_tau_w_hat_step.Data(:,1)]);
% index_value{1,1}(2,1) = ISE([Asy.tout,Asy.error_tau_w_hat_step.Data(:,1)]);
% index_value{1,1}(3,1) = ITAE([Asy.tout,Asy.error_tau_w_hat_step.Data(:,1)]);
% index_value{1,1}(4,1) = ITSE([Asy.tout,Asy.error_tau_w_hat_step.Data(:,1)]);
% index_value{1,1}(1,2) = IAE([Asy.tout,Asy.error_tau_w_hat_step.Data(:,2)]);
% index_value{1,1}(2,2) = ISE([Asy.tout,Asy.error_tau_w_hat_step.Data(:,2)]);
% index_value{1,1}(3,2) = ITAE([Asy.tout,Asy.error_tau_w_hat_step.Data(:,2)]);
% index_value{1,1}(4,2) = ITSE([Asy.tout,Asy.error_tau_w_hat_step.Data(:,2)]);
% % Asy ramp
% index_value{2,1}(1,1) = IAE([Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1)]);
% index_value{2,1}(2,1) = ISE([Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1)]);
% index_value{2,1}(3,1) = ITAE([Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1)]);
% index_value{2,1}(4,1) = ITSE([Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1)]);
% index_value{2,1}(1,2) = IAE([Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1)]);
% index_value{2,1}(2,2) = ISE([Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1)]);
% index_value{2,1}(3,2) = ITAE([Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1)]);
% index_value{2,1}(4,2) = ITSE([Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1)]);
% % Asy sine wave
% index_value{3,1}(1,1) = IAE([Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1)]);
% index_value{3,1}(2,1) = ISE([Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1)]);
% index_value{3,1}(3,1) = ITAE([Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1)]);
% index_value{3,1}(4,2) = ITSE([Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1)]);
% index_value{3,1}(1,2) = IAE([Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1)]);
% index_value{3,1}(2,2) = ISE([Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1)]);
% index_value{3,1}(3,2) = ITAE([Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1)]);
% index_value{3,1}(4,1) = ITSE([Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1)]);
% Asy tau_w ： 1 error 2 real 3 hat
input = [Asy_w.tout,Asy_w.yout{1}.Values.Data(:,1)];
index_value{4,1}(1,1) = IAE(input);
index_value{4,1}(2,1) = ISE(input);
index_value{4,1}(3,1) = ITAE(input);
index_value{4,1}(4,2) = ITSE(input);
input =  [Asy_w.tout,Asy_w.yout{1}.Values.Data(:,2)];
index_value{4,1}(1,2) = IAE(input);
index_value{4,1}(2,2) = ISE(input);
index_value{4,1}(3,2) = ITAE(input);
index_value{4,1}(4,1) = ITSE(input);
% % Fin step
% index_value{1,2}(1,1) = IAE([Fin.tout,Fin.error_step.Data(:,1)]);
% index_value{1,2}(2,1) = ISE([Fin.tout,Fin.error_step.Data(:,1)]);
% index_value{1,2}(3,1) = ITAE([Fin.tout,Fin.error_step.Data(:,1)]);
% index_value{1,2}(4,1) = ITSE([Fin.tout,Fin.error_step.Data(:,1)]);
% index_value{1,2}(1,2) = IAE([Fin.tout,Fin.error_step.Data(:,2)]);
% index_value{1,2}(2,2) = ISE([Fin.tout,Fin.error_step.Data(:,2)]);
% index_value{1,2}(3,2) = ITAE([Fin.tout,Fin.error_step.Data(:,2)]);
% index_value{1,2}(4,2) = ITSE([Fin.tout,Fin.error_step.Data(:,2)]);
% % Fin ramp
% index_value{2,2}(1,1) = IAE([Fin.tout,Fin.error_ramp.Data(:,1)]);
% index_value{2,2}(2,1) = ISE([Fin.tout,Fin.error_ramp.Data(:,1)]);
% index_value{2,2}(3,1) = ITAE([Fin.tout,Fin.error_ramp.Data(:,1)]);
% index_value{2,2}(4,1) = ITSE([Fin.tout,Fin.error_ramp.Data(:,1)]);
% index_value{2,2}(1,2) = IAE([Fin.tout,Fin.error_ramp.Data(:,2)]);
% index_value{2,2}(2,2) = ISE([Fin.tout,Fin.error_ramp.Data(:,2)]);
% index_value{2,2}(3,2) = ITAE([Fin.tout,Fin.error_ramp.Data(:,2)]);
% index_value{2,2}(4,2) = ITSE([Fin.tout,Fin.error_ramp.Data(:,2)]);
% % Fin sine_wave 
% index_value{3,2}(1,1) = IAE([Fin.tout,Fin.error_sine_wave.Data(:,1)]);
% index_value{3,2}(2,1) = ISE([Fin.tout,Fin.error_sine_wave.Data(:,1)]);
% index_value{3,2}(3,1) = ITAE([Fin.tout,Fin.error_sine_wave.Data(:,1)]);
% index_value{3,2}(4,1) = ITSE([Fin.tout,Fin.error_sine_wave.Data(:,1)]);
% index_value{3,2}(1,2) = IAE([Fin.tout,Fin.error_sine_wave.Data(:,2)]);
% index_value{3,2}(2,2) = ISE([Fin.tout,Fin.error_sine_wave.Data(:,2)]);
% index_value{3,2}(3,2) = ITAE([Fin.tout,Fin.error_sine_wave.Data(:,2)]);
% index_value{3,2}(4,2) = ITSE([Fin.tout,Fin.error_sine_wave.Data(:,2)]);
% Fin tau_w
input = [Fin_w.tout,Fin_w.yout{1}.Values.Data(:,1)];
index_value{4,2}(1,1) = IAE(input);
index_value{4,2}(2,1) = ISE(input);
index_value{4,2}(3,1) = ITAE(input);
index_value{4,2}(4,1) = ITSE(input);
input = [Fin_w.tout,Fin_w.yout{1}.Values.Data(:,2)];
index_value{4,2}(1,2) = IAE(input);
index_value{4,2}(2,2) = ISE(input);
index_value{4,2}(3,2) = ITAE(input);
index_value{4,2}(4,2) = ITSE(input);
% % Fix step
% index_value{1,3}(1,1) = IAE([Fix.tout,Fix.e_step.Data(:,1)]);
% index_value{1,3}(2,1) = ISE([Fix.tout,Fix.e_step.Data(:,1)]);
% index_value{1,3}(3,1) = ITAE([Fix.tout,Fix.e_step.Data(:,1)]);
% index_value{1,3}(4,1) = ITSE([Fix.tout,Fix.e_step.Data(:,1)]);
% index_value{1,3}(1,2) = IAE([Fix.tout,Fix.e_step.Data(:,2)]);
% index_value{1,3}(2,2) = ISE([Fix.tout,Fix.e_step.Data(:,2)]);
% index_value{1,3}(3,2) = ITAE([Fix.tout,Fix.e_step.Data(:,2)]);
% index_value{1,3}(4,2) = ITSE([Fix.tout,Fix.e_step.Data(:,2)]);
% % Fix ramp
% index_value{2,3}(1,1) = IAE([Fix.tout,Fix.e_ramp.Data(:,1)]);
% index_value{2,3}(2,1) = ISE([Fix.tout,Fix.e_ramp.Data(:,1)]);
% index_value{2,3}(3,1) = ITAE([Fix.tout,Fix.e_ramp.Data(:,1)]);
% index_value{2,3}(4,1) = ITSE([Fix.tout,Fix.e_ramp.Data(:,1)]);
% index_value{2,3}(1,2) = IAE([Fix.tout,Fix.e_ramp.Data(:,2)]);
% index_value{2,3}(2,2) = ISE([Fix.tout,Fix.e_ramp.Data(:,2)]);
% index_value{2,3}(3,2) = ITAE([Fix.tout,Fix.e_ramp.Data(:,2)]);
% index_value{2,3}(4,2) = ITSE([Fix.tout,Fix.e_ramp.Data(:,2)]);
% % Fix sine_wave
% index_value{3,3}(1,1) = IAE([Fix.tout,Fix.e_sine_wave.Data(:,1)]);
% index_value{3,3}(2,1) = ISE([Fix.tout,Fix.e_sine_wave.Data(:,1)]);
% index_value{3,3}(3,1) = ITAE([Fix.tout,Fix.e_sine_wave.Data(:,1)]);
% index_value{3,3}(4,1) = ITSE([Fix.tout,Fix.e_sine_wave.Data(:,1)]);
% index_value{3,3}(1,2) = IAE([Fix.tout,Fix.e_sine_wave.Data(:,2)]);
% index_value{3,3}(2,2) = ISE([Fix.tout,Fix.e_sine_wave.Data(:,2)]);
% index_value{3,3}(3,2) = ITAE([Fix.tout,Fix.e_sine_wave.Data(:,2)]);
% index_value{3,3}(4,2) = ITSE([Fix.tout,Fix.e_sine_wave.Data(:,2)]);
% Fix tau_w
input = [Fix_w.tout,Fix_w.yout{1}.Values.Data(:,1)];
index_value{4,3}(1,1) = IAE(input);
index_value{4,3}(2,1) = ISE(input);
index_value{4,3}(3,1) = ITAE(input);
index_value{4,3}(4,1) = ITSE(input);
input = [Fix_w.tout,Fix_w.yout{1}.Values.Data(:,2)];
index_value{4,3}(1,2) = IAE(input);
index_value{4,3}(2,2) = ISE(input);
index_value{4,3}(3,2) = ITAE(input);
index_value{4,3}(4,2) = ITSE(input);


%% 画图：
% % step
% % d3
% % 跟踪曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Heave disturbance force (N)}','fontsize',12,Interpreter="latex");
% ylim([-1 2])
% p3 = plot(Asy.tout,Asy.tau_hat_step.Data(:,1),'s b','LineWidth',1.0);
% p1 = plot(Fin.tout,Fin.tau_w_hat_step.Data(:,1),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.tau_hat_step.Data(:,1),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% plot(Asy.tout,Asy.tau_step.Data(:,1),'k','LineWidth',1.2);
% h=legend('\textbf {Asymptotic-time Estimated ($\hat{tau_{w1}}$)}','\textbf {Finite-tmie Estimated ($\hat{tau_{w1}}$)}','\textbf {Fixed-time Estimated ($\hat{taw_{w1}}$)}',...
%     '\textbf{Actual ($tau_{w1}$)}'); %'\textbf {Estimated Error ($e_tau_{w1}$)}','\textbf {Estimated Error ($e_tau_{w1}$)}','\textbf {Estimated Error ($e_tau_{w1}$)}',
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_tracking_w_step_d3.png','-dpng','-r600');
% clear h;
% 
% % 误差曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Heave disturbance force error under step disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Heave disturbance force (N)}','fontsize',12,Interpreter="latex");
% ylim([-1 1]);
% p1 = plot(Fin.tout,Fin.error_step.Data(:,1),'o g','LineWidth',1.0);
% p3 = plot(Asy.tout,Asy.error_tau_w_hat_step.Data(:,1),'s b','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.e_step.Data(:,1),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% h=legend('\textbf {Asymptotic-tmie Estimated Error ($e_{tau_{w1}}$)}','\textbf {Finite-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Fixed-time Estimated Error ($e_{tau_{w1}}$)}'); 
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_error_w_step_d3.png','-dpng','-r600');
% clear h;
% 
% % d5
% % 跟踪曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Pitch disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Pitch disturbance force (N*m)}','fontsize',12,Interpreter="latex");
% ylim([-1 2])
% p1 =plot(Fin.tout,Fin.tau_w_hat_step.Data(:,2),'o g','LineWidth',1.0);
% p3 = plot(Asy.tout,Asy.tau_hat_step.Data(:,2),'s b','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.tau_hat_step.Data(:,2),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% plot(Asy.tout,Asy.tau_step.Data(:,2),'k','LineWidth',1.0);
% h=legend('\textbf {Asymptotic-time Estimated ($\hat{tau_{w1}}$)}','\textbf {Finite-tmie Estimated ($\hat{tau_{w1}}$)}','\textbf {Fixed-time Estimated ($\hat{tau_{w1}}$)}',...
%     '\textbf{Actual ($tau_{w1}$)}');
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_tracking_w_step_d5.png','-dpng','-r600');
% clear h;
% % 误差曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Pitch disturbance force error under step disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Pitch disturbance force (N*m)}','fontsize',12,Interpreter="latex");
% ylim([-1 1]);
% p1 =plot(Fin.tout,Fin.error_step.Data(:,2),'o g','LineWidth',1.0);
% p3 = plot(Asy.tout,Asy.error_tau_w_hat_step.Data(:,2),'s b','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.e_step.Data(:,2),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% h=legend('\textbf {Finite-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Fixed-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Asymptotic-tmie Estimated Error ($e_{tau_{w1}}$)}'); 
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_error_w_step_d5.png','-dpng','-r600');
% clear h;
% 
% % ramp
% % d3
% % 跟踪曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Heave disturbance force estimation under ramp disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Heave disturbance force (N)}','fontsize',12,Interpreter="latex");
% p3 = plot(Asy.tout,Asy.tau_hat_ramp.Data(:,1),'s b','LineWidth',1.0);
% p1 =plot(Fin.tout,Fin.tau_w_hat_ramp.Data(:,1),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.tau_hat_ramp.Data(:,1),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% plot(Asy.tout,Asy.tau_ramp.Data(:,1),'k','LineWidth',1.0);
% h=legend('\textbf {Finite-tmie Estimated ($\hat{tau_{w1}}$)}','\textbf {Fixed-time Estimated ($\hat{tau_{w1}}$)}','\textbf {Asymptotic-time Estimated ($\hat{tau_{w1}}$)}', ...
%     '\textbf{Actual ($tau_{w1}$)}');
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_tracking_w_ramp_d3.png','-dpng','-r600');
% clear h;
% 
% % 误差曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Heave disturbance force error under ramp disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Heave disturbance force (N)}','fontsize',12,Interpreter="latex");
% ylim([-1 1]);
% p3 = plot(Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,1),'s b','LineWidth',1.0);
% p1 = plot(Fin.tout,Fin.error_ramp.Data(:,1),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.e_ramp.Data(:,1),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% h=legend('\textbf {Finite-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Fixed-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Asymptotic-tmie Estimated Error ($e_{tau_{w1}}$)}'); 
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_error_w_ramp_d5.png','-dpng','-r600');
% clear h;
% % d5
% % 跟踪曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Pitch disturbance force estimation under ramp disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Pitch disturbance force (N*m)}','fontsize',12,Interpreter="latex");
% p3 = plot(Asy.tout,Asy.tau_hat_ramp.Data(:,2),'s b','LineWidth',1.0);
% p1 = plot(Fin.tout,Fin.tau_w_hat_ramp.Data(:,2),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.tau_hat_ramp.Data(:,2),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% plot(Asy.tout,Asy.tau_ramp.Data(:,2),'k','LineWidth',1.0);
% h=legend('\textbf {Finite-tmie Estimated ($\hat{tau_{w1}}$)}','\textbf {Fixed-time Estimated ($\hat{tau_{w1}}$)}','\textbf {Asymptotic-time Estimated ($\hat{tau_{w1}}$)}', ...
%     '\textbf{Actual ($tau_{w1}$)}'); 
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_tracking_w_ramp_d5.png','-dpng','-r600');
% clear h;
% % 误差曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Pitch disturbance force error under step disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Pitch disturbance force (N*m)}','fontsize',12,Interpreter="latex");
% ylim([-1 1]);
% p3 = plot(Asy.tout,Asy.error_tau_w_hat_ramp.Data(:,2),'s b','LineWidth',1.0);
% p1 = plot(Fin.tout,Fin.error_ramp.Data(:,2),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.e_ramp.Data(:,2),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% h=legend('\textbf {Finite-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Fixed-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Asymptotic-tmie Estimated Error ($e_{tau_{w1}}$)}'); 
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_error_w_ramp_d5.png','-dpng','-r600');
% clear h;
% % sinusoidal
% % d3
% % 跟踪曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Heave disturbance force estimation under sinusoidal disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Heave disturbance force (N)}','fontsize',12,Interpreter="latex");
% ylim([-2 2]);
% p3 = plot(Asy.tout,Asy.tau_w_hat_sine_wave.Data(:,1),'s b','LineWidth',1.0);
% p1 = plot(Fin.tout,Fin.tau_w_hat_sine_wave.Data(:,1),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.tau_hat_sine_wave.Data(:,1),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% plot(Asy.tout,Asy.tau_w_sine_wave.Data(:,1),'k','LineWidth',1.2);
% h=legend('\textbf {Finite-tmie Estimated ($\hat{tau_{w1}}$)}','\textbf {Fixed-time Estimated ($\hat{tau_{w1}}$)}','\textbf {Asymptotic-time Estimated ($\hat{tau_{w1}}$)}', ...
%     '\textbf{Actual ($tau_{w1}$)}'); %'\textbf {Estimated Error ($e_tau_{w1}$)}','\textbf {Estimated Error ($e_tau_{w1}$)}','\textbf {Estimated Error ($e_tau_{w1}$)}',set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_tracking_w_sine_wave_d3.png','-dpng','-r600');
% clear h;
% % 误差曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Heave disturbance force error under sinusoidal disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Heave disturbance force (N)}','fontsize',12,Interpreter="latex");
% ylim([-1 1]);
% p3 = plot(Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,1),'s b','LineWidth',1.0);
% p1 = plot(Fin.tout,Fin.error_sine_wave.Data(:,1),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.e_sine_wave.Data(:,1),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% h=legend('\textbf {Finite-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Fixed-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Asymptotic-tmie Estimated Error ($e_{tau_{w1}}$)}');
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_error_w_sine_wave_d3.png','-dpng','-r600');
% clear h;
% % d5
% % 跟踪曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Pitch disturbance force estimation under sinusoidal disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Pitch disturbance force (N*m)}','fontsize',12,Interpreter="latex");
% ylim([-2 2]);
% p3 = plot(Asy.tout,Asy.tau_w_hat_sine_wave.Data(:,2),'s b','LineWidth',1.0);
% p1 = plot(Fin.tout,Fin.tau_w_hat_sine_wave.Data(:,2),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.tau_hat_sine_wave.Data(:,2),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% plot(Asy.tout,Asy.tau_w_sine_wave.Data(:,2),'k','LineWidth',1.2);h=legend('\textbf {Fin-time Estimated Error ($e_tau_{w1}$)}','\textbf {Fix-time Estimated Error ($e_tau_{w1}$)}','\textbf {Asy-tmie Estimated Error ($e_tau_{w1}$)}', ...
%     '\textbf{Actual ($tau_{w1}$)}');
% h=legend('\textbf {Finite-tmie Estimated ($\hat{tau_{w1}}$)}','\textbf {Fixed-time Estimated ($\hat{tau_{w1}}$)}','\textbf {Asymptotic-time Estimated ($\hat{tau_{w1}}$)}', ...
%     '\textbf{Actual ($tau_{w1}$)}'); %'\textbf {Estimated Error ($e_tau_{w1}$)}','\textbf {Estimated Error ($e_tau_{w1}$)}','\textbf {Estimated Error ($e_tau_{w1}$)}',
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_tracking_w_sine_wave_d5.png','-dpng','-r600');
% clear h;
% % 误差曲线
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 32 18])
% % title('\textup {Pitch disturbance force error under sinusoidal disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Pitch disturbance force (N*m)}','fontsize',12,Interpreter="latex");
% ylim([-1 1]);
% p3 = plot(Asy.tout,Asy.error_tau_w_hat_sine_wave.Data(:,2),'s b','LineWidth',1.0);
% p1 = plot(Fin.tout,Fin.error_sine_wave.Data(:,2),'o g','LineWidth',1.0);
% p2 = plot(Fix.tout,Fix.e_sine_wave.Data(:,2),'-x r','LineWidth',1.0);
% p1.MarkerSize = 5;
% p2.MarkerSize = 5;
% p3.MarkerSize = 5;
% p1.MarkerIndices = 1:fix(length(Fin.tout)/40):length(Fin.tout);
% p2.MarkerIndices = 1:fix(length(Fix.tout)/40):length(Fix.tout);
% p3.MarkerIndices = 1:fix(length(Asy.tout)/40):length(Asy.tout);
% h=legend('\textbf {Finite-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Fixed-time Estimated Error ($e_{tau_{w1}}$)}','\textbf {Asymptotic-tmie Estimated Error ($e_{tau_{w1}}$)}');
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/DO/DO_error_w_sine_wave_d5.png','-dpng','-r600');

% % Gaussian white noise
% d3
% 跟踪曲线
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under Gaussian white noise disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Heave disturbance force (N)}','fontsize',12,Interpreter="latex");
plot(Asy_w.tout,Asy_w.yout{2}.Values.Data(:,1),'k','LineWidth',1.0);
p3 = plot(Fin_w.tout,Fin_w.yout{3}.Values.Data(:,1),'- s b','LineWidth',1.0);
p1 = plot(Asy_w.tout,Asy_w.yout{3}.Values.Data(:,1),'- o g','LineWidth',1.0);
p2 = plot(Fix_w.tout,Fix_w.yout{3}.Values.Data(:,1),'- x r','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(Asy_w.tout)/40):length(Asy_w.tout);
p2.MarkerIndices = 1:fix(length(Fix_w.tout)/40):length(Fix_w.tout);
p3.MarkerIndices = 1:fix(length(Fin_w.tout)/40):length(Fin_w.tout);
h=legend('\textbf{Actual ($\tau_{w1}$)}','\textbf {Asymptotic-time estimated ($\hat{\tau}_{w1}$)}','\textbf {Finite-tmie estimated ($\hat{\tau}_{w1}$)}','\textbf {Fixed-time estimated ($\hat{\tau}_{w1}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/DO/DO_tracking_w_G_d3.png','-dpng','-r600');
clear h;
% 误差曲线
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force error under Gaussian white noise disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Heave disturbance force (N)}','fontsize',12,Interpreter="latex");
ylim([-5 5]);
% ylim([-4 4]);
p3 = plot(Fin_w.tout,Fin_w.yout{1}.Values.Data(:,1),'- s b','LineWidth',1.0);
p1 = plot(Asy_w.tout,Asy_w.yout{1}.Values.Data(:,1),'- o g','LineWidth',1.0);
p2 = plot(Fix_w.tout,Fix_w.yout{1}.Values.Data(:,1),'- x r','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(Asy_w.tout)/40):length(Asy_w.tout);
p2.MarkerIndices = 1:fix(length(Fix_w.tout)/40):length(Fix_w.tout);
p3.MarkerIndices = 1:fix(length(Fin_w.tout)/40):length(Fin_w.tout);
h=legend('\textbf {Asymptotic-tmie estimated error ($e_{\tau_{w1}}$)}','\textbf {Finite-time estimated error ($e_{\tau_{w1}}$)}','\textbf {Fixed-time estimated error ($e_{\tau_{w1}}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/DO/DO_error_w_G_d3.png','-dpng','-r600');
clear h;
% d5
% 跟踪曲线
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Pitch disturbance force estimation under Gaussian white noise disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch disturbance moment (N$\cdot$m)}','fontsize',12,Interpreter="latex");
plot(Asy_w.tout,Asy_w.yout{2}.Values.Data(:,2),'k','LineWidth',1.0);
p3 = plot(Fin_w.tout,Fin_w.yout{3}.Values.Data(:,2),'- s b','LineWidth',1.0);
p1 = plot(Asy_w.tout,Asy_w.yout{3}.Values.Data(:,2),'- o g','LineWidth',1.0);
p2 = plot(Fix_w.tout,Fix_w.yout{3}.Values.Data(:,2),'- x r','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(Asy_w.tout)/40):length(Asy_w.tout);
p2.MarkerIndices = 1:fix(length(Fix_w.tout)/40):length(Fix_w.tout);
p3.MarkerIndices = 1:fix(length(Fin_w.tout)/40):length(Fin_w.tout);
h=legend('\textbf{Actual ($\tau_{w2}$)}','\textbf {Asymptotic-time estimated ($\hat{\tau}_{w2}$)}','\textbf {Finite-tmie estimated ($\hat{\tau}_{w2}$)}','\textbf {Fixed-time estimated ($\hat{\tau}_{w2}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/DO/DO_tracking_w_G_d5.png','-dpng','-r600');
clear h;
% 误差曲线
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Pitch disturbance force error under Gaussian white noise disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch disturbance moment (N$\cdot$m)}','fontsize',12,Interpreter="latex");
% ylim([-5 5]);
ylim([-2 2]);
p3 = plot(Fin_w.tout,Fin_w.yout{1}.Values.Data(:,2),'- s b','LineWidth',1.0);
p1 = plot(Asy_w.tout,Asy_w.yout{1}.Values.Data(:,2),'- o g','LineWidth',1.0);
p2 = plot(Fix_w.tout,Fix_w.yout{1}.Values.Data(:,2),'- x r','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(Asy_w.tout)/40):length(Asy_w.tout);
p2.MarkerIndices = 1:fix(length(Fix_w.tout)/40):length(Fix_w.tout);
p3.MarkerIndices = 1:fix(length(Fin_w.tout)/40):length(Fin_w.tout);
h=legend('\textbf {Asymptotic-tmie estimated error ($e_{\tau_{w2}}$)}','\textbf {Finite-time estimated error ($e_{\tau_{w2}}$)}','\textbf {Fixed-time estimated error ($e_{\tau_{w2}}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/DO/DO_error_w_G_d5.png','-dpng','-r600');
clear h;




%% 补充函数
function out = IAE(input)
    out = trapz(input(:,1),abs(input(:,2)));
end
function out = ISE(input)
    out = trapz(input(:,1),input(:,2).^2);
end
function out = ITAE(input)
    out = trapz(input(:,1), input(:,1).*abs(input(:,2)));
end
function out = ITSE(input)
    out = trapz(input(:,1),input(:,1).*(input(:,2).^2)); 
end



