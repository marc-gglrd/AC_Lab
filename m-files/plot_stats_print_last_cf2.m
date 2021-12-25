%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf2 plot_stats print last on screen -------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB

if cf2_on
    disp(['[-- 02 --] Avoidance              (ad2) [- ON -] = '      num2str(round(ad2_av            (n_it),4))])

    PRMS_ACLAB.final_report_out(3,2)                      =                round(ad2_av            (n_it),4);

    disp(['[-- 03 --] Insensitivity          (cf2) [- ON -] = '      num2str(round(cf2_in            (n_it),4))])

    PRMS_ACLAB.final_report_out(4,2)                      =                round(cf2_in            (n_it),4);

    disp(['[-- 04 --] CD need4     (% it.s)   cf2  [- ON -] '    num2str(round(need4_cf2_pc      (n_it),2)) '%' ...
          '   ('                                                   num2str(round(need4_cf2_cntr    (n_it),4)) ')'])   

    PRMS_ACLAB.final_report_out(5,2)                      =                round(need4_cf2_pc      (n_it),2);
    PRMS_ACLAB.final_report_out(6,2)                      =                round(need4_cf2_cntr    (n_it),4);

    disp(['[-- 05 --] CR need2give (% it.s)   cf2  [- ON -] '    num2str(round(need2give_cf2_pc  (n_it),2)) '%' ...
          '   ('                                                   num2str(round(need2give_cf2_cntr(n_it),4)) ')'])

    PRMS_ACLAB.final_report_out(7,2)                      =                round(need2give_cf2_pc  (n_it),2);
    PRMS_ACLAB.final_report_out(8,2)                      =                round(need2give_cf2_cntr(n_it),4);

    % if strcmp(PRMS_ACLAB.t_def,'n-type') need4_cf2_pc & cf2_i_cd_m differs for first value only
    disp(['[-- 06 --] It.s (mean) with no     cf2  [- ON -] m = ' num2str(round(no_cf2_m          (n_it),4)) ...
                                                         '  sd = ' num2str(round(no_cf2_sd         (n_it),4))])

    PRMS_ACLAB.final_report_out(9,2)                           =           round(no_cf2_m          (n_it),4);
    PRMS_ACLAB.final_report_out(10,2)                          =           round(no_cf2_sd         (n_it),4);

    disp(['[-- 07 --] CD e-distance (mean)   (cf2) [- ON -] m = '  num2str(round(cf2_ed_cd_m   (n_it),4)) ...
                                                              '  sd = '  num2str(round(cf2_ed_cd_sd  (n_it),4)) ...
          ' ['                                                           num2str(round(cf2_ed_m2t_cd (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(11,2)                               =            round(cf2_ed_cd_m   (n_it),4);
    PRMS_ACLAB.final_report_out(12,2)                               =            round(cf2_ed_cd_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(13,2)                               =            round(cf2_ed_m2t_cd (n_it),4);

    disp(['[-- 08 --] CR e-distance (mean)   (cf2) [- ON -] m = '  num2str(round(cf2_ed_cr_m   (n_it),4)) ...
                                                              '  sd = '  num2str(round(cf2_ed_cr_sd  (n_it),4)) ...
          ' ['                                                           num2str(round(cf2_ed_m2t_cr (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(14,2)                               =            round(cf2_ed_cr_m   (n_it),4);
    PRMS_ACLAB.final_report_out(15,2)                               =            round(cf2_ed_cr_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(16,2)                               =            round(cf2_ed_m2t_cr (n_it),4);

    disp(['[-- 09 --] CD e-distance target   (cf2) [- ON -] = '      num2str(round(cf2_ed_trgt_cd    (n_it),4))])

    PRMS_ACLAB.final_report_out(17,2)                     =                round(cf2_ed_trgt_cd    (n_it),4);

    disp(['[-- 10 --] CR e-distance target   (cf2) [- ON -] = '      num2str(round(cf2_ed_trgt_cr    (n_it),4))])

    PRMS_ACLAB.final_report_out(18,2)                     =                round(cf2_ed_trgt_cr    (n_it),4);

    disp(['[-- 11 --] CD indifference (mean) (cf2) [- ON -] m = ' num2str(round(cf2_i_cd_m   (n_it),4)) ...
                                                              '  sd = ' num2str(round(cf2_i_cd_sd  (n_it),4)) ...
          ' ['                                                          num2str(round(cf2_i_m2t_cd (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(19,2)                               =           round(cf2_i_cd_m   (n_it),4);
    PRMS_ACLAB.final_report_out(20,2)                               =           round(cf2_i_cd_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(21,2)                               =           round(cf2_i_m2t_cd (n_it),4);

    disp(['[-- 12 --] CR indifference (mean) (cf2) [- ON -] m = ' num2str(round(cf2_i_cr_m   (n_it),4)) ...
                                                              '  sd = ' num2str(round(cf2_i_cr_sd  (n_it),4)) ...
          ' ['                                                          num2str(round(cf2_i_m2t_cr (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(22,2)                               =           round(cf2_i_cr_m   (n_it),4);
    PRMS_ACLAB.final_report_out(23,2)                               =           round(cf2_i_cr_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(24,2)                               =           round(cf2_i_m2t_cr (n_it),4);  

    disp(['[-- 13 --] CD indifference target (cf2) [- ON -] = '      num2str(round(cf2_i_trgt_cd     (n_it),4))])

    PRMS_ACLAB.final_report_out(25,2)                     =                round(cf2_i_trgt_cd     (n_it),4); 

    disp(['[-- 14 --] CR indifference target (cf2) [- ON -] = '      num2str(round(cf2_i_trgt_cr     (n_it),4))])

    PRMS_ACLAB.final_report_out(26,2)                     =                round(cf2_i_trgt_cr     (n_it),4); 
end
