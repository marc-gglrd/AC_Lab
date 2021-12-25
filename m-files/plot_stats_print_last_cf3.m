%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf3 plot_stats print last on screen -------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB

if cf3_on
    disp(['[-- 02 --] Ambivalence           (ad3) [- ON -] = '       num2str(round(ad3_am            (n_it),4))])

    PRMS_ACLAB.final_report_out(3,2)                     =                 round(ad3_am            (n_it),4);

    disp(['[-- 03 --] Unresponsiveness      (cf3) [- ON -] = '       num2str(round(cf3_un            (n_it),4))])

    PRMS_ACLAB.final_report_out(4,2)                     =                 round(cf3_un            (n_it),4);

    disp(['[-- 04 --] CD need4     (% it.s)  cf3  [- ON -] '     num2str(round(need4_cf3_pc      (n_it),2)) '%' ...
          '   ('                                                   num2str(round(need4_cf3_cntr    (n_it),4)) ')'])

    PRMS_ACLAB.final_report_out(5,2)                     =                 round(need4_cf3_pc      (n_it),2);
    PRMS_ACLAB.final_report_out(6,2)                     =                 round(need4_cf3_cntr    (n_it),4);

    disp(['[-- 05 --] CR need2give (% it.s)  cf3  [- ON -] '     num2str(round(need2give_cf3_pc  (n_it),2)) '%' ...
          '   ('                                                   num2str(round(need2give_cf3_cntr(n_it),4)) ')'])

    PRMS_ACLAB.final_report_out(7,2)                     =                round(need2give_cf3_pc  (n_it),2);
    PRMS_ACLAB.final_report_out(8,2)                     =                round(need2give_cf3_cntr(n_it),4); 

    % if strcmp(PRMS_ACLAB.t_def,'n-type') need4_cf3_pc & cf3_i_cd_m differs for first value only
    disp(['[-- 06 --] It.s (mean) with no     cf3  [- ON -] m = '       num2str(round(no_cf3_m      (n_it),4)) ...
                                                         '  sd = '       num2str(round(no_cf3_sd     (n_it),4))])                                                     

    PRMS_ACLAB.final_report_out(9,2)                           =                 round(no_cf3_m      (n_it),4);
    PRMS_ACLAB.final_report_out(10,2)                          =                 round(no_cf3_sd     (n_it),4);                                    

    disp(['[-- 07 --] CD p-distance (mean)  (cf3) [- ON -] m = '   num2str(round(cf3_pd_cd_m   (n_it),4)) ...
                                                             '  sd = '   num2str(round(cf3_pd_cd_sd  (n_it),4)) ...
          ' ['                                                           num2str(round(cf3_pd_m2t_cd (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(11,2)                               =            round(cf3_pd_cd_m   (n_it),4);
    PRMS_ACLAB.final_report_out(12,2)                               =            round(cf3_pd_cd_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(13,2)                               =            round(cf3_pd_m2t_cd (n_it),4); 

    disp(['[-- 08 --] CR p-distance (mean)  (cf3) [- ON -] m = '   num2str(round(cf3_pd_cr_m   (n_it),4)) ...
                                                             '  sd = '   num2str(round(cf3_pd_cr_sd  (n_it),4)) ...
          ' ['                                                           num2str(round(cf3_pd_m2t_cr (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(14,2)                               =            round(cf3_pd_cr_m   (n_it),4);
    PRMS_ACLAB.final_report_out(15,2)                               =            round(cf3_pd_cr_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(16,2)                               =            round(cf3_pd_m2t_cr (n_it),4);  

    disp(['[-- 09 --] CD p-distance target  (cf3) [- ON -] = '       num2str(round(cf3_pd_trgt_cd   (n_it),4))])

    PRMS_ACLAB.final_report_out(17,2)                    =                 round(cf3_pd_trgt_cd   (n_it),4); 

    disp(['[-- 10 --] CR p-distance target  (cf3) [- ON -] = '       num2str(round(cf3_pd_trgt_cr   (n_it),4))])

    PRMS_ACLAB.final_report_out(18,2)                    =                 round(cf3_pd_trgt_cr   (n_it),4);

    disp(['[-- 11 --] CD distancing (mean)  (cf3) [- ON -] m = ' num2str(round(cf3_d_cd_m   (n_it),4)) ...
                                                             '  sd = ' num2str(round(cf3_d_cd_sd  (n_it),4)) ...
          ' ['                                                         num2str(round(cf3_d_m2t_cd (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(19,2)                              =           round(cf3_d_cd_m   (n_it),4);
    PRMS_ACLAB.final_report_out(20,2)                              =           round(cf3_d_cd_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(21,2)                              =           round(cf3_d_m2t_cd (n_it),4);


    disp(['[-- 12 --] CR distancing (mean)  (cf3) [- ON -] m = ' num2str(round(cf3_d_cr_m   (n_it),4)) ...
                                                             '  sd = ' num2str(round(cf3_d_cr_sd  (n_it),4)) ...
          ' ['                                                         num2str(round(cf3_d_m2t_cr (n_it),4)) ']'])

    PRMS_ACLAB.final_report_out(22,2)                               =          round(cf3_d_cr_m   (n_it),4);
    PRMS_ACLAB.final_report_out(23,2)                               =          round(cf3_d_cr_sd  (n_it),4);
    PRMS_ACLAB.final_report_out(24,2)                               =          round(cf3_d_m2t_cr (n_it),4);    

    disp(['[-- 13 --] CD distancing target  (cf3) [- ON -] = '       num2str(round(cf3_d_trgt_cd    (n_it),4))]) 

    PRMS_ACLAB.final_report_out(25,2)                    =                 round(cf3_d_trgt_cd    (n_it),4); 

    disp(['[-- 14 --] CR distancing target  (cf3) [- ON -] = '       num2str(round(cf3_d_trgt_cr    (n_it),4))]) 

    PRMS_ACLAB.final_report_out(26,2)                    =                 round(cf3_d_trgt_cr    (n_it),4);  
end

