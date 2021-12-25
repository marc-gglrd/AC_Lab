%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf4 plot_stats print last on screen -------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB

if cf4_on
    disp(['[-- 02 --] Phobicity             (ad4) [- ON -] = '       num2str(round(ad4_ph            (n_it),4))])

    PRMS_ACLAB.final_report_out(3,2)                     =                 round(ad4_ph            (n_it),4);

    disp(['[-- 03 --] Limitation            (cf4) [- ON -] = '       num2str(round(cf4_li            (n_it),4))])

    PRMS_ACLAB.final_report_out(4,2)                     =                 round(cf4_li            (n_it),4);

    disp(['[-- 04 --] CD need4     (% it.s)  cf4  [- ON -] '     num2str(round(need4_cf4_pc      (n_it),2)) '%' ...
          '   ('                                                   num2str(round(need4_cf4_cntr    (n_it),4)) ')'])

    PRMS_ACLAB.final_report_out(5,2)                     =                 round(need4_cf4_pc      (n_it),2);
    PRMS_ACLAB.final_report_out(6,2)                     =                 round(need4_cf4_cntr    (n_it),4);

    disp(['[-- 05 --] CR need2give (% it.s)  cf4  [- ON -] '     num2str(round(need2give_cf4_pc  (n_it),2)) '%' ...
          '   ('                                                   num2str(round(need2give_cf4_cntr(n_it),4)) ')'])

    PRMS_ACLAB.final_report_out(7,2)                     =                round(need2give_cf4_pc  (n_it),2);
    PRMS_ACLAB.final_report_out(8,2)                     =                round(need2give_cf4_cntr(n_it),4); 

    % if strcmp(PRMS_ACLAB.t_def,'n-type') need4_cf4_pc & cf4_i_cd_m differs for first value only
    disp(['[-- 06 --] It.s (mean) with no     cf4  [- ON -] m = '       num2str(round(no_cf4_m      (n_it),4)) ...
                                                         '  sd = '       num2str(round(no_cf4_sd     (n_it),4))])                                                     

    PRMS_ACLAB.final_report_out(9,2)                           =                 round(no_cf4_m      (n_it),4);
    PRMS_ACLAB.final_report_out(10,2)                          =                 round(no_cf4_sd     (n_it),4);                                    

    disp(['[-- 07 --] CD vulnerability (mean)  (cf4) [- ON -] m = '   num2str(round(cf4_vu_cd_m   (n_it),4)) ...
                                                             '  sd = '   num2str(round(cf4_vu_cd_sd  (n_it),4)) ...
          ' ['                                                           num2str(round(cf4_vu_m2t_cd (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(11,2)                               =            round(cf4_vu_cd_m   (n_it),4);
    PRMS_ACLAB.final_report_out(12,2)                               =            round(cf4_vu_cd_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(13,2)                               =            round(cf4_vu_m2t_cd (n_it),4); 

    disp(['[-- 08 --] CR vulnerability (mean)  (cf4) [- ON -] m = '   num2str(round(cf4_vu_cr_m   (n_it),4)) ...
                                                             '  sd = '   num2str(round(cf4_vu_cr_sd  (n_it),4)) ...
          ' ['                                                           num2str(round(cf4_vu_m2t_cr (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(14,2)                               =            round(cf4_vu_cr_m   (n_it),4);
    PRMS_ACLAB.final_report_out(15,2)                               =            round(cf4_vu_cr_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(16,2)                               =            round(cf4_vu_m2t_cr (n_it),4);  

    disp(['[-- 09 --] CD vulnerability target  (cf4) [- ON -] = '       num2str(round(cf4_vu_trgt_cd   (n_it),4))])

    PRMS_ACLAB.final_report_out(17,2)                    =                 round(cf4_vu_trgt_cd   (n_it),4); 

    disp(['[-- 10 --] CR vulnerability target  (cf4) [- ON -] = '       num2str(round(cf4_vu_trgt_cr   (n_it),4))])

    PRMS_ACLAB.final_report_out(18,2)                    =                 round(cf4_vu_trgt_cr   (n_it),4);

    disp(['[-- 11 --] CD distancing (mean)  (cf4) [- ON -] m = ' num2str(round(cf4_d_cd_m   (n_it),4)) ...
                                                             '  sd = ' num2str(round(cf4_d_cd_sd  (n_it),4)) ...
          ' ['                                                         num2str(round(cf4_d_m2t_cd (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(19,2)                              =           round(cf4_d_cd_m   (n_it),4);
    PRMS_ACLAB.final_report_out(20,2)                              =           round(cf4_d_cd_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(21,2)                              =           round(cf4_d_m2t_cd (n_it),4);


    disp(['[-- 12 --] CR distancing (mean)  (cf4) [- ON -] m = ' num2str(round(cf4_d_cr_m   (n_it),4)) ...
                                                             '  sd = ' num2str(round(cf4_d_cr_sd  (n_it),4)) ...
          ' ['                                                         num2str(round(cf4_d_m2t_cr (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(22,2)                               =          round(cf4_d_cr_m   (n_it),4);
    PRMS_ACLAB.final_report_out(23,2)                               =          round(cf4_d_cr_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(24,2)                               =          round(cf4_d_m2t_cr (n_it),4);    

    disp(['[-- 13 --] CD distancing target  (cf4) [- ON -] = '       num2str(round(cf4_d_trgt_cd    (n_it),4))]) 

    PRMS_ACLAB.final_report_out(25,2)                    =                 round(cf4_d_trgt_cd    (n_it),4); 

    disp(['[-- 14 --] CR distancing target  (cf4) [- ON -] = '       num2str(round(cf4_d_trgt_cr    (n_it),4))]) 

    PRMS_ACLAB.final_report_out(26,2)                    =                 round(cf4_d_trgt_cr    (n_it),4);
end

