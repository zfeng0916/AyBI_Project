%% 文件名： Test_of_StateFeedbackCtrl_CP_Controller_m
%% 载入数据:
% 根据生成得数据名字进行读取
load('Test_of_StateFeedbackCtrl_CP_Controller_d.mat');

%% 画图
% 设置图片的变化密集程度
gap = 200;
% 1.压载水流量
% Title: Flowrate commands of the bow and stern VBSs
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Mass flowrate (kg/s)}','fontsize',12,Interpreter="latex");
ylim([-0.6 0.6]);
p1 = plot(out.tout,out.q_b.Data(:,1),'+ r','LineWidth',0.5);
p1.MarkerSize = 4.5;
p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
h=legend('\textbf {Bow VBS}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/SF/SF_VBS_Bow.png','-dpng','-r600');
clear h;

figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Mass flowrate (kg/s)}','fontsize',12,Interpreter="latex");
ylim([-0.6 0.6]);
p1 = plot(out.tout,out.q_b.Data(:,2),'+ r','LineWidth',0.5);
p1.MarkerSize = 4.5;
p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
h=legend('\textbf {Stern VBS}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/SF/SF_VBS_Stern.png','-dpng','-r600');
clear h;


% 2.压载水质量
% 2.1 Bow VBS
% Title: Ballast mass changes of the bow VBS
figure;
hold on;
grid on;
set(gca,'FontSize',10);
% set(legend,'Location','Best');
set(legend,'position',[0.666049031840079,0.356489650153906,0.238141737863393,0.118137257426393])
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Mass of ballast water (kg)}','fontsize',12,Interpreter="latex");
p2 = plot(out.tout(1:gap:length(out.tout)),out.m_bd.Data(1:gap:length(out.tout),1),'-. k','LineWidth',1.0);
p1 = plot(out.tout(1:gap:length(out.tout)),out.m_b.Data(1:gap:length(out.tout),1),'- r','LineWidth',1.0);
p3 = plot(out.tout(1:gap:length(out.tout)),out.e_m_b.Data((1:gap:length(out.tout)),1),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
h=legend('\textbf {Actual ($m_{bb}$)}','\textbf {Demanded ($m_{bbd}$)}','\textbf {Tracking error ($e_{m_{bb}}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/SF/SF_Bow_VBS.png','-dpng','-r600');
clear h;

% 2.2 Stern VBS
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','East');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Mass of ballast water (kg)}','fontsize',12,Interpreter="latex");
p2 = plot(out.tout(1:gap:length(out.tout)),out.m_bd.Data((1:gap:length(out.tout)),2),'-. k','LineWidth',1.0);
p1 = plot(out.tout(1:gap:length(out.tout)),out.m_b.Data((1:gap:length(out.tout)),2),'- r','LineWidth',1.0);
p3 = plot(out.tout(1:gap:length(out.tout)),out.e_m_b.Data((1:gap:length(out.tout)),2),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
h=legend('\textbf {Actual ($m_{sb}$)}','\textbf {Demanded ($m_{sbd}$)}','\textbf {Tracking error ($e_{m_{sb}}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/SF/SF_Stern_VBS.png','-dpng','-r600');
clear h;

% 3. 控制面偏转角
% Title: The deflection angle commands of the bow and stern control planes
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Deflection angle command ($^{\circ}$)}','fontsize',12,Interpreter="latex");
% ylim([-0.6 0.6]);
p1 = plot(out.tout,out.delta.Data(:,1),'+ r','LineWidth',0.5);
p1.MarkerSize = 4.5;
p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
h=legend('\textbf {Bow control plane}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
legend('off');
print('./Pictures/SF/SF_delta_Bow.png','-dpng','-r600');
clear h;

figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Deflection angle command ($^{\circ}$)}','fontsize',12,Interpreter="latex");
% ylim([-0.6 0.6]);
p1 = plot(out.tout,out.delta.Data(:,2),'+ r','LineWidth',0.5);
p1.MarkerSize = 4.5;
p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
h=legend('\textbf {Stern control plane}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
legend('off');
print('./Pictures/SF/SF_delta_Stern.png','-dpng','-r600');
clear h;

% 4. 扰动力和VBS控制力
% 4.1 τ_w1和τ_VBS1
% Title: Heave disturbance force and VBS control force
figure;
hold on;
grid on;
set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
set(legend,...
    'Position',[0.621395250418247 0.359373638344228 0.281212926339686 0.118137257426393],...
    'Interpreter','latex');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Heave disturbance and VBS control force (N)}','fontsize',12,Interpreter="latex");
