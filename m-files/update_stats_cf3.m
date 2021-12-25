%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf3 stats update --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global IT_STATS N_IT

 IT_STATS.p2need_cf3_x(N_IT+1)   = curr_cd.p2need_cf3_x;         %(7)
 IT_STATS.p2give_cf3_x(N_IT+1)   = curr_cr.p2give_cf3_x;         %(9)
 IT_STATS.p2need_cf3_xf(N_IT+1)  = curr_cd.p2need_cf3_xf;        %(11)
 IT_STATS.p2give_cf3_xf(N_IT+1)  = curr_cr.p2give_cf3_xf;        %(13)
 IT_STATS.p2need_cf3(N_IT+1)     = curr_cd.p2need_cf3;           %(15)
 IT_STATS.p2give_cf3(N_IT+1)     = curr_cr.p2give_cf3;           %(17)

 IT_STATS.ad3_am    (N_IT+1)     = curr_cd.iwm.ad3_am;           %(19)

 IT_STATS.cf3_un    (N_IT+1)     = curr_cr.iwm.cf3_un;           %(21)
                                                                                      
 last_need4_cf3     = IT_STATS.need4_cf3    (N_IT);
 last_need2give_cf3 = IT_STATS.need2give_cf3(N_IT);
 
 curr_need4_cf3     = curr_cd.need4_cf3;
 curr_need2give_cf3 = curr_cr.need2give_cf3;
 
 % --- relevant events ----------------------------------------------
 
 IT_STATS.need4_cf3      (N_IT+1) = curr_need4_cf3;     %(24)
 IT_STATS.need2give_cf3  (N_IT+1) = curr_need2give_cf3; %(26)
                                     
 IT_STATS.n4_n2g_cf3   (N_IT+1) = 0; %(28) cf3: child needs for, caregiver needs to give (n4_n2n2g-event)
 IT_STATS.n2g_n4_cf3   (N_IT+1) = 0; %(30) cf3: caregiver needs to give, child needs for (n2_gn4-event)
 IT_STATS.n4_n2g_st_cf3(N_IT+1) = 0; %(32) cf3: child needs for, caregiver needs to give at same iteration (n4_n2n2g-event)
 
 IT_STATS.n4_nn2g_cf3  (N_IT+1) = 0; %(34) cf3: child needs for, caregiver does not need to give (n4_nn2n2g-event)
 IT_STATS.n2g_nn4_cf3  (N_IT+1) = 0; %(36) cf3: caregiver needs to give, child does not need for (n2g_nn4-event)
 
 % --- relevant event counters --------------------------------------
 
 IT_STATS.need4_cf3_cntr    (N_IT+1) = IT_STATS.need4_cf3_cntr    (N_IT); %(38) cf3: n4-events  counter (n4-event  at it.n+1)
 IT_STATS.need2give_cf3_cntr(N_IT+1) = IT_STATS.need2give_cf3_cntr(N_IT); %(40) cf3: n2g-events counter (n2g-event at it.n+1)
 
 IT_STATS.n4_n2g_cf3_cntr   (N_IT+1) = IT_STATS.n4_n2g_cf3_cntr   (N_IT); %(42) cf3: n4_n2g-events counter (n4-event  at it.n - n2g-event at it. n+1)
 IT_STATS.n2g_n4_cf3_cntr   (N_IT+1) = IT_STATS.n2g_n4_cf3_cntr   (N_IT); %(44) cf3: n2g_n4-events counter (n2g-event at it.n - n4-event  at it. n+1)
 
 IT_STATS.n4_n2g_st_cf3_cntr(N_IT+1) = IT_STATS.n4_n2g_st_cf3_cntr(N_IT); %(46) cf3: n4_n2g-events counter (n4-event at it.n+1 - n2g-event at it. n+1)
 
 IT_STATS.n4_nn2g_cf3_cntr  (N_IT+1) = IT_STATS.n4_nn2g_cf3_cntr  (N_IT); %(48) cf3: n4_nn2g-events counter (n4-event  at it.n - nn2g-event at it. n+1)
 IT_STATS.n2g_nn4_cf3_cntr  (N_IT+1) = IT_STATS.n2g_nn4_cf3_cntr  (N_IT); %(50) cf3: n2g_nn4-events counter (n2g-event at it.n - nn4-event  at it. n+1)
  
 % --- update counters --------------------------
 if curr_need4_cf3
     IT_STATS.need4_cf3_cntr(N_IT+1) = IT_STATS.need4_cf3_cntr(N_IT) + 1;         %(38)
 end
 
 if curr_need2give_cf3
     IT_STATS.need2give_cf3_cntr(N_IT+1) = IT_STATS.need2give_cf3_cntr(N_IT) + 1; %(40)
 end
 
 % --- update events & counters -----------------
 if last_need4_cf3 && curr_need2give_cf3
     IT_STATS.n4_n2g_cf3     (N_IT+1) = 1;                                        %(28)
     IT_STATS.n4_n2g_cf3_cntr(N_IT+1) = IT_STATS.n4_n2g_cf3_cntr(N_IT) + 1;       %(42)
 end
 
 if last_need2give_cf3 && curr_need4_cf3
     IT_STATS.n2g_n4_cf3     (N_IT+1) = 1;                                        %(30)
     IT_STATS.n2g_n4_cf3_cntr(N_IT+1) = IT_STATS.n2g_n4_cf3_cntr(N_IT) + 1;       %(44)
 end
 
 % --- update counters --------------------------
 if curr_need4_cf3 && curr_need2give_cf3
     IT_STATS.n4_n2g_st_cf3     (N_IT+1) = 1;                                     %(32)
     IT_STATS.n4_n2g_st_cf3_cntr(N_IT+1) = IT_STATS.n4_n2g_st_cf3_cntr(N_IT) + 1; %(46)
 end
 
 % --- update events & counters -----------------
 if last_need4_cf3 && ~curr_need2give_cf3
     IT_STATS.n4_nn2g_cf3     (N_IT+1) = 1;                                       %(34)
     IT_STATS.n4_nn2g_cf3_cntr(N_IT+1) = IT_STATS.n4_nn2g_cf3_cntr(N_IT) + 1;     %(48)
 end
 
 if last_need2give_cf3 && ~curr_need4_cf3
     IT_STATS.n2g_nn4_cf3     (N_IT+1) = 1;                                       %(36)
     IT_STATS.n2g_nn4_cf3_cntr(N_IT+1) = IT_STATS.n2g_nn4_cf3_cntr(N_IT) + 1;     %(50)
 end

 % --- update counters --------------------------
 IT_STATS.no_cf3_cntr (N_IT+1) = curr_cd.no_cf3_cntr; %(52) cf3: no care received/given iteration-counter
 
 % --- mean values ------------------------------
 if IT_STATS.no_cf3_cntr (N_IT+1) == 1
     IT_STATS.no_cf3_ntrs(N_IT+1) = IT_STATS.no_cf3_ntrs(N_IT) + 1; %(54) cf3: nomber of intervals of no care (new interval)
 else
     IT_STATS.no_cf3_ntrs(N_IT+1) = IT_STATS.no_cf3_ntrs(N_IT);     %(54) cf3: nomber of intervals of no care (same interval)
 end
 % ----------------------------------------------    
 if IT_STATS.no_cf3_cntr (N_IT+1) >= 1
     IT_STATS.no_cf3_ls(N_IT+1) = IT_STATS.no_cf3_ls(N_IT) + 1; %(56) cf3: intervals of no care length sum
 else
     IT_STATS.no_cf3_ls(N_IT+1) = IT_STATS.no_cf3_ls(N_IT);     %(56) cf3: intervals of no care length sum
 end   
 % ----------------------------------------------
 if IT_STATS.no_cf3_ntrs(N_IT+1) > 0
     IT_STATS.no_cf3_m(N_IT+1) = IT_STATS.no_cf3_ls(N_IT+1) / IT_STATS.no_cf3_ntrs(N_IT+1); %(58) cf3: intervals of no care mean-length
 else
     IT_STATS.no_cf3_m(N_IT+1) = 0;
 end
 % --- standard deviations ----------------------
 
 IT_STATS.no_cf3_dm2s       = IT_STATS.no_cf3_dm2s + ...
                             (IT_STATS.no_cf3_cntr(N_IT+1) - ...
                              IT_STATS.no_cf3_m(N_IT+1))^2;        %(60)
                          
 IT_STATS.no_cf3_sd(N_IT+1) = sqrt(IT_STATS.no_cf3_dm2s / (N_IT)); %(62)
 
 % ---- p-distance --------------------------------------------------
 
 IT_STATS.cf3_pd_cd(N_IT+1)    = curr_cd.cf3_pd;                                    %(68)
 
 IT_STATS.cf3_pd_cr(N_IT+1)    = curr_cr.cf3_pd;                                    %(70)
 
 IT_STATS.cf3_pd_cd_s          = IT_STATS.cf3_pd_cd_s + IT_STATS.cf3_pd_cd(N_IT+1); %(72)
 
 IT_STATS.cf3_pd_cr_s          = IT_STATS.cf3_pd_cr_s + IT_STATS.cf3_pd_cr(N_IT+1); %(74)
 
 IT_STATS.cf3_pd_cd_m(N_IT+1)  = IT_STATS.cf3_pd_cd_s / (N_IT+1);                   %(76)
 
 IT_STATS.cf3_pd_cr_m(N_IT+1)  = IT_STATS.cf3_pd_cr_s / (N_IT+1);                   %(78)
 
 IT_STATS.cf3_pd_cd_dm2s       = IT_STATS.cf3_pd_cd_dm2s + ...
                                (IT_STATS.cf3_pd_cd(N_IT+1) - ...
                                 IT_STATS.cf3_pd_cd_m(N_IT+1))^2;                   %(80)
 
 IT_STATS.cf3_pd_cr_dm2s       = IT_STATS.cf3_pd_cr_dm2s + ...
                                (IT_STATS.cf3_pd_cr(N_IT+1) - ...
                                 IT_STATS.cf3_pd_cr_m(N_IT+1))^2;                   %(82)
 
 IT_STATS.cf3_pd_cd_sd(N_IT+1) = sqrt(IT_STATS.cf3_pd_cd_dm2s / (N_IT));            %(84)
 
 IT_STATS.cf3_pd_cr_sd(N_IT+1) = sqrt(IT_STATS.cf3_pd_cr_dm2s / (N_IT));            %(86)
 
 % ---- target p-distance -------------------------------------------
 
 IT_STATS.cf3_pd_trgt_cd(N_IT+1) = curr_cd.cf3_pd_trgt; %(88)
 
 IT_STATS.cf3_pd_trgt_cr(N_IT+1) = curr_cr.cf3_pd_trgt; %(90)
 
 % ---- distancing --------------------------------------------------
 
 IT_STATS.cf3_d_cd(N_IT+1)    = curr_cd.cf3_d;                                   %(92)
 
 IT_STATS.cf3_d_cr(N_IT+1)    = curr_cr.cf3_d;                                   %(94)
 
 IT_STATS.cf3_d_cd_s          = IT_STATS.cf3_d_cd_s + IT_STATS.cf3_d_cd(N_IT+1); %(96)
 
 IT_STATS.cf3_d_cr_s          = IT_STATS.cf3_d_cr_s + IT_STATS.cf3_d_cr(N_IT+1); %(98)
 
 IT_STATS.cf3_d_cd_m(N_IT+1)  = IT_STATS.cf3_d_cd_s / (N_IT+1);                  %(100)
 
 IT_STATS.cf3_d_cr_m(N_IT+1)  = IT_STATS.cf3_d_cr_s / (N_IT+1);                  %(102)
 
 IT_STATS.cf3_d_cd_dm2s       = IT_STATS.cf3_d_cd_dm2s + ...
                               (IT_STATS.cf3_d_cd(N_IT+1) - ...
                                IT_STATS.cf3_d_cd_m(N_IT+1))^2;                  %(104)
 
 IT_STATS.cf3_d_cr_dm2s       = IT_STATS.cf3_d_cr_dm2s + ...
                               (IT_STATS.cf3_d_cr(N_IT+1) - ...
                                IT_STATS.cf3_d_cr_m(N_IT+1))^2;                  %(106)
 
 IT_STATS.cf3_d_cd_sd(N_IT+1) = sqrt(IT_STATS.cf3_d_cd_dm2s / (N_IT));           %(108)
 
 IT_STATS.cf3_d_cr_sd(N_IT+1) = sqrt(IT_STATS.cf3_d_cr_dm2s / (N_IT));           %(110)
 
 % ---- target distancing -------------------------------------------
 
 IT_STATS.cf3_d_trgt_cd(N_IT+1) = curr_cd.cf3_d_trgt; %(112)
 
 IT_STATS.cf3_d_trgt_cr(N_IT+1) = curr_cr.cf3_d_trgt; %(114)
 
 % ---- distancing fixes --------------------------------------------
 
 %IT_STATS.cf3_df_cd(N_IT+1) = curr_cd.cf3_df; %(116)
 
 %IT_STATS.cf3_df_cr(N_IT+1) = curr_cr.cf3_df; %(118)
 
  % --- P and x stats ------------------------------------------------
 
 IT_STATS.p2need_cf3_s            = IT_STATS.p2need_cf3_s   + IT_STATS.p2need_cf3(N_IT+1);   %(120)
 IT_STATS.p2give_cf3_s            = IT_STATS.p2give_cf3_s   + IT_STATS.p2give_cf3(N_IT+1);   %(122)
 
 IT_STATS.p2need_cf3_x_s          = IT_STATS.p2need_cf3_x_s + IT_STATS.p2need_cf3_x(N_IT+1); %(124)
 IT_STATS.p2give_cf3_x_s          = IT_STATS.p2give_cf3_x_s + IT_STATS.p2give_cf3_x(N_IT+1); %(126)
  
 IT_STATS.p2need_cf3_m(N_IT+1)    = IT_STATS.p2need_cf3_s   / (N_IT+1);                      %(128)
 IT_STATS.p2give_cf3_m(N_IT+1)    = IT_STATS.p2give_cf3_s   / (N_IT+1);                      %(130)
 
 IT_STATS.p2need_cf3_x_m(N_IT+1)  = IT_STATS.p2need_cf3_x_s / (N_IT+1);                      %(132)
 IT_STATS.p2give_cf3_x_m(N_IT+1)  = IT_STATS.p2give_cf3_x_s / (N_IT+1);                      %(134)
 
 IT_STATS.p2need_cf3_dm2s         = IT_STATS.p2need_cf3_dm2s + ...
                                   (IT_STATS.p2need_cf3(N_IT+1) - ...
                                    IT_STATS.p2need_cf3_m(N_IT+1))^2;                        %(136)

 IT_STATS.p2give_cf3_dm2s         = IT_STATS.p2give_cf3_dm2s + ...
                                   (IT_STATS.p2give_cf3(N_IT+1) - ...
                                    IT_STATS.p2give_cf3_m(N_IT+1))^2;                        %(138)
 
 IT_STATS.p2need_cf3_x_dm2s       = IT_STATS.p2need_cf3_x_dm2s + ...
                                   (IT_STATS.p2need_cf3_x(N_IT+1) - ...
                                    IT_STATS.p2need_cf3_x_m(N_IT+1))^2;                      %(140)

 IT_STATS.p2give_cf3_x_dm2s       = IT_STATS.p2give_cf3_x_dm2s + ...
                                   (IT_STATS.p2give_cf3_x(N_IT+1) - ...
                                    IT_STATS.p2give_cf3_x_m(N_IT+1))^2;                      %(142)
 
 IT_STATS.p2need_cf3_sd(N_IT+1)   = sqrt(IT_STATS.p2need_cf3_dm2s   / (N_IT));               %(144)
 IT_STATS.p2give_cf3_sd(N_IT+1)   = sqrt(IT_STATS.p2give_cf3_dm2s   / (N_IT));               %(146)
 
 IT_STATS.p2need_cf3_x_sd(N_IT+1) = sqrt(IT_STATS.p2need_cf3_x_dm2s / (N_IT));               %(148)
 IT_STATS.p2give_cf3_x_sd(N_IT+1) = sqrt(IT_STATS.p2give_cf3_x_dm2s / (N_IT));               %(150)
 
 % --- percentages ----------
 
 IT_STATS.need4_cf3_pc    (N_IT+1) = 100 * IT_STATS.need4_cf3_cntr    (N_IT+1) / (N_IT+1); %(160)
 IT_STATS.need2give_cf3_pc(N_IT+1) = 100 * IT_STATS.need2give_cf3_cntr(N_IT+1) / (N_IT+1); %(162) 
 
% --- mean to target -------
 
 IT_STATS.cf3_pd_m2t_cd(N_IT+1) = IT_STATS.cf3_pd_cd_m(N_IT+1) - IT_STATS.cf3_pd_trgt_cd(N_IT+1); %(168)
 
 IT_STATS.cf3_pd_m2t_cr(N_IT+1) = IT_STATS.cf3_pd_cr_m(N_IT+1) - IT_STATS.cf3_pd_trgt_cr(N_IT+1); %(170)
 
 IT_STATS.cf3_d_m2t_cd (N_IT+1) = IT_STATS.cf3_d_cd_m (N_IT+1) - IT_STATS.cf3_d_trgt_cd (N_IT+1); %(172)
 
 IT_STATS.cf3_d_m2t_cr (N_IT+1) = IT_STATS.cf3_d_cr_m (N_IT+1) - IT_STATS.cf3_d_trgt_cr (N_IT+1); %(174)
 
 
 