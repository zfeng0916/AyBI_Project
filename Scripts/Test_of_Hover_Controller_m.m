%% 文件名： Test_of_Hover_Controller_m
%% 载入数据:
% 根据生成得数据名字进行读取
load('Test_of_Hover_Controller_d.mat');

%% 画图
% 设置图片的变化密集程度
gap = 1;
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
print('./Pictures/HC/HC_VBS_Bow.png','-dpng','-r600');
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
print('./Pictures/HC/HC_VBS_Stern.png','-dpng','-r600');
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
print('./Pictures/HC/HC_Bow_VBS.png','-dpng','-r600');
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
print('./Pictures/HC/HC_Stern_VBS.png','-dpng','-r600');
clear h;

% 3. 扰动力、反馈力和VBS控制力
% 3.1 τ_w1、τ_fb1和τ_VBS1
% Title: Heave disturbance force, feedback force and VBS control force
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
ylabel('\textup {Force (N)}','fontsize',12,Interpreter="latex");
p1 = plot(out.tout(1:gap:length(out.tout)),out.tau_w.Data((1:gap:length(out.tout)),1),'- k','LineWidth',1.0);
p3 = plot(out.tout(1:gap:length(out.tout)),out.tau_fb.Data((1:gap:length(out.tout)),1),'- c','LineWidth',1.0);
p2 = plot(out.tout(1:gap:length(out.tout)),out.tau_VBS.Data((1:gap:length(out.tout)),1),'- r','LineWidth',1.0);
p4 = plot(out.tout(1:gap:length(out.tout)),out.error_tau_VBS_fb.Data((1:gap:length(out.tout)),1),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p4.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p3.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p4.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
h=legend('\textbf {Disturbance force ($\tau_{w1}$)}','\textbf {Feedback force ($\tau_{fb1}$)}','\textbf {VBS control force ($\tau_{VBS1}$)}','\textbf {$\tau_{w1}+\tau_{VBS1}-\tau_{fb1}$}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/HC/HC_tau_w1.png','-dpng','-r600');
clear h;

% 4.2 τ_w2和τ_VBS2
% Title: Pitch disturbance force, feedback force and VBS control force
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','SouthWest');
% set(legend,...
%     'Position',[0.621395250418247 0.359373638344228 0.281212926339686 0.118137257426393],...
%     'Interpreter','latex');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Moment (N$\cdot$m)}','fontsize',12,Interpreter="latex");
p1 = plot(out.tout(1:gap:length(out.tout)),out.tau_w.Data((1:gap:length(out.tout)),2),'- k','LineWidth',1.0);
p3 = plot(out.tout(1:gap:length(out.tout)),out.tau_fb.Data((1:gap:length(out.tout)),2),'- c','LineWidth',1.0);
p2 = plot(out.tout(1:gap:length(out.tout)),out.tau_VBS.Data((1:gap:length(out.tout)),2),'- r','LineWidth',1.0);
p4 = plot(out.tout(1:gap:length(out.tout)),out.error_tau_VBS_fb.Data((1:gap:length(out.tout)),2),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p4.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p2.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p3.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
p4.MarkerIndices = 1:fix(length(out.tout(1:gap:length(out.tout)))/40):length(out.tout(1:gap:length(out.tout)));
h=legend('\textbf {Disturbance moment ($\tau_{w1}$)}','\textbf {Feedback moment ($\tau_{fb1}$)}','\textbf {VBS control moment ($\tau_{VBS1}$)}','\textbf {$\tau_{w1}+\tau_{VBS1}-\tau_{fb1}$}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/HC/HC_tau_w2.png','-dpng','-r600');
clear h;

% 4. 位移
% 4.1 垂荡
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
print('./Pictures/HC/HC_Heave.png','-dpng','-r600');
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
print('./Pictures/HC/HC_Pitch.png','-dpng','-r600');
% clear h;
