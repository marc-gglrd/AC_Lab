function plot_reports(Av_ON,... %(1) 1 to plot / 0 not to plot  Avoidance   case
                      Am_ON,... %(2) 1 to plot / 0 not to plot  Ambivalence case
                      Ph_ON)    %(3) 1 to plot / 0 not to plot  Phobicity   case
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

% ----------------------------------
f_path = '.\OUTPUT_PLOTS_CURRENT\';

save_file = true;
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
    %Ph_ON = false;
    %print_msg = 'Not Plotting Phobicity'
else
    Ph_ON = true;
    print_msg = 'Plotting Phobicity'
end

% --- standard deviation plot flag ------------------
% sd_ON = true;
% sd_ON = false;

pause(3);

% ---------------------------------------------------
% --- plot_reports ----------------------------------
% ---------------------------------------------------

% script for plotting data from final reports:
% aclab_go is launched for all the avoidance/ambivalence/phobicity values and
% the reported data are collected to be plotted

% data are taken from the final reports,
% which have the following form:
% ---------------------------------------------------
% --- FINAL REPORT --- AC-Lab vXXXXXX.XXXX ----------
% ---------------------------------------------------
% [-- 00 --] ITERATIONS
% [-- 01 --] Lab Distance
% ---------------------------------------------------
% [-- 02 --] Avoidance/Ambivalence/Phobicity
% [-- 03 --] Insensitivity/Unresponsiveness/Limitation
% [-- 04 --] CD need4     (% it.s)
% [-- 05 --] CR need2give (% it.s)
% [-- 06 --] It.s (mean) with no cf
% [-- 07 --] CD x-distance/vulnerability (mean) (sd)
% [-- 08 --] CR x-distance/vulnerability (mean) (sd)
% [-- 09 --] CD x-distance/vulnerability (mean) target
% [-- 10 --] CR x-distance/vulnerability (mean) target
% [-- 11 --] CD indifference/distancing (mean) (mean) (sd)
% [-- 12 --] CR indifference/distancing (mean) (mean) (sd)
% [-- 13 --] CD indifference/distancing (mean) target
% [-- 14 --] CR indifference/distancing (mean) target
% ---------------------------------------------------
% [-- 15 --] CD Exploring   (% it.s)
% [-- 16 --] CD Approaching (% it.s)
% [-- 17 --] CR Exploring   (% it.s)
% [-- 18 --] CR Approaching (% it.s)
% ---------------------------------------------------
% --- FINAL REPORT - END ----------------------------
% ---------------------------------------------------

%fro:  final report output
%fros: fro selection
fro_size  = 36;
fros_size = 19;

c_mode = 0;
tot_it = 5000;% number of iterations for aclab
tot_it = 1000;%ALSO OK<---------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% GET NEW DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GET_NEW_AV_DATA = false;
GET_NEW_AM_DATA = false;
GET_NEW_PH_DATA = false;

GET_NEW_AV_DATA = true;
GET_NEW_AM_DATA = true;
GET_NEW_PH_DATA = true;

if Av_ON
if GET_NEW_AV_DATA
    fros_av_tags = ["AvXX", "ITERATIONS", "Lab Distance", "Av/In",...
                    "CD need4 (% it.s)", "CR need2give (% it.s)", "It.s (mean) with no cf",...
                    "CD e-distance (mean)", "CR e-distance (mean)", "CD e-distance target", "CR e-distance target",...
                    "CD indifference (mean)", "CR indifference (mean)", "CD indifference target", "CR indifference target",...
                    "CD Exploring (% it.s)", "CD Approaching (% it.s)",...
                    "CR Exploring (% it.s)", "CR Approaching (% it.s)"];

    fros_av_tags = fros_av_tags';
    fros_av_all  = fros_av_tags;
    [fro_av_all, fros_av_all] = plot_reports_fill_fros_av_all(fros_av_all,fro_size,fros_size,c_mode,tot_it);
end
end

if Am_ON
if GET_NEW_AM_DATA
    fros_am_tags = ["AmXX", "ITERATIONS", "Lab Distance", "Am/Un",...
                    "CD need4 (% it.s)", "CR need2give (% it.s)", "It.s (mean) with no cf",...
                    "CD p-distance (mean)", "CR p-distance (mean)", "CD p-distance target", "CR p-distance target",...
                    "CD distancing (mean)", "CR distancing (mean)", "CD distancing target", "CR distancing target",...
                    "CD Exploring (% it.s)", "CD Approaching (% it.s)",...
                    "CR Exploring (% it.s)", "CR Approaching (% it.s)"];

    fros_am_tags = fros_am_tags';
    fros_am_all  = fros_am_tags;
    [fro_am_all, fros_am_all] = plot_reports_fill_fros_am_all(fros_am_all,fro_size,fros_size,c_mode,tot_it);
