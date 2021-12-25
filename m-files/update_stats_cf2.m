%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf2 stats update --------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global IT_STATS N_IT

 IT_STATS.p2need_cf2_x(N_IT+1)   = curr_cd.p2need_cf2_x;         %(6)
 IT_STATS.p2give_cf2_x(N_IT+1)   = curr_cr.p2give_cf2_x;         %(8)
 IT_STATS.p2need_cf2_xf(N_IT+1)  = curr_cd.p2need_cf2_xf;        %(10)
 IT_STATS.p2give_cf2_xf(N_IT+1)  = curr_cr.p2give_cf2_xf;        %(12)
 IT_STATS.p2need_cf2(N_IT+1)     = curr_cd.p2need_cf2;           %(14)
 IT_STATS.p2give_cf2(N_IT+1)     = curr_cr.p2give_cf2;           %(16)
 
 IT_STATS.ad2_av    (N_IT+1)     = curr_cd.iwm.ad2_av;           %(18)
 
 IT_STATS.cf2_in    (N_IT+1)     = curr_cr.iwm.cf2_in;           %(20)
                                                                                      
 last_need4_cf2     = IT_STATS.need4_cf2    (N_IT);
 last_need2give_cf2 = IT_STATS.need2give_cf2(N_IT);
 
 curr_need4_cf2     = curr_cd.need4_cf2;
 curr_need2give_cf2 = curr_cr.need2give_cf2;
 
 % --- relevant events ----------------------------------------------
 
 IT_STATS.need4_cf2      (N_IT+1) = curr_need4_cf2;     %(23)
 IT_STATS.need2give_cf2  (N_IT+1) = curr_need2give_cf2; %(25)
                                     
 IT_STATS.n4_n2g_cf2   (N_IT+1) = 0; %(27) cf2: child needs for, caregiver needs to give (n4_n2n2g-event)
 IT_STATS.n2g_n4_cf2   (N_IT+1) = 0; %(29) cf2: caregiver needs to give, child needs for (n2_gn4-event)
 IT_STATS.n4_n2g_st_cf2(N_IT+1) = 0; %(31) cf2: child needs for, caregiver needs to give at same iteration (n4_n2n2g-event) 
 
 IT_STATS.n4_nn2g_cf2  (N_IT+1) = 0; %(33) cf2: child needs for, caregiver does not need to give (n4_nn2n2g-event)
 IT_STATS.n2g_nn4_cf2  (N_IT+1) = 0; %(35) cf2: caregiver needs to give, child does not need for (n2g_nn4-event)
 
 % --- relevant event counters --------------------------------------
 
 IT_STATS.need4_cf2_cntr    (N_IT+1) = IT_STATS.need4_cf2_cntr    (N_IT); %(37) cf2: n4-events  counter (n4-event  at it.n+1)
 IT_STATS.need2give_cf2_cntr(N_IT+1) = IT_STATS.need2give_cf2_cntr(N_IT); %(39) cf2: n2g-events counter (n2g-event at it.n+1)
 
 IT_STATS.n4_n2g_cf2_cntr   (N_IT+1) = IT_STATS.n4_n2g_cf2_cntr   (N_IT); %(41) cf2: n4_n2g-events counter (n4-event  at it.n - n2g-event at it. n+1)
 IT_STATS.n2g_n4_cf2_cntr   (N_IT+1) = IT_STATS.n2g_n4_cf2_cntr   (N_IT); %(43) cf2: n2g_n4-events counter (n2g-event at it.n - n4-event  at it. n+1)
 
 IT_STATS.n4_n2g_st_cf2_cntr(N_IT+1) = IT_STATS.n4_n2g_st_cf2_cntr(N_IT); %(45) cf2: n4_n2g-events counter (n4-event at it.n+1 - n2g-event at it. n+1)
 
 IT_STATS.n4_nn2g_cf2_cntr  (N_IT+1) = IT_STATS.n4_nn2g_cf2_cntr  (N_IT); %(47) cf2: n4_nn2g-events counter (n4-event  at it.n - nn2g-event at it. n+1)
 IT_STATS.n2g_nn4_cf2_cntr  (N_IT+1) = IT_STATS.n2g_nn4_cf2_cntr  (N_IT); %(49) cf2: n2g_nn4-events counter (n2g-event at it.n - nn4-event  at it. n+1)
  
 % --- update counters --------------------------
 if curr_need4_cf2
     IT_STATS.need4_cf2_cntr(N_IT+1) = IT_STATS.need4_cf2_cntr(N_IT) + 1;         %(37)
 end
 
 if curr_need2give_cf2
     IT_STATS.need2give_cf2_cntr(N_IT+1) = IT_STATS.need2give_cf2_cntr(N_IT) + 1; %(39)
 end
 
 % --- update events & counters -----------------
 if last_need4_cf2 && curr_need2give_cf2
     IT_STATS.n4_n2g_cf2     (N_IT+1) = 1;                                        %(27)
     IT_STATS.n4_n2g_cf2_cntr(N_IT+1) = IT_STATS.n4_n2g_cf2_cntr(N_IT) + 1;       %(41)
 end
 
 if last_need2give_cf2 && curr_need4_cf2
     IT_STATS.n2g_n4_cf2     (N_IT+1) = 1;                                        %(29)
     IT_STATS.n2g_n4_cf2_cntr(N_IT+1) = IT_STATS.n2g_n4_cf2_cntr(N_IT) + 1;       %(43)
 end
 
 % --- update counters --------------------------
 if curr_need4_cf2 && curr_need2give_cf2
     IT_STATS.n4_n2g_st_cf2     (N_IT+1) = 1;                                     %(31)
     IT_STATS.n4_n2g_st_cf2_cntr(N_IT+1) = IT_STATS.n4_n2g_st_cf2_cntr(N_IT) + 1; %(45)
 end
 
 % --- update events & counters -----------------
 if last_need4_cf2 && ~curr_need2give_cf2
     IT_STATS.n4_nn2g_cf2     (N_IT+1) = 1;                                       %(33)
     IT_STATS.n4_nn2g_cf2_cntr(N_IT+1) = IT_STATS.n4_nn2g_cf2_cntr(N_IT) + 1;     %(47)
 end
 
 if last_need2give_cf2 && ~curr_need4_cf2
     IT_STATS.n2g_nn4_cf2     (N_IT+1) = 1;                                       %(35)
     IT_STATS.n2g_nn4_cf2_cntr(N_IT+1) = IT_STATS.n2g_nn4_cf2_cntr(N_IT) + 1;     %(49)
 end
 
 % --- update counters --------------------------
 IT_STATS.no_cf2_cntr (N_IT+1) = curr_cd.no_cf2_cntr; %(51) cf2: no care received/given iteration-counter
 
 % --- mean values ------------------------------
 if IT_STATS.no_cf2_cntr (N_IT+1) == 1
     IT_STATS.no_cf2_ntrs(N_IT+1) = IT_STATS.no_cf2_ntrs(N_IT) + 1; %(53) cf2: nomber of intervals of no care
 else
     IT_STATS.no_cf2_ntrs(N_IT+1) = IT_STATS.no_cf2_ntrs(N_IT);     %(53) cf2: nomber of intervals of no care
 end
 
 % ----------------------------------------------    
 if IT_STATS.no_cf2_cntr (N_IT+1) >= 1
     IT_STATS.no_cf2_ls(N_IT+1) = IT_STATS.no_cf2_ls(N_IT) + 1; %(55) cf2: intervals of no care length sum
 else
     IT_STATS.no_cf2_ls(N_IT+1) = IT_STATS.no_cf2_ls(N_IT);     %(55) cf2: intervals of no care length sum
 end 
 
 % ----------------------------------------------
 if IT_STATS.no_cf2_ntrs(N_IT+1) > 0
     IT_STATS.no_cf2_m(N_IT+1) = IT_STATS.no_cf2_ls(N_IT+1) / IT_STATS.no_cf2_ntrs(N_IT+1); %(57) cf2: intervals of no care mean-length
 else
     IT_STATS.no_cf2_m(N_IT+1) = 0;
 end
 
 % --- standard deviations ----------------------
 
 IT_STATS.no_cf2_dm2s       = IT_STATS.no_cf2_dm2s + ...
                             (IT_STATS.no_cf2_cntr(N_IT+1) - ...
                              IT_STATS.no_cf2_m(N_IT+1))^2;        %(59)
 
 IT_STATS.no_cf2_sd(N_IT+1) = sqrt(IT_STATS.no_cf2_dm2s / (N_IT)); %(61)
 
 % ---- e-distance --------------------------------------------------
 
 IT_STATS.cf2_ed_cd(N_IT+1)    = curr_cd.cf2_ed;                                    %(67)
 
 IT_STATS.cf2_ed_cr(N_IT+1)    = curr_cr.cf2_ed;                                    %(69)
 
 IT_STATS.cf2_ed_cd_s          = IT_STATS.cf2_ed_cd_s + IT_STATS.cf2_ed_cd(N_IT+1); %(71)
 
 IT_STATS.cf2_ed_cr_s          = IT_STATS.cf2_ed_cr_s + IT_STATS.cf2_ed_cr(N_IT+1); %(73)
 
 IT_STATS.cf2_ed_cd_m(N_IT+1)  = IT_STATS.cf2_ed_cd_s / (N_IT+1);                   %(75)
 
 IT_STATS.cf2_ed_cr_m(N_IT+1)  = IT_STATS.cf2_ed_cr_s / (N_IT+1);                   %(77)
 
 IT_STATS.cf2_ed_cd_dm2s       = IT_STATS.cf2_ed_cd_dm2s + ...
                                (IT_STATS.cf2_ed_cd(N_IT+1) - ...
                                 IT_STATS.cf2_ed_cd_m(N_IT+1))^2;                   %(79)

 IT_STATS.cf2_ed_cr_dm2s       = IT_STATS.cf2_ed_cr_dm2s + ...
                                (IT_STATS.cf2_ed_cr(N_IT+1) - ...
                                 IT_STATS.cf2_ed_cr_m(N_IT+1))^2;                   %(81)
 
 IT_STATS.cf2_ed_cd_sd(N_IT+1) = sqrt(IT_STATS.cf2_ed_cd_dm2s / (N_IT));            %(83)
 
 IT_STATS.cf2_ed_cr_sd(N_IT+1) = sqrt(IT_STATS.cf2_ed_cr_dm2s / (N_IT));            %(85)
 
 % ---- target e-distance -------------------------------------------
 
 IT_STATS.cf2_ed_trgt_cd(N_IT+1) = curr_cd.cf2_ed_trgt; %(87)
 
 IT_STATS.cf2_ed_trgt_cr(N_IT+1) = curr_cr.cf2_ed_trgt; %(89)
 
 % ---- indifference ------------------------------------------------
 
 IT_STATS.cf2_i_cd(N_IT+1)    = curr_cd.cf2_i;                                   %(91)
 
 IT_STATS.cf2_i_cr(N_IT+1)    = curr_cr.cf2_i;                                   %(93)
 
 IT_STATS.cf2_i_cd_s          = IT_STATS.cf2_i_cd_s + IT_STATS.cf2_i_cd(N_IT+1); %(95)

 IT_STATS.cf2_i_cr_s          = IT_STATS.cf2_i_cr_s + IT_STATS.cf2_i_cr(N_IT+1); %(97)
 
 IT_STATS.cf2_i_cd_m(N_IT+1)  = IT_STATS.cf2_i_cd_s / (N_IT+1);                  %(99)
 
 IT_STATS.cf2_i_cr_m(N_IT+1)  = IT_STATS.cf2_i_cr_s / (N_IT+1);                  %(101)
 
 IT_STATS.cf2_i_cd_dm2s       = IT_STATS.cf2_i_cd_dm2s + ...
                               (IT_STATS.cf2_i_cd(N_IT+1) - ...
                                IT_STATS.cf2_i_cd_m(N_IT+1))^2;                  %(103)

 IT_STATS.cf2_i_cr_dm2s       = IT_STATS.cf2_i_cr_dm2s + ...
                               (IT_STATS.cf2_i_cr(N_IT+1) - ...
                                IT_STATS.cf2_i_cr_m(N_IT+1))^2;                  %(105)
 
 IT_STATS.cf2_i_cd_sd(N_IT+1) = sqrt(IT_STATS.cf2_i_cd_dm2s / (N_IT));           %(107)
 
 IT_STATS.cf2_i_cr_sd(N_IT+1) = sqrt(IT_STATS.cf2_i_cr_dm2s / (N_IT));           %(109)
 
 % ---- target indifference -----------------------------------------
 
 IT_STATS.cf2_i_trgt_cd(N_IT+1) = curr_cd.cf2_i_trgt; %(111)
 
 IT_STATS.cf2_i_trgt_cr(N_IT+1) = curr_cr.cf2_i_trgt; %(113)
 
 % ---- indifference ------------------------------------------------
 
 %IT_STATS.cf2_if_cd(N_IT+1) = curr_cd.cf2_if; %(115)
 
 %IT_STATS.cf2_if_cr(N_IT+1) = curr_cr.cf2_if; %(117)
 
  % --- P and x stats ------------------------------------------------
 
 IT_STATS.p2need_cf2_s            = IT_STATS.p2need_cf2_s   + IT_STATS.p2need_cf2(N_IT+1);   %(119)
 IT_STATS.p2give_cf2_s            = IT_STATS.p2give_cf2_s   + IT_STATS.p2give_cf2(N_IT+1);   %(121)
 
 IT_STATS.p2need_cf2_x_s          = IT_STATS.p2need_cf2_x_s + IT_STATS.p2need_cf2_x(N_IT+1); %(123)
 IT_STATS.p2give_cf2_x_s          = IT_STATS.p2give_cf2_x_s + IT_STATS.p2give_cf2_x(N_IT+1); %(125)
  
 IT_STATS.p2need_cf2_m(N_IT+1)    = IT_STATS.p2need_cf2_s   / (N_IT+1);                      %(127)
 IT_STATS.p2give_cf2_m(N_IT+1)    = IT_STATS.p2give_cf2_s   / (N_IT+1);                      %(129)
 
 IT_STATS.p2need_cf2_x_m(N_IT+1)  = IT_STATS.p2need_cf2_x_s / (N_IT+1);                      %(131)
 IT_STATS.p2give_cf2_x_m(N_IT+1)  = IT_STATS.p2give_cf2_x_s / (N_IT+1);                      %(133)
 
 IT_STATS.p2need_cf2_dm2s         = IT_STATS.p2need_cf2_dm2s + ...
                                   (IT_STATS.p2need_cf2(N_IT+1) - ...
                                    IT_STATS.p2need_cf2_m(N_IT+1))^2;                        %(135)
 
 IT_STATS.p2give_cf2_dm2s         = IT_STATS.p2give_cf2_dm2s + ...
                                   (IT_STATS.p2give_cf2(N_IT+1) - ...
                                    IT_STATS.p2give_cf2_m(N_IT+1))^2;                        %(137)
 
 IT_STATS.p2need_cf2_x_dm2s       = IT_STATS.p2need_cf2_x_dm2s + ...
                                   (IT_STATS.p2need_cf2_x(N_IT+1) - ...
                                    IT_STATS.p2need_cf2_x_m(N_IT+1))^2;                      %(139)

 IT_STATS.p2give_cf2_x_dm2s       = IT_STATS.p2give_cf2_x_dm2s + ...
                                   (IT_STATS.p2give_cf2_x(N_IT+1) - ...
                                    IT_STATS.p2give_cf2_x_m(N_IT+1))^2;                      %(141)
 
 IT_STATS.p2need_cf2_sd(N_IT+1)   = sqrt(IT_STATS.p2need_cf2_dm2s   / (N_IT));               %(143)
 IT_STATS.p2give_cf2_sd(N_IT+1)   = sqrt(IT_STATS.p2give_cf2_dm2s   / (N_IT));               %(145)
 
 IT_STATS.p2need_cf2_x_sd(N_IT+1) = sqrt(IT_STATS.p2need_cf2_x_dm2s / (N_IT));               %(147)
 IT_STATS.p2give_cf2_x_sd(N_IT+1) = sqrt(IT_STATS.p2give_cf2_x_dm2s / (N_IT));               %(149)
  
 % --- percentages ----------
 
 IT_STATS.need4_cf2_pc    (N_IT+1) = 100 * IT_STATS.need4_cf2_cntr    (N_IT+1) / (N_IT+1); %(159) 
 IT_STATS.need2give_cf2_pc(N_IT+1) = 100 * IT_STATS.need2give_cf2_cntr(N_IT+1) / (N_IT+1); %(161) 
 
% --- mean to target -------
 
 IT_STATS.cf2_ed_m2t_cd(N_IT+1) = IT_STATS.cf2_ed_cd_m(N_IT+1) - IT_STATS.cf2_ed_trgt_cd(N_IT+1); %(167)
 
 IT_STATS.cf2_ed_m2t_cr(N_IT+1) = IT_STATS.cf2_ed_cr_m(N_IT+1) - IT_STATS.cf2_ed_trgt_cr(N_IT+1); %(169)
 
 IT_STATS.cf2_i_m2t_cd (N_IT+1) = IT_STATS.cf2_i_cd_m (N_IT+1) - IT_STATS.cf2_i_trgt_cd (N_IT+1); %(171)
 
 IT_STATS.cf2_i_m2t_cr (N_IT+1) = IT_STATS.cf2_i_cr_m (N_IT+1) - IT_STATS.cf2_i_trgt_cr (N_IT+1); %(173)
 
 
 