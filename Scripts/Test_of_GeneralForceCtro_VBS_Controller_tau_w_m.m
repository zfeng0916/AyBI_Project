%% 文件名：GeneralForce_VBS_Controllor_test_m
%% 载入数据:
% 根据生成得数据名字进行读取
load('Test_of_GeneralForceCtro_VBS_Controller_tau_w_d4.mat');

%% 画图
% Title: Flowrate commands of the bow and stern VBSs
% figure;
% hold on;
% grid on;
% set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
% set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% % title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
% xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
% ylabel('\textup {Mass flowrate (kg/s)}','fontsize',12,Interpreter="latex");
% ylim([-0.6 0.6]);
% p1 = plot(out.tout,out.q_b.Data(:,1),' s g','LineWidth',0.5);
% p2 = plot(out.tout,out.q_b.Data(:,2),' + r','LineWidth',0.5);
% p1.MarkerSize = 4.5;
% p2.MarkerSize = 4.5;
% p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
% p2.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
% h=legend('\textbf {Bow VBS}','\textbf {Stern VBS}');
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
% axis normal;
% hold off;
% print('./Pictures/GF/GF_VBS.png','-dpng','-r600');
% clear h;

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
p1 = plot(out.tout,out.q_b.Data(:,1),'x r','LineWidth',0.5);
% p2 = plot(out.tout,out.q_b.Data(:,2),' + r','LineWidth',0.5);
p1.MarkerSize = 4.5;
% p2.MarkerSize = 4.5;
p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
% p2.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
h=legend('\textbf {Bow VBS}');  %,'\textbf {Stern VBS}'
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/GF/GF_VBS_Bow.png','-dpng','-r600');
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
% p1 = plot(out.tout,out.q_b.Data(:,1),' s g','LineWidth',0.5);
p2 = plot(out.tout,out.q_b.Data(:,2),' x r','LineWidth',0.5);
% p1.MarkerSize = 4.5;
p2.MarkerSize = 4.5;
% p1.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/600):length(out.tout);
h=legend('\textbf {Stern VBS}');    % '\textbf {Bow VBS}',
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/GF/GF_VBS_Stern.png','-dpng','-r600');
clear h;

% 压载水质量
% Bow VBS
% Title: Ballast mass changes of the bow VBS
figure;
hold on;
grid on;
set(gca,'FontSize',10);
% set(legend,'Location','Best');
set(legend,'position',[0.666049031840079,0.397647057561313,0.238141737863393,0.118137257426393])
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Mass of ballast water (kg)}','fontsize',12,Interpreter="latex");
p2 = plot(out.tout,out.m_bd.Data(:,1),'-. k','LineWidth',1.0);
p1 = plot(out.tout,out.m_b.Data(:,1),'- r','LineWidth',1.0);
p3 = plot(out.tout,out.e_m_b.Data(:,1),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
h=legend('\textbf {Actual ($m_{bb}$)}','\textbf {Demanded ($m_{bbd}$)}','\textbf {Tracking error ($e_{m_{bb}}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/GF/GF_Bow_VBS.png','-dpng','-r600');
clear h;

% Stern VBS
figure;
hold on;
grid on;
set(gca,'FontSize',10);
set(legend,'Location','East');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Mass of ballast water (kg)}','fontsize',12,Interpreter="latex");
p2 = plot(out.tout,out.m_bd.Data(:,2),'-. k','LineWidth',1.0);
p1 = plot(out.tout,out.m_b.Data(:,2),'- r','LineWidth',1.0);
p3 = plot(out.tout,out.e_m_b.Data(:,2),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
h=legend('\textbf {Actual ($m_{sb}$)}','\textbf {Demanded ($m_{sbd}$)}','\textbf {Tracking error ($e_{m_{sb}}$)}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/GF/GF_Stern_VBS.png','-dpng','-r600');
clear h;

% 3. 扰动力和VBS控制力
% 3.1 τ_w1和τ_VBS1
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
p1 = plot(out.tout,out.tau_w.Data(:,1),'- k','LineWidth',1.0);
p2 = plot(out.tout,out.tau_VBS.Data(:,1),'- r','LineWidth',1.0);
p3 = plot(out.tout,out.error_abs_tau_w_VBS.Data(:,1),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
h=legend('\textbf {Disturbance force ($\tau_{w1}$)}','\textbf {VBS control force ($\tau_{VBS1}$)}','\textbf {$\tau_{VBS1}+\tau_{w1}$}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/GF/GF_tau_w1.png','-dpng','-r600');
clear h;

% 3.2 τ_w2和τ_VBS2
% Title: Pitch disturbance moment and VBS control moment
figure;
hold on;
grid on;
set(gca,'FontSize',10);
% set(legend,'Location','SouthEast');
set(legend,...
    'Position',[0.622497680973802 0.380932280319535 0.281212926339686 0.118137257426393],...
    'Interpreter','latex');
set(gcf,'unit','centimeters','position',[0 0 19.2 10.8])
% title('\textup {Heave disturbance force estimation under step disturbance}','fontsize',12,Interpreter="latex");
xlabel('\textup {Time (s)}','fontsize',12,Interpreter="latex");
ylabel('\textup {Pitch disturbance and VBS control moment (N$\cdot$m)}','fontsize',12,Interpreter="latex");
p1 = plot(out.tout,out.tau_w.Data(:,2),'- k','LineWidth',1.0);
p2 = plot(out.tout,out.tau_VBS.Data(:,2),'- r','LineWidth',1.0);
p3 = plot(out.tout,out.error_abs_tau_w_VBS.Data(:,2),'- b','LineWidth',1.0);
p1.MarkerSize = 5;
p2.MarkerSize = 5;
p3.MarkerSize = 5;
p1.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
p2.MarkerIndices = 1:fix(length(out.tout)/40):length(out.tout);
h=legend('\textbf {Disturbance force ($\tau_{w2}$)}','\textbf {VBS control force ($\tau_{VBS2}$)}','\textbf {$\tau_{VBS2}+\tau_{w2}$}');
set(h,'Interpreter','latex') %设置legend为latex解释器显示分式
axis normal;
hold off;
print('./Pictures/GF/GF_tau_w2.png','-dpng','-r600');
clear h;

