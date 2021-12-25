%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf4 stats setup ---------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global IT_STATS PRMS_ACLAB PRMS_C_CD PRMS_C_CR
 
 IT_STATS.p2need_cf4_x  = zeros(1,PRMS_ACLAB.tot_it+1);   %(7)   
 IT_STATS.p2give_cf4_x  = zeros(1,PRMS_ACLAB.tot_it+1);   %(9) 
 IT_STATS.p2need_cf4_xf = zeros(1,PRMS_ACLAB.tot_it+1);   %(11)   
 IT_STATS.p2give_cf4_xf = zeros(1,PRMS_ACLAB.tot_it+1);   %(13)
 IT_STATS.p2need_cf4    = zeros(1,PRMS_ACLAB.tot_it+1);   %(15)   
 IT_STATS.p2give_cf4    = zeros(1,PRMS_ACLAB.tot_it+1);   %(17)
 
 IT_STATS.ad4_ph        = zeros(1,PRMS_ACLAB.tot_it+1);   %(19) 
 
 IT_STATS.cf4_li        = zeros(1,PRMS_ACLAB.tot_it+1);   %(21) 
 
 % --- relevant events ----------------------------------------------
 
 IT_STATS.need4_cf4       = false(1,PRMS_ACLAB.tot_it+1); %(24) child need for cf4 (n4-event)
 IT_STATS.need2give_cf4   = false(1,PRMS_ACLAB.tot_it+1); %(26) caregiver needs to give cf4 (n2g-event)

 IT_STATS.n4_n2g_cf4    = zeros(1,PRMS_ACLAB.tot_it+1); %(28) cf4: child needs for, caregiver needs to give (n4_n2g-event)
 IT_STATS.n2g_n4_cf4    = zeros(1,PRMS_ACLAB.tot_it+1); %(30) cf4: caregiver needs to give, child needs for (n2g_n4-event)
 IT_STATS.n4_n2g_st_cf4 = zeros(1,PRMS_ACLAB.tot_it+1); %(32) cf4: child needs for, caregiver needs to give at same iteration (n4_n2g-event)
 
 IT_STATS.n4_nn2g_cf4   = zeros(1,PRMS_ACLAB.tot_it+1); %(34) cf4: child needs for, caregiver does not need to give (n4_nn2g-event)
 IT_STATS.n2g_nn4_cf4   = zeros(1,PRMS_ACLAB.tot_it+1); %(36) cf4: caregiver needs to give, child does not need for (n2g_nn4-event)

 % --- relevant event counters --------------------------------------
 
 IT_STATS.need4_cf4_cntr     = zeros(1,PRMS_ACLAB.tot_it+1); %(38) cf4: n4-events counter (n4-event   at it.n)
 IT_STATS.need2give_cf4_cntr = zeros(1,PRMS_ACLAB.tot_it+1); %(40) cf4: n2g-events counter (n2g-event at it.n)
 
 IT_STATS.n4_n2g_cf4_cntr    = zeros(1,PRMS_ACLAB.tot_it+1); %(42) cf4: n4_n2g-events counter (n4-event  at it.n - n2g-event at it. n+1)
 IT_STATS.n2g_n4_cf4_cntr    = zeros(1,PRMS_ACLAB.tot_it+1); %(44) cf4: n2g_n4-events counter (n2g-event at it.n - n4-event  at it. n+1)
 IT_STATS.n4_n2g_st_cf4_cntr = zeros(1,PRMS_ACLAB.tot_it+1); %(46) cf4: n4_n2g-events counter (n4-event  at it.n - n2g-event at it. n)
 
 IT_STATS.n4_nn2g_cf4_cntr   = zeros(1,PRMS_ACLAB.tot_it+1); %(48) cf4: n4_n2g-events counter (n4-event  at it.n - ng-event at it. n+1)
 IT_STATS.n2g_nn4_cf4_cntr   = zeros(1,PRMS_ACLAB.tot_it+1); %(50) cf4: n2g_n4-events counter (n2g-event at it.n - na-event at it. n+1)
 
 IT_STATS.no_cf4_cntr        = zeros(1,PRMS_ACLAB.tot_it+1); %(52) cf4: no care (needed4/needed2) iteration-counter
 
 IT_STATS.no_cf4_ntrs        = zeros(1,PRMS_ACLAB.tot_it+1); %(54) cf4: nomber of intervals of no care (needed4/needed2)

 IT_STATS.no_cf4_ls          = zeros(1,PRMS_ACLAB.tot_it+1); %(56) cf4: intervals of no care (needed4/needed2) length sum
 
 IT_STATS.no_cf4_m           = zeros(1,PRMS_ACLAB.tot_it+1); %(58) cf4: intervals of no care (needed4/needed2) mean-length
 
 IT_STATS.no_cf4_dm2s        = 0;                            %(60) cf4: sum of differences from mean squared (to calculate standard deviation)
 
 IT_STATS.no_cf4_sd          = zeros(1,PRMS_ACLAB.tot_it+1); %(62) cf4: intervals of no care (needed4/needed2) length standard deviation
 
 % ---- vulnerability -----------------------------------------------
 
 IT_STATS.cf4_vu_cd      = zeros(1,PRMS_ACLAB.tot_it+1); %(68)
 
 IT_STATS.cf4_vu_cr      = zeros(1,PRMS_ACLAB.tot_it+1); %(70)
 
 IT_STATS.cf4_vu_cd_s    = 0;                            %(72)
 
 IT_STATS.cf4_vu_cr_s    = 0;                            %(74)
 
 IT_STATS.cf4_vu_cd_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(76)
 
 IT_STATS.cf4_vu_cr_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(78)
 
 IT_STATS.cf4_vu_cd_dm2s = 0;                            %(80)
 
 IT_STATS.cf4_vu_cr_dm2s = 0;                            %(82)
 
 IT_STATS.cf4_vu_cd_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(84)
 
 IT_STATS.cf4_vu_cr_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(86)
 
 % ---- target vulnerability ----------------------------------------
 
 IT_STATS.cf4_vu_trgt_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(88)
 
 IT_STATS.cf4_vu_trgt_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(90)

 % ---- distancing --------------------------------------------------
 
 IT_STATS.cf4_d_cd      = zeros(1,PRMS_ACLAB.tot_it+1); %(92)
 
 IT_STATS.cf4_d_cr      = zeros(1,PRMS_ACLAB.tot_it+1); %(94)
 
 IT_STATS.cf4_d_cd_s    = 0;                            %(96)
 
 IT_STATS.cf4_d_cr_s    = 0;                            %(98)
 
 IT_STATS.cf4_d_cd_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(100)
 
 IT_STATS.cf4_d_cr_m    = zeros(1,PRMS_ACLAB.tot_it+1); %(102)
 
 IT_STATS.cf4_d_cd_dm2s = 0;                            %(104)
 
 IT_STATS.cf4_d_cr_dm2s = 0;                            %(106)
 
 IT_STATS.cf4_d_cd_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(108)
 
 IT_STATS.cf4_d_cr_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(110)
 
 % ---- target distancing -------------------------------------------
 
 IT_STATS.cf4_d_trgt_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(112)
 
 IT_STATS.cf4_d_trgt_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(114)
 
 % ---- distancing fixes --------------------------------------------
 
 %IT_STATS.cf4_df_cd = zeros(1,PRMS_ACLAB.tot_it+1); %(116)
 
 %IT_STATS.cf4_df_cr = zeros(1,PRMS_ACLAB.tot_it+1); %(118)
 
 % --- P and x stats ------------------------------------------------
 
 IT_STATS.p2need_cf4_s     = 0;                             %(120)
 IT_STATS.p2give_cf4_s     = 0;                             %(122)
 
 IT_STATS.p2need_cf4_x_s   = 0;                             %(124)
 IT_STATS.p2give_cf4_x_s   = 0;                             %(126)
 
 IT_STATS.p2need_cf4_m     = zeros(1,PRMS_ACLAB.tot_it+1);  %(128)
 IT_STATS.p2give_cf4_m     = zeros(1,PRMS_ACLAB.tot_it+1);  %(130)
 
 IT_STATS.p2need_cf4_x_m   = zeros(1,PRMS_ACLAB.tot_it+1);  %(132) 
 IT_STATS.p2give_cf4_x_m   = zeros(1,PRMS_ACLAB.tot_it+1);  %(134)
 
 IT_STATS.p2need_cf4_dm2s  = 0;                             %(136)
 IT_STATS.p2give_cf4_dm2s  = 0;                             %(138)
 
 IT_STATS.p2need_cf4_x_dm2s = 0;                            %(140) 
 IT_STATS.p2give_cf4_x_dm2s = 0;                            %(142)
 
 IT_STATS.p2need_cf4_sd     = zeros(1,PRMS_ACLAB.tot_it+1); %(144)
 IT_STATS.p2give_cf4_sd     = zeros(1,PRMS_ACLAB.tot_it+1); %(146)
 
 IT_STATS.p2need_cf4_x_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(148) 
 IT_STATS.p2give_cf4_x_sd   = zeros(1,PRMS_ACLAB.tot_it+1); %(150)
 
 % --- percentages ----------
 
 IT_STATS.need4_cf4_pc     = zeros(1,PRMS_ACLAB.tot_it+1); %(160)
 IT_STATS.need2give_cf4_pc = zeros(1,PRMS_ACLAB.tot_it+1); %(162) 
 
 % --- mean to target -------
 
 IT_STATS.cf4_vu_m2t_cd = zeros(1,PRMS_ACLAB.tot_it+1);   %(168)
 
 IT_STATS.cf4_vu_m2t_cr = zeros(1,PRMS_ACLAB.tot_it+1);   %(170)
 
 IT_STATS.cf4_d_m2t_cd  = zeros(1,PRMS_ACLAB.tot_it+1);   %(172)
 
 IT_STATS.cf4_d_m2t_cr  = zeros(1,PRMS_ACLAB.tot_it+1);   %(174)
  
 % ------------------------------------------------------------------
 % ------------------------------------------------------------------
 % --- initialize first element (iteration zero) --------------------
 % ------------------------------------------------------------------
 % ------------------------------------------------------------------
 
 IT_STATS.p2need_cf4_x(1)  = PRMS_C_CD.p2need_cf4_x;          %(7)
 IT_STATS.p2give_cf4_x(1)  = PRMS_C_CR.p2give_cf4_x;          %(9) 
 IT_STATS.p2need_cf4_xf(1) = PRMS_C_CD.p2need_cf4_xf;         %(11)
 IT_STATS.p2give_cf4_xf(1) = PRMS_C_CR.p2give_cf4_xf;         %(13)
 IT_STATS.p2need_cf4(1)    = PRMS_C_CD.p2need_cf4;%0.5;       %(15)
 IT_STATS.p2give_cf4(1)    = PRMS_C_CR.p2give_cf4;%0.5;       %(17)

 IT_STATS.ad4_ph(1)        = PRMS_C_CD.ad4_ph;                %(19)

 IT_STATS.cf4_li(1)        = PRMS_C_CR.cf4_li;                %(21)
                               
 % --- relevant events ----------------------------------------------
                           
 IT_STATS.need4_cf4(1)     = 0; %(24)
 IT_STATS.need2give_cf4(1) = 0; %(26)
 IT_STATS.n4_n2g_cf4(1)    = 0; %(28)
 IT_STATS.n2g_n4_cf4(1)    = 0; %(30)
 IT_STATS.n4_n2g_st_cf4(1) = 0; %(32) 
 IT_STATS.n4_nn2g_cf4(1)   = 0; %(34)
 IT_STATS.n2g_nn4_cf4(1)   = 0; %(36)
 
 % --- relevant event counters --------------------------------------
 
 IT_STATS.need4_cf4_cntr(1)     = 0; %(38)
 IT_STATS.need2give_cf4_cntr(1) = 0; %(40)
 IT_STATS.n4_n2g_cf4_cntr(1)    = 0; %(42)
 IT_STATS.n2g_n4_cf4_cntr(1)    = 0; %(44)
 IT_STATS.n4_n2g_st_cf4_cntr(1) = 0; %(46)
 IT_STATS.n4_nn2g_cf4_cntr(1)   = 0; %(48)
 IT_STATS.n2g_nn4_cf4_cntr(1)   = 0; %(50)
 
 IT_STATS.no_cf4_cntr(1) = 0; %(52)
 
 IT_STATS.no_cf4_ntrs(1) = 0; %(54) 

 IT_STATS.no_cf4_ls(1)   = 0; %(56) 
 
 IT_STATS.no_cf4_m(1)    = 0; %(58) 
 
 IT_STATS.no_cf4_dm2s    = 0; %(60)
 
 IT_STATS.no_cf4_sd(1)   = 0; %(62)
 
 % ---- vulnerability -----------------------------------------------
 
 IT_STATS.cf4_vu_cd(1)    = PRMS_C_CD.cf4_vu; %(68)
 
 IT_STATS.cf4_vu_cr(1)    = PRMS_C_CR.cf4_vu; %(70)
 
 IT_STATS.cf4_vu_cd_s     = PRMS_C_CD.cf4_vu; %(72)
 
 IT_STATS.cf4_vu_cr_s     = PRMS_C_CR.cf4_vu; %(74)

 IT_STATS.cf4_vu_cd_m(1)  = PRMS_C_CD.cf4_vu; %(76)
 
 IT_STATS.cf4_vu_cd_dm2s  = 0;                %(78)
 
 IT_STATS.cf4_vu_cd_sd(1) = 0;                %(80)
 
 IT_STATS.cf4_vu_cr_m(1)  = PRMS_C_CR.cf4_vu; %(82)
 
 IT_STATS.cf4_vu_cr_dm2s  = 0;                %(84)
 
 IT_STATS.cf4_vu_cr_sd(1) = 0;                %(86)
 
 % ---- target vulnerability ----------------------------------------
 
 IT_STATS.cf4_vu_trgt_cd(1) = PRMS_C_CD.cf4_vu_trgt; %(88)
 
 IT_STATS.cf4_vu_trgt_cr(1) = PRMS_C_CR.cf4_vu_trgt; %(90)
 
 % ---- distancing --------------------------------------------------

 IT_STATS.cf4_d_cd(1)   = PRMS_C_CD.cf4_d;  %(92)
 
 IT_STATS.cf4_d_cr(1)   = PRMS_C_CR.cf4_d;  %(94)
 
 IT_STATS.cf4_d_cd_s    = PRMS_C_CD.cf4_d;  %(96)
 
 IT_STATS.cf4_d_cr_s    = PRMS_C_CR.cf4_d;  %(98)
 
 IT_STATS.cf4_d_cd_m(1) = PRMS_C_CD.cf4_d;  %(100)
 
 IT_STATS.cf4_d_cd_dm2s = 0;                %(102)
 
 IT_STATS.cf4_d_cd_sd(1) = 0;               %(104)
 
 IT_STATS.cf4_d_cr_m(1)  = PRMS_C_CR.cf4_d; %(106)
 
 IT_STATS.cf4_d_cr_dm2s  = 0;               %(108)
 
 IT_STATS.cf4_d_cr_sd(1) = 0;               %(110)
 
 % ---- target distancing -------------------------------------------
 
 IT_STATS.cf4_d_trgt_cd(1) = PRMS_C_CD.cf4_d_trgt; %(112)
 
 IT_STATS.cf4_d_trgt_cr(1) = PRMS_C_CR.cf4_d_trgt; %(114)
 
 % ---- distancing fixes --------------------------------------------
 
 %IT_STATS.cf4_df_cd(1) = PRMS_C_CD.cf4_df; %(116)
 
 %IT_STATS.cf4_df_cr(1) = PRMS_C_CR.cf4_df; %(118)
 
 % ---- distancing fixes --------------------------------------------
      
 IT_STATS.p2need_cf4_s       = PRMS_C_CD.p2need_cf4;  %(120)
 IT_STATS.p2give_cf4_s       = PRMS_C_CR.p2give_cf4;  %(122)
 
 IT_STATS.p2need_cf4_x_s     = PRMS_C_CD.p2need_cf4_x; %(124)
 
 IT_STATS.p2give_cf4_x_s     = PRMS_C_CR.p2give_cf4_x; %(126)
 
 IT_STATS.p2need_cf4_m(1)    = PRMS_C_CD.p2need_cf4;   %(128)
 IT_STATS.p2give_cf4_m(1)    = PRMS_C_CR.p2give_cf4;   %(130)
 
 IT_STATS.p2need_cf4_dm2s    = 0;                      %(132)
 IT_STATS.p2give_cf4_dm2s    = 0;                      %(134)
 
 IT_STATS.p2need_cf4_sd(1)   = 0;                      %(136)
 IT_STATS.p2give_cf4_sd(1)   = 0;                      %(138)
 
 IT_STATS.p2need_cf4_x_m(1)  = PRMS_C_CD.p2need_cf4_x; %(140)
 IT_STATS.p2give_cf4_x_m(1)  = PRMS_C_CR.p2give_cf4_x; %(142)
 
 IT_STATS.p2need_cf4_x_dm2s  = 0;                      %(144)
 IT_STATS.p2give_cf4_x_dm2s  = 0;                      %(146)
 
 IT_STATS.p2need_cf4_x_sd(1) = 0;                      %(148)
 IT_STATS.p2give_cf4_x_sd(1) = 0;                      %(150)
 
 % --- percentages ----------
 
 if IT_STATS.need4_cf4(1)
     IT_STATS.need4_cf4_pc(1)     = 100; %(160)
 end
 
 if IT_STATS.need2give_cf4(1)
     IT_STATS.need2give_cf4_pc(1) = 100; %(162) 
 end 
 
 % --- mean to target -------
 
 IT_STATS.cf4_vu_m2t_cd(1) = IT_STATS.cf4_vu_cd_m(1) - IT_STATS.cf4_vu_trgt_cd(1); %(168)
 
 IT_STATS.cf4_vu_m2t_cr(1) = IT_STATS.cf4_vu_cr_m(1) - IT_STATS.cf4_vu_trgt_cr(1); %(170)
 
 IT_STATS.cf4_d_m2t_cd(1)  = IT_STATS.cf4_d_cd_m(1) - IT_STATS.cf4_d_trgt_cd(1);   %(172)
 
 IT_STATS.cf4_d_m2t_cr(1)  = IT_STATS.cf4_d_cr_m(1) - IT_STATS.cf4_d_trgt_cr(1);   %(174)
 