end
end

if Ph_ON
if GET_NEW_PH_DATA
    fros_ph_tags = ["PhXX", "ITERATIONS", "Lab Distance", "Ph/Li",...
                    "CD need4 (% it.s)", "CR need2give (% it.s)", "It.s (mean) with no cf",...
                    "CD vulnerability (mean)", "CR vulnerability (mean)", "CD vulnerability target", "CR vulnerability target",...
                    "CD distancing (mean)", "CR distancing (mean)", "CD distancing target", "CR distancing target",...
                    "CD Exploring (% it.s)", "CD Approaching (% it.s)",...
                    "CR Exploring (% it.s)", "CR Approaching (% it.s)"];

    fros_ph_tags = fros_ph_tags';
    fros_ph_all  = fros_ph_tags;
    [fro_ph_all, fros_ph_all] = plot_reports_fill_fros_ph_all(fros_ph_all,fro_size,fros_size,c_mode,tot_it);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PLOT DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot_set_up % m file with colors & positions

x = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]; % dimensional levels

%GRAPH 1
title_av_01 = 'Avoidance/Insensitivity - Need';
title_am_01 = 'Ambivalence/Unresponsiveness - Need';
title_ph_01 = 'Phobicity/Limitation - Need';
f_title_av_01 = 'Avoidance_Need';
f_title_am_01 = 'Ambivalence_Need';
f_title_ph_01 = 'Phobicity_Need';
% [-- 01 --] Lab Distance
% [-- 04 --] CD need4     (% it.s)
% [-- 05 --] CR need2give (% it.s)
% [-- 06 --] It.s (mean) with no cf

if Av_ON
    y_av_03 = double(fros_av_all(3,2:10));
    y_av_05 = double(fros_av_all(5,2:10));
    y_av_06 = double(fros_av_all(6,2:10));
    y_av_07 = double(fros_av_all(7,2:10));
end

if Am_ON
    y_am_03 = double(fros_am_all(3,2:10));
    y_am_05 = double(fros_am_all(5,2:10));
    y_am_06 = double(fros_am_all(6,2:10));
    y_am_07 = double(fros_am_all(7,2:10));
end

if Ph_ON
    y_ph_03 = double(fros_ph_all(3,2:10));
    y_ph_05 = double(fros_ph_all(5,2:10));
    y_ph_06 = double(fros_ph_all(6,2:10));
    y_ph_07 = double(fros_ph_all(7,2:10));
end

%GRAPH 2
title_av_02 = 'Avoidance/Insensitivity - Action';
title_am_02 = 'Ambivalence/Unresponsiveness - Action';
title_ph_02 = 'Phobicity/Limitation - Action';
f_title_av_02 = 'Avoidance_Action';
f_title_am_02 = 'Ambivalence_Action';
f_title_ph_02 = 'Phobicity_Action';
% [-- 01 --] Lab Distance
% [-- 15 --] CD Exploring   (% it.s)
% [-- 16 --] CD Approaching (% it.s)
% [-- 17 --] CR Exploring   (% it.s)
% [-- 18 --] CR Approaching (% it.s)

if Av_ON
    y_av_16 = double(fros_av_all(16,2:10));
    y_av_17 = double(fros_av_all(17,2:10));
    y_av_18 = double(fros_av_all(18,2:10));
    y_av_19 = double(fros_av_all(19,2:10));
end

if Am_ON
    y_am_16 = double(fros_am_all(16,2:10));
    y_am_17 = double(fros_am_all(17,2:10));
    y_am_18 = double(fros_am_all(18,2:10));
    y_am_19 = double(fros_am_all(19,2:10));
end 

if Ph_ON
    y_ph_16 = double(fros_ph_all(16,2:10));
    y_ph_17 = double(fros_ph_all(17,2:10));
    y_ph_18 = double(fros_ph_all(18,2:10));
    y_ph_19 = double(fros_ph_all(19,2:10));
end 

