%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf3 stats setup ---------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global IT_STATS PRMS_ACLAB PRMS_C_CD PRMS_C_CR
 
 IT_STATS.p2need_cf3_x  = zeros(1,PRMS_ACLAB.tot_it+1);   %(7)   
 IT_STATS.p2give_cf3_x  = zeros(1,PRMS_ACLAB.tot_it+1);   %(9) 
 IT_STATS.p2need_cf3_xf = zeros(1,PRMS_ACLAB.tot_it+1);   %(11)   
 IT_STATS.p2give_cf3_xf = zeros(1,PRMS_ACLAB.tot_it+1);   %(13)
 IT_STATS.p2need_cf3    = zeros(1,PRMS_ACLAB.tot_it+1);   %(15)   
 IT_STATS.p2give_cf3    = zeros(1,PRMS_ACLAB.tot_it+1);   %(17)
 
 IT_STATS.ad3_am        = zeros(1,PRMS_ACLAB.tot_it+1);   %(19) 
 
 IT_STATS.cf3_un        = zeros(1,PRMS_ACLAB.tot_it+1);   %(21) 
 
 % --- relevant events ----------------------------------------------
 
 IT_STATS.need4_cf3       = false(1,PRMS_ACLAB.tot_it+1); %(24) child need for cf3 (n4-event)
 IT_STATS.need2give_cf3   = false(1,PRMS_ACLAB.tot_it+1); %(26) caregiver needs to give cf3 (n2g-event)

 IT_STATS.n4_n2g_cf3    = zeros(1,PRMS_ACLAB.tot_it+1); %(28) cf3: child needs for, caregiver needs to give (n4_n2g-event)
 IT_STATS.n2g_n4_cf3    = zeros(1,PRMS_ACLAB.tot_it+1); %(30) cf3: caregiver needs to give, child needs for (n2g_n4-event)
 IT_STATS.n4_n2g_st_cf3 = zeros(1,PRMS_ACLAB.tot_it+1); %(32) cf3: child needs for, caregiver needs to give at same iteration (n4_n2g-event)
 
 IT_STATS.n4_nn2g_cf3   = zeros(1,PRMS_ACLAB.tot_it+1); %(34) cf3: child needs for, caregiver does not need to give (n4_nn2g-event)
 IT_STATS.n2g_nn4_cf3   = zeros(1,PRMS_ACLAB.tot_it+1); %(36) cf3: caregiver needs to give, child does not need for (n2g_nn4-event)

 % --- relevant event counters --------------------------------------
 
 IT_STATS.need4_cf3_cntr     = zeros(1,PRMS_ACLAB.tot_it+1); %(38) cf3: n4-events counter (n4-event   at it.n)
 IT_STATS.need2give_cf3_cntr = zeros(1,PRMS_ACLAB.tot_it+1); %(40) cf3: n2g-events counter (n2g-event at it.n)
 
 IT_STATS.n4_n2g_cf3_cntr    = zeros(1,PRMS_ACLAB.tot_it+1); %(42) cf3: n4_n2g-events counter (n4-event  at it.n - n2g-event at it. n+1)
 IT_STATS.n2g_n4_cf3_cntr    = zeros(1,PRMS_ACLAB.tot_it+1); %(44) cf3: n2g_n4-events counter (n2g-event at it.n - n4-event  at it. n+1)
 IT_STATS.n4_n2g_st_cf3_cntr = zeros(1,PRMS_ACLAB.tot_it+1); %(46) cf3: n4_n2g-events counter (n4-event  at it.n - n2g-event at it. n)
 
 IT_STATS.n4_nn2g_cf3_cntr   = zeros(1,PRMS_ACLAB.tot_it+1); %(48) cf3: n4_n2g-events counter (n4-event  at it.n - ng-event at it. n+1)
 IT_STATS.n2g_nn4_cf3_cntr   = zeros(1,PRMS_ACLAB.tot_it+1); %(50) cf3: n2g_n4-events counter (n2g-event at it.n - na-event at it. n+1)
 
 IT_STATS.no_cf3_cntr        = zeros(1,PRMS_ACLAB.tot_it+1); %(52) cf3: no care (needed4/needed2) iteration-counter
 
 IT_STATS.no_cf3_ntrs        = zeros(1,PRMS_ACLAB.tot_it+1); %(54) cf3: nomber of intervals of no care (needed4/needed2)

 IT_STATS.no_cf3_ls          = zeros(1,PRMS_ACLAB.tot_it+1); %(56) cf3: intervals of no care (needed4/needed2) length sum
 
 IT_STATS.no_cf3_m           = zeros(1,PRMS_ACLAB.tot_it+1); %(58) cf3: intervals of no care (needed4/needed2) mean-length
 
 IT_STATS.no_cf3_dm2s        = 0;                            %(60) cf3: sum of differences from mean squared (to calculate standard deviation)
 
 IT_STATS.no_cf3_sd          = zeros(1,PRMS_ACLAB.tot_it+1); %(62) cf3: intervals of no care (needed4/needed2) length standard deviation
 
 % ---- p-distance --------------------------------------------------
 
 IT_STATS.cf3_pd_cd      = zeros(1,PRMS_ACLAB.tot_it+1); %(68)
 
 IT_STATS.cf3_pd_cr      = zeros(1,PRMS_ACLAB.tot_it+1); %(70)
 
 IT_STATS.cf3_pd_cd_s    = 0;                            %(72)
 
 IT_STATS.cf3_pd_cr_s    = 0;                            %(74)
 
 IT_STATS.cf3_pd_cd_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(76)
 
 IT_STATS.cf3_pd_cr_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(78)
 
 IT_STATS.cf3_pd_cd_dm2s = 0;                            %(80)
 
 IT_STATS.cf3_pd_cr_dm2s = 0;                            %(82)
 
 IT_STATS.cf3_pd_cd_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(84)
 
 IT_STATS.cf3_pd_cr_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(86)
 
 % ---- target p-distance -------------------------------------------
 
 IT_STATS.cf3_pd_trgt_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(88)
 
 IT_STATS.cf3_pd_trgt_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(90)

 % ---- distancing --------------------------------------------------
 
 IT_STATS.cf3_d_cd      = zeros(1,PRMS_ACLAB.tot_it+1); %(92)
 
 IT_STATS.cf3_d_cr      = zeros(1,PRMS_ACLAB.tot_it+1); %(94)
 
 IT_STATS.cf3_d_cd_s    = 0;                            %(96)
 
 IT_STATS.cf3_d_cr_s    = 0;                            %(98)
 
 IT_STATS.cf3_d_cd_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(100)
 
 IT_STATS.cf3_d_cr_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(102)
 
 IT_STATS.cf3_d_cd_dm2s = 0;                            %(104)
 
 IT_STATS.cf3_d_cr_dm2s = 0;                            %(106)
 
 IT_STATS.cf3_d_cd_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(108)
 
 IT_STATS.cf3_d_cr_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(110)
 
 % ---- target distancing -------------------------------------------
 
 IT_STATS.cf3_d_trgt_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(112)
 
 IT_STATS.cf3_d_trgt_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(114)
 
 % ---- distancing fixes --------------------------------------------
 
 %IT_STATS.cf3_df_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(116)
 
 %IT_STATS.cf3_df_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(118)
 
 % --- P and x stats ------------------------------------------------
 
 IT_STATS.p2need_cf3_s     = 0;                             %(120)
 IT_STATS.p2give_cf3_s     = 0;                             %(122)
 
 IT_STATS.p2need_cf3_x_s   = 0;                             %(124)
 IT_STATS.p2give_cf3_x_s   = 0;                             %(126)
 
 IT_STATS.p2need_cf3_m     = zeros(1,PRMS_ACLAB.tot_it+1);  %(128)
 IT_STATS.p2give_cf3_m     = zeros(1,PRMS_ACLAB.tot_it+1);  %(130)
 
 IT_STATS.p2need_cf3_x_m   = zeros(1,PRMS_ACLAB.tot_it+1);  %(132) 
 IT_STATS.p2give_cf3_x_m   = zeros(1,PRMS_ACLAB.tot_it+1);  %(134)
 
 IT_STATS.p2need_cf3_dm2s  = 0;                             %(136)
 IT_STATS.p2give_cf3_dm2s  = 0;                             %(138)
 
 IT_STATS.p2need_cf3_x_dm2s = 0;                            %(140) 
 IT_STATS.p2give_cf3_x_dm2s = 0;                            %(142)
 
 IT_STATS.p2need_cf3_sd     = zeros(1,PRMS_ACLAB.tot_it+1); %(144)
 IT_STATS.p2give_cf3_sd     = zeros(1,PRMS_ACLAB.tot_it+1); %(146)
 
 IT_STATS.p2need_cf3_x_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(148) 
 IT_STATS.p2give_cf3_x_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(150)
 
 % --- percentages ----------
 
 IT_STATS.need4_cf3_pc     = zeros(1,PRMS_ACLAB.tot_it+1); %(160)
 IT_STATS.need2give_cf3_pc = zeros(1,PRMS_ACLAB.tot_it+1); %(162) 
 
 % --- mean to target -------
 
 IT_STATS.cf3_pd_m2t_cd = zeros(1,PRMS_ACLAB.tot_it+1);   %(168)
 
 IT_STATS.cf3_pd_m2t_cr = zeros(1,PRMS_ACLAB.tot_it+1);   %(170)
 
 IT_STATS.cf3_d_m2t_cd  = zeros(1,PRMS_ACLAB.tot_it+1);   %(172)
 
 IT_STATS.cf3_d_m2t_cr  = zeros(1,PRMS_ACLAB.tot_it+1);   %(174)
  
 % ------------------------------------------------------------------
 % ------------------------------------------------------------------
 % --- initialize first element (iteration zero) --------------------
 % ------------------------------------------------------------------
 % ------------------------------------------------------------------
 
 IT_STATS.p2need_cf3_x(1)  = PRMS_C_CD.p2need_cf3_x;          %(7)
 IT_STATS.p2give_cf3_x(1)  = PRMS_C_CR.p2give_cf3_x;          %(9) 
 IT_STATS.p2need_cf3_xf(1) = PRMS_C_CD.p2need_cf3_xf;         %(11)
 IT_STATS.p2give_cf3_xf(1) = PRMS_C_CR.p2give_cf3_xf;         %(13)
 IT_STATS.p2need_cf3(1)    = PRMS_C_CD.p2need_cf3;%0.5;       %(15)
 IT_STATS.p2give_cf3(1)    = PRMS_C_CR.p2give_cf3;%0.5;       %(17)

 IT_STATS.ad3_am(1)        = PRMS_C_CD.ad3_am;                %(19)

 IT_STATS.cf3_un(1)        = PRMS_C_CR.cf3_un;                %(21)
                               
 % --- relevant events ----------------------------------------------
                           
 IT_STATS.need4_cf3(1)     = 0; %(24)
 IT_STATS.need2give_cf3(1) = 0; %(26)
 IT_STATS.n4_n2g_cf3(1)    = 0; %(28)
 IT_STATS.n2g_n4_cf3(1)    = 0; %(30)
 IT_STATS.n4_n2g_st_cf3(1) = 0; %(32) 
 IT_STATS.n4_nn2g_cf3(1)   = 0; %(34)
 IT_STATS.n2g_nn4_cf3(1)   = 0; %(36)
 
 % --- relevant event counters --------------------------------------
 
 IT_STATS.need4_cf3_cntr(1)     = 0; %(38)
 IT_STATS.need2give_cf3_cntr(1) = 0; %(40)
 IT_STATS.n4_n2g_cf3_cntr(1)    = 0; %(42)
 IT_STATS.n2g_n4_cf3_cntr(1)    = 0; %(44)
 IT_STATS.n4_n2g_st_cf3_cntr(1) = 0; %(46)
 IT_STATS.n4_nn2g_cf3_cntr(1)   = 0; %(48)
 IT_STATS.n2g_nn4_cf3_cntr(1)   = 0; %(50)
 
 IT_STATS.no_cf3_cntr(1) = 0; %(52)
 
 IT_STATS.no_cf3_ntrs(1) = 0; %(54) 

 IT_STATS.no_cf3_ls(1)   = 0; %(56) 
 
 IT_STATS.no_cf3_m(1)    = 0; %(58) 
 
 IT_STATS.no_cf3_dm2s    = 0; %(60)
 
 IT_STATS.no_cf3_sd(1)   = 0; %(62)
 
 % ---- p-distance --------------------------------------------------
 
 IT_STATS.cf3_pd_cd(1)    = PRMS_C_CD.cf3_pd; %(68)
 
 IT_STATS.cf3_pd_cr(1)    = PRMS_C_CR.cf3_pd; %(70)
 
 IT_STATS.cf3_pd_cd_s     = PRMS_C_CD.cf3_pd; %(72)
 
 IT_STATS.cf3_pd_cr_s     = PRMS_C_CR.cf3_pd; %(74)

 IT_STATS.cf3_pd_cd_m(1)  = PRMS_C_CD.cf3_pd; %(76)
 
 IT_STATS.cf3_pd_cd_dm2s  = 0;                %(78)
 
 IT_STATS.cf3_pd_cd_sd(1) = 0;                %(80)
 
 IT_STATS.cf3_pd_cr_m(1)  = PRMS_C_CR.cf3_pd; %(82)
 
 IT_STATS.cf3_pd_cr_dm2s  = 0;                %(84)
 
 IT_STATS.cf3_pd_cr_sd(1) = 0;                %(86)
 
 % ---- target p-distance -------------------------------------------
 
 IT_STATS.cf3_pd_trgt_cd(1) = PRMS_C_CD.cf3_pd_trgt; %(88)
 
 IT_STATS.cf3_pd_trgt_cr(1) = PRMS_C_CR.cf3_pd_trgt; %(90)
 
 % ---- distancing --------------------------------------------------

 IT_STATS.cf3_d_cd(1)   = PRMS_C_CD.cf3_d;  %(92)
 
 IT_STATS.cf3_d_cr(1)   = PRMS_C_CR.cf3_d;  %(94)
 
 IT_STATS.cf3_d_cd_s    = PRMS_C_CD.cf3_d;  %(96)
 
 IT_STATS.cf3_d_cr_s    = PRMS_C_CR.cf3_d;  %(98)
 
 IT_STATS.cf3_d_cd_m(1) = PRMS_C_CD.cf3_d;  %(100)
 
 IT_STATS.cf3_d_cd_dm2s = 0;                %(102)
 
 IT_STATS.cf3_d_cd_sd(1) = 0;               %(104)
 
 IT_STATS.cf3_d_cr_m(1)  = PRMS_C_CR.cf3_d; %(106)
 
 IT_STATS.cf3_d_cr_dm2s  = 0;               %(108)
 
 IT_STATS.cf3_d_cr_sd(1) = 0;               %(110)
 
 % ---- target distancing -------------------------------------------
 
 IT_STATS.cf3_d_trgt_cd(1) = PRMS_C_CD.cf3_d_trgt; %(112)
 
 IT_STATS.cf3_d_trgt_cr(1) = PRMS_C_CR.cf3_d_trgt; %(114)
 
 % ---- distancing fixes --------------------------------------------
 
 %IT_STATS.cf3_df_cd(1) = PRMS_C_CD.cf3_df; %(116)
 
 %IT_STATS.cf3_df_cr(1) = PRMS_C_CR.cf3_df; %(118)
 
 % ---- distancing fixes --------------------------------------------
      
 IT_STATS.p2need_cf3_s       = PRMS_C_CD.p2need_cf3;  %(120)
 IT_STATS.p2give_cf3_s       = PRMS_C_CR.p2give_cf3;  %(122)
 
 IT_STATS.p2need_cf3_x_s     = PRMS_C_CD.p2need_cf3_x; %(124)
 
 IT_STATS.p2give_cf3_x_s     = PRMS_C_CR.p2give_cf3_x; %(126)
 
 IT_STATS.p2need_cf3_m(1)    = PRMS_C_CD.p2need_cf3;   %(128)
 IT_STATS.p2give_cf3_m(1)    = PRMS_C_CR.p2give_cf3;   %(130)
 
 IT_STATS.p2need_cf3_dm2s    = 0;                      %(132)
 IT_STATS.p2give_cf3_dm2s    = 0;                      %(134)
 
 IT_STATS.p2need_cf3_sd(1)   = 0;                      %(136)
 IT_STATS.p2give_cf3_sd(1)   = 0;                      %(138)
 
 IT_STATS.p2need_cf3_x_m(1)  = PRMS_C_CD.p2need_cf3_x; %(140)
 IT_STATS.p2give_cf3_x_m(1)  = PRMS_C_CR.p2give_cf3_x; %(142)
 
 IT_STATS.p2need_cf3_x_dm2s  = 0;                      %(144)
 IT_STATS.p2give_cf3_x_dm2s  = 0;                      %(146)
 
 IT_STATS.p2need_cf3_x_sd(1) = 0;                      %(148)
 IT_STATS.p2give_cf3_x_sd(1) = 0;                      %(150)
 
 % --- percentages ----------
 
 if IT_STATS.need4_cf3(1)
     IT_STATS.need4_cf3_pc(1)     = 100; %(160)
 end
 
 if IT_STATS.need2give_cf3(1)
     IT_STATS.need2give_cf3_pc(1) = 100; %(162) 
 end 
 
 % --- mean to target -------
 
 IT_STATS.cf3_pd_m2t_cd(1) = IT_STATS.cf3_pd_cd_m(1) - IT_STATS.cf3_pd_trgt_cd(1); %(168)
 
 IT_STATS.cf3_pd_m2t_cr(1) = IT_STATS.cf3_pd_cr_m(1) - IT_STATS.cf3_pd_trgt_cr(1); %(170)
 
 IT_STATS.cf3_d_m2t_cd(1)  = IT_STATS.cf3_d_cd_m(1) - IT_STATS.cf3_d_trgt_cd(1);   %(172)
 
 IT_STATS.cf3_d_m2t_cr(1)  = IT_STATS.cf3_d_cr_m(1) - IT_STATS.cf3_d_trgt_cr(1);   %(174)
 