%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf2 stats setup ---------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------      

global IT_STATS PRMS_ACLAB PRMS_C_CD PRMS_C_CR
 
 IT_STATS.p2need_cf2_x  = zeros(1,PRMS_ACLAB.tot_it+1);   %(6)
 IT_STATS.p2give_cf2_x  = zeros(1,PRMS_ACLAB.tot_it+1);   %(8) 
 IT_STATS.p2need_cf2_xf = zeros(1,PRMS_ACLAB.tot_it+1);   %(10)
 IT_STATS.p2give_cf2_xf = zeros(1,PRMS_ACLAB.tot_it+1);   %(12) 
 IT_STATS.p2need_cf2    = zeros(1,PRMS_ACLAB.tot_it+1);   %(14)
 IT_STATS.p2give_cf2    = zeros(1,PRMS_ACLAB.tot_it+1);   %(16) 

 IT_STATS.ad2_av        = zeros(1,PRMS_ACLAB.tot_it+1);   %(18) 
 
 IT_STATS.cf2_in        = zeros(1,PRMS_ACLAB.tot_it+1);   %(20) 
 
 % --- relevant events ----------------------------------------------
 
 IT_STATS.need4_cf2       = false(1,PRMS_ACLAB.tot_it+1); %(23) child need for cf2 (n4-event)
 IT_STATS.need2give_cf2   = false(1,PRMS_ACLAB.tot_it+1); %(25) caregiver needs to give cf2 (n2g-event)

 IT_STATS.n4_n2g_cf2    = zeros(1,PRMS_ACLAB.tot_it+1); %(27) cf2: child needs for, caregiver needs to give (n4_n2g-event)
 IT_STATS.n2g_n4_cf2    = zeros(1,PRMS_ACLAB.tot_it+1); %(29) cf2: caregiver needs to give, child needs for (n2g_n4-event)
 IT_STATS.n4_n2g_st_cf2 = zeros(1,PRMS_ACLAB.tot_it+1); %(31) cf2: child needs for, caregiver needs to give at same iteration (n4_n2g-event)
 
 IT_STATS.n4_nn2g_cf2   = zeros(1,PRMS_ACLAB.tot_it+1); %(33) cf2: child needs for, caregiver does not need to give (n4_nn2g-event)
 IT_STATS.n2g_nn4_cf2   = zeros(1,PRMS_ACLAB.tot_it+1); %(35) cf2: caregiver needs to give, child does not need for (n2g_nn4-event)

 % --- relevant event counters --------------------------------------
 
 IT_STATS.need4_cf2_cntr     = zeros(1,PRMS_ACLAB.tot_it+1); %(37) cf2: n4-events counter (n4-event   at it.n)
 IT_STATS.need2give_cf2_cntr = zeros(1,PRMS_ACLAB.tot_it+1); %(39) cf2: n2g-events counter (n2g-event at it.n)
 
 IT_STATS.n4_n2g_cf2_cntr    = zeros(1,PRMS_ACLAB.tot_it+1); %(41) cf2: n4_n2g-events counter (n4-event  at it.n - n2g-event at it. n+1)
 IT_STATS.n2g_n4_cf2_cntr    = zeros(1,PRMS_ACLAB.tot_it+1); %(43) cf2: n2g_n4-events counter (n2g-event at it.n - n4-event  at it. n+1)
 IT_STATS.n4_n2g_st_cf2_cntr = zeros(1,PRMS_ACLAB.tot_it+1); %(45) cf2: n4_n2g-events counter (n4-event  at it.n - n2g-event at it. n)
 
 IT_STATS.n4_nn2g_cf2_cntr   = zeros(1,PRMS_ACLAB.tot_it+1); %(47) cf2: n4_n2g-events counter (n4-event  at it.n - ng-event at it. n+1)
 IT_STATS.n2g_nn4_cf2_cntr   = zeros(1,PRMS_ACLAB.tot_it+1); %(49) cf2: n2g_n4-events counter (n2g-event at it.n - na-event at it. n+1)
 
 IT_STATS.no_cf2_cntr        = zeros(1,PRMS_ACLAB.tot_it+1); %(51) cf2: no care (needed4/needed2) iteration-counter
 
 IT_STATS.no_cf2_ntrs        = zeros(1,PRMS_ACLAB.tot_it+1); %(53) cf2: nomber of intervals of no care (needed4/needed2)

 IT_STATS.no_cf2_ls          = zeros(1,PRMS_ACLAB.tot_it+1); %(55) cf2: intervals of no care (needed4/needed2) length sum
 
 IT_STATS.no_cf2_m           = zeros(1,PRMS_ACLAB.tot_it+1); %(57) cf2: intervals of no care (needed4/needed2) mean-length
 
 IT_STATS.no_cf2_dm2s        = 0;                            %(59) cf2: sum of differences from mean squared (to calculate standard deviation)
 
 IT_STATS.no_cf2_sd          = zeros(1,PRMS_ACLAB.tot_it+1); %(61) cf2: intervals of no care (needed4/needed2) length standard deviation
 
 % ---- e-distance --------------------------------------------------
 
 IT_STATS.cf2_ed_cd      = zeros(1,PRMS_ACLAB.tot_it+1); %(67)
 
 IT_STATS.cf2_ed_cr      = zeros(1,PRMS_ACLAB.tot_it+1); %(69)
 
 IT_STATS.cf2_ed_cd_s    = 0;                            %(71)
 
 IT_STATS.cf2_ed_cr_s    = 0;                            %(73)
 
 IT_STATS.cf2_ed_cd_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(75)
 
 IT_STATS.cf2_ed_cr_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(77)
 
 IT_STATS.cf2_ed_cd_dm2s = 0;                            %(79)
 
 IT_STATS.cf2_ed_cr_dm2s = 0;                            %(81)
 
 IT_STATS.cf2_ed_cd_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(83)
 
 IT_STATS.cf2_ed_cr_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(85)
 
 % ---- target e-distance -------------------------------------------
 
 IT_STATS.cf2_ed_trgt_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(87)
 
 IT_STATS.cf2_ed_trgt_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(89)

 % ---- indifference ------------------------------------------------
 
 IT_STATS.cf2_i_cd      = zeros(1,PRMS_ACLAB.tot_it+1); %(91)
 
 IT_STATS.cf2_i_cr      = zeros(1,PRMS_ACLAB.tot_it+1); %(93)

 IT_STATS.cf2_i_cd_s    = 0;                            %(95)
 
 IT_STATS.cf2_i_cr_s    = 0;                            %(97)

 IT_STATS.cf2_i_cd_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(99)
 
 IT_STATS.cf2_i_cr_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(101)
 
 IT_STATS.cf2_i_cd_dm2s = 0;                            %(103)
 
 IT_STATS.cf2_i_cr_dm2s = 0;                            %(105)
 
 IT_STATS.cf2_i_cd_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(107)

 IT_STATS.cf2_i_cr_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(109)

 % ---- target indifference -----------------------------------------
 
 IT_STATS.cf2_i_trgt_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(111)
 
 IT_STATS.cf2_i_trgt_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(113)

 % ---- indifference ------------------------------------------------
 
 %IT_STATS.cf2_if_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(115)
 
 %IT_STATS.cf2_if_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(117)
 
 % --- P and x stats ------------------------------------------------
 
 IT_STATS.p2need_cf2_s     = 0;                             %(119)
 IT_STATS.p2give_cf2_s     = 0;                             %(121)

 IT_STATS.p2need_cf2_x_s   = 0;                             %(123)
 IT_STATS.p2give_cf2_x_s   = 0;                             %(125)
 
 IT_STATS.p2need_cf2_m     = zeros(1,PRMS_ACLAB.tot_it+1);  %(127)
 IT_STATS.p2give_cf2_m     = zeros(1,PRMS_ACLAB.tot_it+1);  %(129)
 
 IT_STATS.p2need_cf2_x_m   = zeros(1,PRMS_ACLAB.tot_it+1);  %(131)
 IT_STATS.p2give_cf2_x_m   = zeros(1,PRMS_ACLAB.tot_it+1);  %(133)
 
 IT_STATS.p2need_cf2_dm2s  = 0;                             %(135)
 IT_STATS.p2give_cf2_dm2s  = 0;                             %(137)
 
 IT_STATS.p2need_cf2_x_dm2s = 0;                            %(139)
 IT_STATS.p2give_cf2_x_dm2s = 0;                            %(141)
 
 IT_STATS.p2need_cf2_sd     = zeros(1,PRMS_ACLAB.tot_it+1); %(143)
 IT_STATS.p2give_cf2_sd     = zeros(1,PRMS_ACLAB.tot_it+1); %(145)

 IT_STATS.p2need_cf2_x_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(147)
 IT_STATS.p2give_cf2_x_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(149)
 
 % --- percentages ----------
 
 IT_STATS.need4_cf2_pc     = zeros(1,PRMS_ACLAB.tot_it+1); %(159) 
 IT_STATS.need2give_cf2_pc = zeros(1,PRMS_ACLAB.tot_it+1); %(161) 
 
 % --- mean to target -------
 
 IT_STATS.cf2_ed_m2t_cd = zeros(1,PRMS_ACLAB.tot_it+1);   %(167)
 
 IT_STATS.cf2_ed_m2t_cr = zeros(1,PRMS_ACLAB.tot_it+1);   %(169)
 
 IT_STATS.cf2_i_m2t_cd  = zeros(1,PRMS_ACLAB.tot_it+1);   %(171)

 IT_STATS.cf2_i_m2t_cr  = zeros(1,PRMS_ACLAB.tot_it+1);   %(173)
 
 % ------------------------------------------------------------------
 % ------------------------------------------------------------------
 % --- initialize first element (iteration zero) --------------------
 % ------------------------------------------------------------------
 % ------------------------------------------------------------------
 
 IT_STATS.p2need_cf2_x(1)  = PRMS_C_CD.p2need_cf2_x;          %(6)
 IT_STATS.p2give_cf2_x(1)  = PRMS_C_CR.p2give_cf2_x;          %(8)
 IT_STATS.p2need_cf2_xf(1) = PRMS_C_CD.p2need_cf2_xf;         %(10)
 IT_STATS.p2give_cf2_xf(1) = PRMS_C_CR.p2give_cf2_xf;         %(12)
 IT_STATS.p2need_cf2(1)    = PRMS_C_CD.p2need_cf2;%0.5;       %(14)
 IT_STATS.p2give_cf2(1)    = PRMS_C_CR.p2give_cf2;%0.5;       %(16)
 
 IT_STATS.ad2_av(1)        = PRMS_C_CD.ad2_av;                %(18)
 
 IT_STATS.cf2_in(1)        = PRMS_C_CR.cf2_in;                %(20)

 % --- relevant events ----------------------------------------------
                            
 IT_STATS.need4_cf2(1)     = 0; %(23)
 IT_STATS.need2give_cf2(1) = 0; %(25)
 IT_STATS.n4_n2g_cf2(1)    = 0; %(27)
 IT_STATS.n2g_n4_cf2(1)    = 0; %(29)
 IT_STATS.n4_n2g_st_cf2(1) = 0; %(31) 
 IT_STATS.n4_nn2g_cf2(1)   = 0; %(33)
 IT_STATS.n2g_nn4_cf2(1)   = 0; %(35)
 
 % --- relevant event counters --------------------------------------
 
 IT_STATS.need4_cf2_cntr(1)     = 0; %(37)
 IT_STATS.need2give_cf2_cntr(1) = 0; %(39)
 IT_STATS.n4_n2g_cf2_cntr(1)    = 0; %(41)
 IT_STATS.n2g_n4_cf2_cntr(1)    = 0; %(43)
 IT_STATS.n4_n2g_st_cf2_cntr(1) = 0; %(45)
 IT_STATS.n4_nn2g_cf2_cntr(1)   = 0; %(47)
 IT_STATS.n2g_nn4_cf2_cntr(1)   = 0; %(49)

 IT_STATS.no_cf2_cntr(1) = 0; %(51)
 
 IT_STATS.no_cf2_ntrs(1) = 0; %(53)

 IT_STATS.no_cf2_ls(1)   = 0; %(55)
 
 IT_STATS.no_cf2_m(1)    = 0; %(57) 
 
 IT_STATS.no_cf2_dm2s    = 0; %(59) 
 
 IT_STATS.no_cf2_sd(1)   = 0; %(61) 
 
 % ---- e-distance --------------------------------------------------
 
 IT_STATS.cf2_ed_cd(1)    = PRMS_C_CD.cf2_ed; %(67)
 
 IT_STATS.cf2_ed_cr(1)    = PRMS_C_CR.cf2_ed; %(69)
 
 IT_STATS.cf2_ed_cd_s     = PRMS_C_CD.cf2_ed; %(71)
 
 IT_STATS.cf2_ed_cr_s     = PRMS_C_CR.cf2_ed; %(73)

 IT_STATS.cf2_ed_cd_m(1)  = PRMS_C_CD.cf2_ed; %(75)
 
 IT_STATS.cf2_ed_cd_dm2s  = 0;                %(77)
 
 IT_STATS.cf2_ed_cd_sd(1) = 0;                %(79)

 IT_STATS.cf2_ed_cr_m(1)  = PRMS_C_CR.cf2_ed; %(81)
 
 IT_STATS.cf2_ed_cr_dm2s  = 0;                %(83)
 
 IT_STATS.cf2_ed_cr_sd(1) = 0;                %(85)
 
 % ---- target e-distance -------------------------------------------
 
 IT_STATS.cf2_ed_trgt_cd(1) = PRMS_C_CD.cf2_ed_trgt; %(87)
 
 IT_STATS.cf2_ed_trgt_cr(1) = PRMS_C_CR.cf2_ed_trgt; %(89)
 
 % ---- indifference ------------------------------------------------

 IT_STATS.cf2_i_cd(1)   = PRMS_C_CD.cf2_i;  %(91)

 IT_STATS.cf2_i_cr(1)   = PRMS_C_CR.cf2_i;  %(93)
 
 IT_STATS.cf2_i_cd_s    = PRMS_C_CD.cf2_i;  %(95)
 
 IT_STATS.cf2_i_cr_s    = PRMS_C_CR.cf2_i;  %(97)
 
 IT_STATS.cf2_i_cd_m(1) = PRMS_C_CD.cf2_i;  %(99)

 IT_STATS.cf2_i_cd_dm2s = 0;                %(101)
 
 IT_STATS.cf2_i_cd_sd(1) = 0;               %(103)
 
 IT_STATS.cf2_i_cr_m(1)  = PRMS_C_CR.cf2_i; %(105)
 
 IT_STATS.cf2_i_cr_dm2s  = 0;               %(107)
 
 IT_STATS.cf2_i_cr_sd(1) = 0;               %(109)

 % ---- target indifference -----------------------------------------
 
 IT_STATS.cf2_i_trgt_cd(1) = PRMS_C_CD.cf2_i_trgt; %(111)
 
 IT_STATS.cf2_i_trgt_cr(1) = PRMS_C_CR.cf2_i_trgt; %(113)
 
 % ---- indifference fixes ------------------------------------------
 
 %IT_STATS.cf2_if_cd(1) = PRMS_C_CD.cf2_if; %(115)
 
 %IT_STATS.cf2_if_cr(1) = PRMS_C_CR.cf2_if; %(117)
 
 % ---- indifference fixes ------------------------------------------
      
 IT_STATS.p2need_cf2_s       = PRMS_C_CD.p2need_cf2;  %(119)
 IT_STATS.p2give_cf2_s       = PRMS_C_CR.p2give_cf2;  %(121)
 
 IT_STATS.p2need_cf2_x_s     = PRMS_C_CD.p2need_cf2_x; %(123)
 
 IT_STATS.p2give_cf2_x_s     = PRMS_C_CR.p2give_cf2_x; %(125)
 
 IT_STATS.p2need_cf2_m(1)    = PRMS_C_CD.p2need_cf2;   %(127)
 IT_STATS.p2give_cf2_m(1)    = PRMS_C_CR.p2give_cf2;   %(129)
 
 IT_STATS.p2need_cf2_dm2s    = 0;                      %(131)
 IT_STATS.p2give_cf2_dm2s    = 0;                      %(133)
 
 IT_STATS.p2need_cf2_sd(1)   = 0;                      %(135)
 IT_STATS.p2give_cf2_sd(1)   = 0;                      %(137)
 
 IT_STATS.p2need_cf2_x_m(1)  = PRMS_C_CD.p2need_cf2_x; %(139)
 IT_STATS.p2give_cf2_x_m(1)  = PRMS_C_CR.p2give_cf2_x; %(141)
 
 IT_STATS.p2need_cf2_x_dm2s  = 0;                      %(143)
 IT_STATS.p2give_cf2_x_dm2s  = 0;                      %(145)
 
 IT_STATS.p2need_cf2_x_sd(1) = 0;                      %(147)
 IT_STATS.p2give_cf2_x_sd(1) = 0;                      %(149)

 % --- percentages ----------
 
 if IT_STATS.need4_cf2(1)
     IT_STATS.need4_cf2_pc(1)     = 100; %(159) 
 end
 
 if IT_STATS.need2give_cf2(1)
     IT_STATS.need2give_cf2_pc(1) = 100; %(161) 
 end
 
 % --- mean to target -------
 
 IT_STATS.cf2_ed_m2t_cd(1) = IT_STATS.cf2_ed_cd_m(1) - IT_STATS.cf2_ed_trgt_cd(1); %(167)
 
 IT_STATS.cf2_ed_m2t_cr(1) = IT_STATS.cf2_ed_cr_m(1) - IT_STATS.cf2_ed_trgt_cr(1); %(169)
 
 IT_STATS.cf2_i_m2t_cd(1)  = IT_STATS.cf2_i_cd_m(1) - IT_STATS.cf2_i_trgt_cd(1);   %(171)
 
 IT_STATS.cf2_i_m2t_cr(1)  = IT_STATS.cf2_i_cr_m(1) - IT_STATS.cf2_i_trgt_cr(1);   %(173)
 