%GRAPH 3
title_av_03 = 'Avoidance/Insensitivity - Emotional Distance';
title_am_03 = 'Ambivalence/Unresponsiveness - Physical Distance';
title_ph_03 = 'Phobicity/Limitation - Vulnerability';
f_title_av_03 = 'Avoidance_Emotional_Distance';
f_title_am_03 = 'Ambivalence_Physical_Distance';
f_title_ph_03 = 'Phobicity_Vulnerability';
% [-- 01 --] Lab Distance
% [-- 07 --] CD x-distance/vulnerability (mean)
% [-- 08 --] CR x-distance/vulnerability (mean)
% [-- 09 --] CD x-distance/vulnerability (mean) target
% [-- 10 --] CR x-distance/vulnerability (mean) target

if Av_ON
    y_av_08 = double(fros_av_all(8,2:10));
    y_av_09 = double(fros_av_all(9,2:10));
    y_av_10 = double(fros_av_all(10,2:10));
    y_av_11 = double(fros_av_all(11,2:10));
end 

if Am_ON
    y_am_08 = double(fros_am_all(8,2:10));
    y_am_09 = double(fros_am_all(9,2:10));
    y_am_10 = double(fros_am_all(10,2:10));
    y_am_11 = double(fros_am_all(11,2:10));
end

if Ph_ON
    y_ph_08 = double(fros_ph_all(8,2:10));
    y_ph_09 = double(fros_ph_all(9,2:10));
    y_ph_10 = double(fros_ph_all(10,2:10));
    y_ph_11 = double(fros_ph_all(11,2:10));
end

%GRAPH 4
title_av_04 = 'Avoidance/Insensitivity - Indifference';
title_am_04 = 'Ambivalence/Unresponsiveness - Distancing';
title_ph_04 = 'Phobicity/Limitation - Distancing';
f_title_av_04 = 'Avoidance_Indifference';
f_title_am_04 = 'Ambivalence_Distancing';
f_title_ph_04 = 'Phobicity_Distancing';
% [-- 01 --] Lab Distance
% [-- 11 --] CD indifference/distancing (mean)
% [-- 12 --] CR indifference/distancing (mean)
% [-- 13 --] CD indifference/distancing (mean) target
% [-- 14 --] CR indifference/distancing (mean) target

if Av_ON
    y_av_12 = double(fros_av_all(12,2:10));
    y_av_13 = double(fros_av_all(13,2:10));
    y_av_14 = double(fros_av_all(14,2:10));
    y_av_15 = double(fros_av_all(15,2:10));
end

if Am_ON
    y_am_12 = double(fros_am_all(12,2:10));
    y_am_13 = double(fros_am_all(13,2:10));
    y_am_14 = double(fros_am_all(14,2:10));
    y_am_15 = double(fros_am_all(15,2:10));
end

if Ph_ON
    y_ph_12 = double(fros_ph_all(12,2:10));
    y_ph_13 = double(fros_ph_all(13,2:10));
    y_ph_14 = double(fros_ph_all(14,2:10));
    y_ph_15 = double(fros_ph_all(15,2:10));
end

%- plot variables ---------------------
% x: dimensional levels 0.1 - 0.9
% y_01: 
% y_02: 
% y_03: Lab Distance
% y_04: 
% y_05: CD need4
% y_06: CR need2give
% y_07: It.s with no cf
% y_08: CD x-distance/vulnerability
% y_09: CR x-distance/vulnerability
% y_10: CD x-distance/vulnerability target
% y_11: CR x-distance/vulnerability target
% y_12: CD indifference/distancing
% y_13: CR indifference/distancing
% y_14: CD indifference/distancing target
% y_15: CR indifference/distancing target
% y_16: CD Exploring
% y_17: CD Approaching
% y_18: CR Exploring
% y_19: CR Approaching
%--------------------------------------

if Av_ON
    plot_reports_plot_av
    % --- save workspace on file plot_reports_ws_av.mat ---
    %save('plot_reports_ws_av');
    % -----------------------------------------------------
end

if Am_ON
    plot_reports_plot_am
    % --- save workspace on file plot_reports_ws_am.mat ---
    %save('plot_reports_ws_am');
    % -----------------------------------------------------
end

if Ph_ON
    plot_reports_plot_ph
    % --- save workspace on file plot_reports_ws_am.mat ---
    %save('plot_reports_ws_ph');
    % -----------------------------------------------------
end



end