p1 = plot(out.tout(1:gap:length(out.tout)),out.tau_w.Data((1:gap:length(out.tout)),1),'- k','LineWidth',1.0);
p2 = plot(out.tout(1:gap:length(out.tout)),out.tau_VBS.Data((1:gap:length(out.tout)),1),'- r','LineWidth',1.0);
p3 = plot(out.tout(1:gap:length(out.tout)),out.error_tau_VBS.Data((1:gap:length(out.tout)),1),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
h=legend('\textbf {Disturbance force ($\tau_{w1}$)}','\textbf {VBS control force ($\tau_{VBS1}$)}','\textbf {$\tau_{VBS1}+\tau_{w1}$}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/SF/SF_tau_w1.png','-dpng','-r600');
clear h;

% 4.2 τ_w2和τ_VBS2
% Title: Pitch disturbance moment and VBS control moment
figure;
hold on;
grid on;
set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
set(legend,...
    'Position',[0.622497680973802,0.371132897603486,0.281212926339686,0.118137257426393],...
    'Interpreter','latex');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch disturbance and VBS control moment (N$\cdot$m)}','fontsize',12,Interpreter="latex");
p1 = plot(out.tout(1:gap:length(out.tout)),out.tau_w.Data((1:gap:length(out.tout)),2),'- k','LineWidth',1.0);
p2 = plot(out.tout(1:gap:length(out.tout)),out.tau_VBS.Data((1:gap:length(out.tout)),2),'- r','LineWidth',1.0);
p3 = plot(out.tout(1:gap:length(out.tout)),out.error_tau_VBS.Data((1:gap:length(out.tout)),2),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
h=legend('\textbf {Disturbance moment ($\tau_{w2}$)}','\textbf {VBS control moment ($\tau_{VBS2}$)}','\textbf {$\tau_{VBS2}+\tau_{w2}$}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/SF/SF_tau_w2.png','-dpng','-r600');
clear h;

% 5. 控制面控制力
% Title: The control forces of the bow and stern control planes
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','SouthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Control force of control plane (N)}','fontsize',12,Interpreter="latex");
% ylim([-0.6 0.6]);
p1 = plot(out.tout,out.tau_CP.Data(:,1),'+ r','LineWidth',0.5);
p1.MarkerSize = 4.5;
p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
h=legend('\textbf {Bow control plane ($\tau_{cp1}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
legend('off');
print('./Pictures/SF/SF_tau_CP_Bow.png','-dpng','-r600');
clear h;

figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','SouthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Control force of control plane (N)}','fontsize',12,Interpreter="latex");
% ylim([-0.6 0.6]);
p1 = plot(out.tout,out.tau_CP.Data(:,2),'+ r','LineWidth',0.5);
p1.MarkerSize = 4.5;
p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
h=legend('\textbf {Stern control plane ($\tau_{cp2}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
legend('off');
print('./Pictures/SF/SF_tau_CP_Stern.png','-dpng','-r600');
clear h;

% 6. 位移
% 6.1 垂荡
% Title: The heave response of the underwater vehicle
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Depth change (m)}','fontsize',12,Interpreter="latex");
ylim([-1 1]);
p1 = plot(out.tout,out.eta.Data(:,1),'- r','LineWidth',0.5);
% p1.MarkerSize = 4.5;
% p1.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
% h=legend('\textbf {Bow control plane ($\tau_{cp1}$)}','\textbf {Stern control plane ($\tau_{cp2}$)}');
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
legend('off');
print('./Pictures/SF/SF_Heave.png','-dpng','-r600');
% clear h;

% 6.2 纵倾
% Title: The pitch response of the underwater vehicle
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','NorthEast');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch angle change ($^{\circ}$)}','fontsize',12,Interpreter="latex");
ylim([-5 5]);
p1 = plot(out.tout,out.eta.Data(:,2).*57.3,'- r','LineWidth',0.5);
% p1.MarkerSize = 4.5;
% p1.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
% h=legend('\textbf {Bow control plane ($\tau_{cp1}$)}','\textbf {Stern control plane ($\tau_{cp2}$)}');
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
legend('off');
print('./Pictures/SF/SF_Pitch.png','-dpng','-r600');
% clear h;