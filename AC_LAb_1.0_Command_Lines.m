% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% COMMAND LINES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Quick Start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

To plot 'The agents in the lab'
(standard mode, 100 iterations, every iteration displayed, no file saved):
- for Avoidance 0.1:   run 'aclab_go('av01',0,100,1,0,0,0,false);'
- for Avoidance 0.5:   run 'aclab_go('av05',0,100,1,0,0,0,false);'
- for Avoidance 0.9:   run 'aclab_go('av09',0,100,1,0,0,0,false);'
- for Ambivalence 0.1: run 'aclab_go('am01',0,100,1,0,0,0,false);'
- for Ambivalence 0.4: run 'aclab_go('am04',0,100,1,0,0,0,false);'
- for Ambivalence 0.9: run 'aclab_go('am09',0,100,1,0,0,0,false);'
- for Phobicity 0.1:   run 'aclab_go('ph01',0,100,1,0,0,0,false);'
- for Phobicity 0.5:   run 'aclab_go('ph05',0,100,1,0,0,0,false);'
- for Phobicity 0.9:   run 'aclab_go('ph09',0,100,1,0,0,0,false);'

To plot 'Behavioral patterns' (standard mode, 1000 iterations):
- for Avoidance 0.1:   run 'aclab_go('av01',0,1000);'
- for Avoidance 0.5:   run 'aclab_go('av05',0,1000);'
- for Avoidance 0.9:   run 'aclab_go('av09',0,1000);'
- for Ambivalence 0.1: run 'aclab_go('am01',0,1000);'
- for Ambivalence 0.4: run 'aclab_go('am04',0,1000);'
- for Ambivalence 0.9: run 'aclab_go('am09',0,1000);'
- for Phobicity 0.1:   run 'aclab_go('ph01',0,1000);'
- for Phobicity 0.5:   run 'aclab_go('ph05',0,1000);'
- for Phobicity 0.9:   run 'aclab_go('ph09',0,1000);'

To plot 'Mean values and trends':
- for Avoidance:   run 'plot_reports(1,0,0)'
- for Ambivalence: run 'plot_reports(0,1,0)'
- for Phobicity:   run 'plot_reports(0,0,1)'

To plot 'Simulated vs expected dynamics':
- for Avoidance:   run 'plot_DYNAMICS_targets(1,0,0)'
- for Ambivalence: run 'plot_DYNAMICS_targets(0,1,0)'
- for Phobicity:   run 'plot_DYNAMICS_targets(0,0,1)'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%av: avoidance
%am: ambivalence
%ph: phobicity

%av0X: avoidance   at level 0X
%am0X: ambivalence at level 0X
%ph0X: phobicity   at level 0X

%dd0X: dimension dd at level 0X

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SINGLE DIMENSIONAL LEVEL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%TO RUN AVOIDANCE/AMBIVALENCE/PHOBICITY
% Parameters:
(1) 'dd0X' - dimension and level e.g. 'av07','am03','ph04'
(2) 0/1    - standard mode / random mode
(3) iiii   - iiii iterations e.g. iiii = 1000

e.g. aclab_go('av07',0,1000);

% Parameters:
(4) 0/1        - no printing on screen / printing on screen   [zero for first-last only]
(5) it.A       - output from iteration it.A e.g. 900          [zero for first-last only]
(6) it.B       - output to   iteration it.B e.g. 1000         [zero for first-last only]
(7) -1/0/1     - output plot no plots/lab/graphs - default is 1
(8) true/false - output images activated / output images deactivated [default is false]

e.g. aclab_go('av07',0,1000,0,900,1000,0,true);

%%%--- CHECK FLAGS in plot_stats.m TO SELECT OUTPUT ---%%%

% %flags - are set in plot_stats_plot_setup.m and
% %      - control + plot_stats_plot_cf2.m
% %                + plot_stats_plot_cf3.m
% %                + plot_stats_plot_cf4.m
% %-- see plot_stats_plot_setup.m for plot content --

% f0_on = false; %diagram - Trajectories/Relative Trajectory/Distance
% f1_on = false; %diagram - i/d/d
% f2_on = false; %diagram - x (drives)
% f3_on = false; %diagram - p (Needs)
% f4_on = false; %diagram - no care counter (K)
% f5_on = false; %diagram
% fx_on = true;  % mixed plot (K, x, Se/Dp/Vu)

% f_lab_on <--- TRUE TO PLOT AGENTS MOVING IN LAB
%     
% Lab_D_on        %true to plot lab distance                             [last 200 iterations]
% Trajectories_on %true to plot agents' trajectories in lab              [last 200 iterations]
% XY_D_on         %true to plot child's trajectory relative to caregiver [last 200 iterations]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ALL DIMENSIONAL LEVELS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%TO RUN AVOIDANCE for ALL VALUES 0.1 to 0,9
%PRINTING on Screen & PLOTTING GRAPHS
plot_reports(1,0,0)

%TO RUN AMBIVALENCE for ALL VALUES 0.1 to 0,9
%PRINTING on Screen & PLOTTING GRAPHS
plot_reports(0,1,0)

%TO RUN PHOBICITY for ALL VALUES 0.1 to 0,9
%PRINTING on Screen & PLOTTING GRAPHS
plot_reports(0,0,1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DYNAMICS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%TO RUN AVOIDANCE
plot_DYNAMICS_targets(1,0,0)

%TO RUN AMBIVALENCE
plot_DYNAMICS_targets(0,1,0)

%TO RUN PHOBICITY
plot_DYNAMICS_targets(0,0,1)

%%%--- CHECK FLAGS TO SELECT OUTPUT ---%%%
