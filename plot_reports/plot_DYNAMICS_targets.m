function plot_DYNAMICS_targets(Av_ON,... %(1) 1 to plot / 0 not to plot  Avoidance   case
                               Am_ON,... %(2) 1 to plot / 0 not to plot  Ambivalence case
                               Ph_ON)    %(3) 1 to plot / 0 not to plot  Phobicity   case
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

% ----------------------------------
f_path = '.\OUTPUT_PLOTS_CURRENT\';
% ----------------------------------

if Av_ON == 0
    Av_ON = false;
    %print_msg = 'Not Plotting Avoidance'
else
    Av_ON = true;
    print_msg = 'Plotting Avoidance'
end 

if Am_ON == 0
    Am_ON = false;
    %print_msg = 'Not Plotting Ambivalence'
else
    Am_ON = true;
    print_msg = 'Plotting Ambivalence'
end

if Ph_ON == 0
    Ph_ON = false;
    %print_msg = 'Not Plotting Phobicity'
else
    Ph_ON = true;
    print_msg = 'Plotting Phobicity'
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- DYNAMICS -------------------------------------- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------
plot_DYNAMICS_targets_get_data
%--------------------------------------

%--------------------------------------
%--- PLOT CONTROL ---------------------
%--------------------------------------

% ---------------------------
% Main Flags
% for Targets-Need-Approach-Explore-Lab-Distance
Targets_On      = false;
Need_On         = true;
Approach_On     = true;
Explore_On      = true;
Lab_Distance_On = false;
% ---------------------------

% Need Plot Flags
N_Target_Normal             = false;
N_Result_vs_Target_Normal   = true;
N_Target_Dynamics           = false;
N_Result_vs_Target_Dynamics = false;

% Approach Plot Flags
Ap_Target_Normal             = false;
Ap_Result_vs_Target_Normal   = true;
Ap_Target_Dynamics           = false;
Ap_Result_vs_Target_Dynamics = false;

% Explore Plot Flags
Ex_Target_Normal             = false;
Ex_Result_vs_Target_Normal   = true;
Ex_Target_Dynamics           = false;
Ex_Result_vs_Target_Dynamics = false;

% Lab Distance Plot Flags
D_Target_Normal             = false;
D_Result_vs_Target_Normal   = false;
D_Target_Dynamics           = false;
D_Result_vs_Target_Dynamics = false;

% Save File Flag
save_file = true;
%--------------------------------------
%--------------------------------------
%--------------------------------------

if Targets_On
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Targets -------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f100=figure(100);
set(f100,'Units','Normalized');
%set(f100,'Position',get(0, 'Screensize'));
set(f100,'Position',pos5);
plot(x,CD_T,clr_cd_2);
hold on                 
plot(x,CR_T,clr_cr_21);
hold off
axis([0 1 0 100]);
axis square
f_name = string(dimension) + ' - Targets';
%title(f_name);
xlabel(dimension);
if Av_ON
    ylabel('T_E');
end
if Am_ON
    ylabel('T_P');
end
if Ph_ON
    ylabel('T_V');
end
%legend('Attacher''s Targets ',...
%       'Caregiver''s Targets ');
if save_file
    savefig(f100,f_path+f_name+'.fig');
    saveas(f100,f_path+f_name+'.png');
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if Need_On
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Need ----------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- Target Normal ----------------------
if N_Target_Normal
%--------------------------------------
f100=figure(100);
set(f100,'Units','Normalized');
%set(f100,'Position',get(0, 'Screensize'));
set(f100,'Position',pos5);
plot(x,N_CD_T_b,clr_cd_2);
hold on                 
plot(x,N_CR_T_b,clr_cr_21);
hold off
axis([0 1 0 100]);
axis square
f_name = string(dimension) + ' - Need Expected Trends';
title(f_name);
xlabel(dimension);
ylabel('Need %');
legend('N_R (attacher) Expected Trend ',...
       'N_G (caregiver) Expected Trend ');
if save_file
    savefig(f100,f_path+f_name+'.fig');
    saveas(f100,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Result vs Target Normal ------------
if N_Result_vs_Target_Normal
%--------------------------------------
f101=figure(101);
set(f101,'Units','Normalized');
%set(f101,'Position',get(0, 'Screensize'));
set(f101,'Position',pos5);
plot(x,N_CD_T,clr_cd_2);
hold on
plot(x,y_05,clr_blk);% real
hold on                 
plot(x,N_CR_T,clr_cr_21);
hold on
plot(x,y_06,clr_red);% real
hold off
axis([0 1 0 100]);
axis square
f_name = string(dimension) + ' - Need Simulations vs Expected Trends';
title(f_name);
xlabel(dimension);
ylabel('Need %');
legend('N_R (attacher) Expected Trend ',...
       'N_R (attacher) Simulation',...
       'N_G (caregiver) Expected Trend',...
       'N_G (caregiver) Simulatuion');
if save_file
    savefig(f101,f_path+f_name+'.fig');
    saveas(f101,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Target Dynamics --------------------
if N_Target_Dynamics 
%--------------------------------------
f102=figure(102);
set(f102,'Units','Normalized');
%set(f102,'Position',get(0, 'Screensize'));
set(f102,'Position',pos5);
plot(N_CD_T_b,N_CR_T_b,clr_ld_21);
axis([0 100 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Need Dynamics Expected Trend';
title(f_name);
xlabel('N_R % (attacher)');
ylabel('N_G % (caregiver)');
if save_file
    savefig(f102,f_path+f_name+'.fig');
    saveas(f102,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Result vs Target Dynamics ----------
if N_Result_vs_Target_Dynamics
%--------------------------------------
f103=figure(103);
set(f103,'Units','Normalized');
%set(f103,'Position',get(0, 'Screensize'));
set(f103,'Position',pos5);
plot(N_CD_T,N_CR_T,clr_ld_21);
hold on
plot(y_05,y_06,clr_blk);
hold off
axis([0 100 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Need Dynamics Simulation vs Expected Trend';
title(f_name);
xlabel('N_R % (attacher)');
ylabel('N_G % (caregiver)');
legend('Expected Trend',...
       'Simulation');
if save_file
    savefig(f103,f_path+f_name+'.fig');
    saveas(f103,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if Approach_On
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Approach ------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- Target Normal ----------------------
if Ap_Target_Normal
%--------------------------------------
f200=figure(200);
set(f200,'Units','Normalized');
%set(f200,'Position',get(0, 'Screensize'));
set(f200,'Position',pos5);
plot(x,Ap_CD_T_b,clr_cd_2);
hold on
plot(x,Ap_CR_T_b,clr_cr_21);
hold off
axis([0 1 0 100]);
axis square
f_name = string(dimension) + ' - Approach Expected Trends';
title(f_name);
xlabel(dimension);
ylabel('Approach %');
legend('Attacher Expected Trend',...
       'Caregiver Expected Trend');
if save_file
    savefig(f200,f_path+f_name+'.fig');
    saveas(f200,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Result vs Target Normal ------------
if Ap_Result_vs_Target_Normal
%--------------------------------------
f201=figure(201);
set(f201,'Units','Normalized');
%set(f201,'Position',get(0, 'Screensize'));
set(f201,'Position',pos5);
plot(x,Ap_CD_T,clr_cd_2);
hold on
plot(x,y_17,clr_blk);% real
hold on
plot(x,Ap_CR_T,clr_cr_21);
hold on
plot(x,y_19,clr_red);% real
hold off
axis([0 1 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Approach Simulations vs Expected Trends';
title(f_name);
xlabel(dimension);
ylabel('Approach %');
legend('Attacher Expected Trend',...
       'Attacher Simulation',...
       'Caregiver Expected Trend',...
       'Caregiver Simulation');
if save_file
    savefig(f201,f_path+f_name+'.fig');
    saveas(f201,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Target Dynamics --------------------
if Ap_Target_Dynamics 
%--------------------------------------
f202=figure(202);
set(f202,'Units','Normalized');
%set(f202,'Position',get(0, 'Screensize'));
set(f202,'Position',pos5);
plot(Ap_CD_T_b,Ap_CR_T_b,clr_ld_21);
axis([0 100 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Approach Dynamics Expected Trend';
title(f_name);
xlabel('Approach % (attacher)');
ylabel('Approach % (caregiver)');
if save_file
    savefig(f202,f_path+f_name+'.fig');
    saveas(f202,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Result vs Target Dynamics ----------
if Ap_Result_vs_Target_Dynamics
%--------------------------------------
f203=figure(203);
set(f203,'Units','Normalized');
%set(f203,'Position',get(0, 'Screensize'));
set(f203,'Position',pos5);
plot(Ap_CD_T,Ap_CR_T,clr_ld_21);
hold on
plot(y_17,y_19,clr_blk);
hold off
axis([0 100 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Approach Dynamics Simulation vs Expected Trend';
title(f_name);
xlabel('Approach % (attacher)');
ylabel('Approach % (caregiver)');
legend('Expected Trend',...
       'Simulation');
if save_file
    savefig(f203,f_path+f_name+'.fig');
    saveas(f203,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if Explore_On
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Exploration ---------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- Target Normal ----------------------
if Ex_Target_Normal 
%--------------------------------------
f300=figure(300);
set(f300,'Units','Normalized');
%set(f300,'Position',get(0, 'Screensize'));
set(f300,'Position',pos5);
plot(x,Ex_CD_T_b,clr_cd_2);
hold on
plot(x,Ex_CR_T_b,clr_cr_21);
hold off
axis([0 1 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Exploration Expected Trends';
title(f_name);
xlabel(dimension);
ylabel('Exploration %');
legend('Attacher Expected Trend',...
       'Caregiver Expected Trend');
if save_file
    savefig(f300,f_path+f_name+'.fig');
    saveas(f300,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Result vs Target Normal ------------
if Ex_Result_vs_Target_Normal
%--------------------------------------
f301=figure(301);
set(f301,'Units','Normalized');
%set(f301,'Position',get(0, 'Screensize'));
set(f301,'Position',pos5);
plot(x,Ex_CD_T,clr_cd_2);
hold on
plot(x,y_16,clr_blk);% real
hold on
plot(x,Ex_CR_T,clr_cr_21);
hold on
plot(x,y_18,clr_red);% real
hold off
axis([0 1 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Exploration Simulations vs Expected Trends';
title(f_name);
xlabel(dimension);
ylabel('Exploration %');
legend('Attacher Expected Trend',...
       'Attacher Simulation',...
       'Caregiver Expected Trend',...
       'Caregiver Simulation');
if save_file
    savefig(f301,f_path+f_name+'.fig');
    saveas(f301,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Target Dynamics --------------------
if Ex_Target_Dynamics
%--------------------------------------
f302=figure(302);
set(f302,'Units','Normalized');
%set(f302,'Position',get(0, 'Screensize'));
set(f302,'Position',pos5);
plot(Ex_CD_T_b,Ex_CR_T_b,clr_ld_21);
axis([0 100 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Exploration Dynamics Expected Trend';
title(f_name);
xlabel('Exploration % (attacher)');
ylabel('Exploration % (caregiver)');
if save_file
    savefig(f302,f_path+f_name+'.fig');
    saveas(f302,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Result vs Target Dynamics ----------
if Ex_Result_vs_Target_Dynamics
%--------------------------------------
f303=figure(303);
set(f303,'Units','Normalized');
%set(f303,'Position',get(0, 'Screensize'));
set(f303,'Position',pos5);
plot(Ex_CD_T,Ex_CR_T,clr_ld_21);
hold on
plot(y_16,y_18,clr_blk);
hold off
axis([0 100 0 100]);
axis square
f_name = string(dimension) + ' - ' + 'Exploration Dynamics Simulation vs Expected Trend';
title(f_name);
xlabel('Exploration % (attacher)');
ylabel('Exploration % (caregiver)');
legend('Expected Trend',...
       'Simulation');
if save_file
    savefig(f303,f_path+f_name+'.fig');
    saveas(f303,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if Lab_Distance_On
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Need ----------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- Target Normal ----------------------
if D_Target_Normal
%--------------------------------------
f400=figure(400);
set(f400,'Units','Normalized');
%set(f400,'Position',get(0, 'Screensize'));
set(f400,'Position',pos5);
plot(x,D_CD_T_b,clr_cd_2);
hold on                 
plot(x,D_CR_T_b,clr_cr_21);
hold off
axis([0 1 0 43]);
axis square
f_name = string(dimension) + ' - Distance Expected Trends';
title(f_name);
xlabel(dimension);
ylabel('Distance');
% legend('D_R (attacher) Expected Trend ',...
%        'D_G (caregiver) Expected Trend ');
legend('D_R (attacher) Expected Trend ',...
       'D_G (caregiver) Expected Trend ');
if save_file
    savefig(f400,f_path+f_name+'.fig');
    saveas(f400,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Result vs Target Normal ------------
if D_Result_vs_Target_Normal
%--------------------------------------
f401=figure(401);
set(f401,'Units','Normalized');
%set(f401,'Position',get(0, 'Screensize'));
set(f401,'Position',pos5);
plot(x,D_CD_T,clr_cd_2);
hold on
plot(x,y_03,clr_blk);% real
hold on                 
plot(x,D_CR_T,clr_cr_21);   %can be skipped
hold on
plot(x,y_03,clr_blu);% real %can be skipped
hold off
axis([0 1 0 42]);
axis square
f_name = string(dimension) + ' - Distance Simulations vs Expected Trends';
title(f_name);
xlabel(dimension);
ylabel('Distance');
legend('D_R (attacher) Expected Trend ',...
       'D_R (attacher) Simulation',...
       'D_G (caregiver) Expected Trend',...
       'D_G (caregiver) Simulatuion');
if save_file
    savefig(f401,f_path+f_name+'.fig');
    saveas(f401,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Target Dynamics --------------------
if D_Target_Dynamics 
%--------------------------------------
f402=figure(402);
set(f402,'Units','Normalized');
%set(f402,'Position',get(0, 'Screensize'));
set(f402,'Position',pos5);
plot(D_CD_T_b,D_CR_T_b,clr_ld_21);
axis([0 43 0 43]);
axis square
f_name = string(dimension) + ' - ' + 'Distance Dynamics Expected Trend';
title(f_name);
xlabel('D_R % (attacher)');
ylabel('D_G % (caregiver)');
if save_file
    savefig(f402,f_path+f_name+'.fig');
    saveas(f402,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------

%- Result vs Target Dynamics ----------
if D_Result_vs_Target_Dynamics
%--------------------------------------
f403=figure(403);
set(f403,'Units','Normalized');
%set(f403,'Position',get(0, 'Screensize'));
set(f403,'Position',pos5);
plot(D_CD_T,D_CR_T,clr_ld_21);
hold on
plot(y_03,y_03,clr_blk);
hold off
axis([0 43 0 43]);
axis square
f_name = string(dimension) + ' - ' + 'Distance Dynamics Simulation vs Expected Trend';
title(f_name);
xlabel('D_R % (attacher)');
ylabel('D_G % (caregiver)');
legend('Expected Trend',...
       'Simulation');
if save_file
    savefig(f403,f_path+f_name+'.fig');
    saveas(f403,f_path+f_name+'.png');
end
%--------------------------------------
end
%--------------------------------------
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

