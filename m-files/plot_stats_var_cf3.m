%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf3 plot_stats variables ------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global N_IT IT_STATS 

p2need_cf3_x  = IT_STATS.p2need_cf3_x;  %(7)
p2give_cf3_x  = IT_STATS.p2give_cf3_x;  %(9)
p2need_cf3_xf = IT_STATS.p2need_cf3_xf; %(11)
p2give_cf3_xf = IT_STATS.p2give_cf3_xf; %(13)
p2need_cf3    = IT_STATS.p2need_cf3;    %(15)
p2give_cf3    = IT_STATS.p2give_cf3;    %(17)

ad3_am        = IT_STATS.ad3_am;        %(19)

cf3_un        = IT_STATS.cf3_un;        %(21)
   
% --- relevant events ---------------------------
    
need4_cf3     = IT_STATS.need4_cf3;     %(24)
need2give_cf3 = IT_STATS.need2give_cf3; %(26)

n4_n2g_cf3    = IT_STATS.n4_n2g_cf3;    %(28)
n2g_n4_cf3    = IT_STATS.n2g_n4_cf3;    %(30)
n4_n2g_st_cf3 = IT_STATS.n4_n2g_st_cf3; %(32)
    
n4_nn2g_cf3   = IT_STATS.n4_nn2g_cf3;   %(34)
n2g_nn4_cf3   = IT_STATS.n2g_nn4_cf3;   %(36)
    
% --- relevant event counters -------------------
    
need4_cf3_cntr     = IT_STATS.need4_cf3_cntr;     %(38) 
need2give_cf3_cntr = IT_STATS.need2give_cf3_cntr; %(40) 
    
n4_n2g_cf3_cntr    = IT_STATS.n4_n2g_cf3_cntr;    %(42)
n2g_n4_cf3_cntr    = IT_STATS.n2g_n4_cf3_cntr;    %(44)
n4_n2g_st_cf3_cntr = IT_STATS.n4_n2g_st_cf3_cntr; %(46)
      
n4_nn2g_cf3_cntr  = IT_STATS.n4_nn2g_cf3_cntr;    %(48)
n2g_nn4_cf3_cntr  = IT_STATS.n2g_nn4_cf3_cntr;    %(50)

% ---------------------------

no_cf3_cntr       = IT_STATS.no_cf3_cntr;         %(52)

% ---------------------------
no_cf3_ntrs       = IT_STATS.no_cf3_ntrs(N_IT+1); %(54) 
% ---------------------------
no_cf3_ls         = IT_STATS.no_cf3_ls(N_IT+1);   %(56)
% ---------------------------
  
no_cf3_m          = IT_STATS.no_cf3_m;            %(58)
no_cf3_dm2s       = IT_STATS.no_cf3_dm2s;         %(60)
no_cf3_sd         = IT_STATS.no_cf3_sd;           %(62)

 % ---- p-distance ------------------------------

cf3_pd_cd      = IT_STATS.cf3_pd_cd;      %(68)
 
cf3_pd_cr      = IT_STATS.cf3_pd_cr;      %(70)

cf3_pd_cd_s    = IT_STATS.cf3_pd_cd_s;    %(72)
 
cf3_pd_cr_s    = IT_STATS.cf3_pd_cr_s;    %(74)
 
cf3_pd_cd_m    = IT_STATS.cf3_pd_cd_m;    %(76)
 
cf3_pd_cr_m    = IT_STATS.cf3_pd_cr_m;    %(78)

cf3_pd_cd_dm2s = IT_STATS.cf3_pd_cd_dm2s; %(80)
 
cf3_pd_cr_dm2s = IT_STATS.cf3_pd_cr_dm2s; %(82)
 
cf3_pd_cd_sd   = IT_STATS.cf3_pd_cd_sd;   %(84)
 
cf3_pd_cr_sd   = IT_STATS.cf3_pd_cr_sd;   %(86)

 % ---- target p-distance -----------------------
 
cf3_pd_trgt_cd = IT_STATS.cf3_pd_trgt_cd; %(88)
 
cf3_pd_trgt_cr = IT_STATS.cf3_pd_trgt_cr; %(90)

 % ---- distancing ------------------------------
 
cf3_d_cd      = IT_STATS.cf3_d_cd;      %(92)
 
cf3_d_cr      = IT_STATS.cf3_d_cr;      %(94)
 
cf3_d_cd_s    = IT_STATS.cf3_d_cd_s;    %(96)
 
cf3_d_cr_s    = IT_STATS.cf3_d_cr_s;    %(98)
 
cf3_d_cd_m    = IT_STATS.cf3_d_cd_m;    %(100)
 
cf3_d_cr_m    = IT_STATS.cf3_d_cr_m;    %(102)
 
cf3_d_cd_dm2s = IT_STATS.cf3_d_cd_dm2s; %(104)
 
cf3_d_cr_dm2s = IT_STATS.cf3_d_cr_dm2s; %(106)
 
cf3_d_cd_sd   = IT_STATS.cf3_d_cd_sd;   %(108)
 
cf3_d_cr_sd   = IT_STATS.cf3_d_cr_sd;   %(110)
 
 % ---- target distancing -----------------------
 
cf3_d_trgt_cd = IT_STATS.cf3_d_trgt_cd; %(112)
 
cf3_d_trgt_cr = IT_STATS.cf3_d_trgt_cr; %(114)
 
 % ---- distancing fixes ------------------------
 
%cf3_df_cd = IT_STATS.cf3_df_cd; %(116)
 
%cf3_df_cr = IT_STATS.cf3_df_cr; %(118)

% --- P and x stats -----------------------------

p2need_cf3_s      = IT_STATS.p2need_cf3_s;      %(120)
p2give_cf3_s      = IT_STATS.p2give_cf3_s;      %(122)
 
p2need_cf3_x_s    = IT_STATS.p2need_cf3_x_s;    %(124)

p2give_cf3_x_s    = IT_STATS.p2give_cf3_x_s;    %(126)

p2need_cf3_m      = IT_STATS.p2need_cf3_m;      %(128)
p2give_cf3_m      = IT_STATS.p2give_cf3_m;      %(130)
 
p2need_cf3_x_m    = IT_STATS.p2need_cf3_x_m;    %(132)
 
p2give_cf3_x_m    = IT_STATS.p2give_cf3_x_m;    %(134)

p2need_cf3_dm2s   = IT_STATS.p2need_cf3_dm2s;   %(136)
p2give_cf3_dm2s   = IT_STATS.p2give_cf3_dm2s;   %(138)
 
p2need_cf3_x_dm2s = IT_STATS.p2need_cf3_x_dm2s; %(140)
p2give_cf3_x_dm2s = IT_STATS.p2give_cf3_x_dm2s; %(142)
 
p2need_cf3_sd     = IT_STATS.p2need_cf3_sd;     %(144)
p2give_cf3_sd     = IT_STATS.p2give_cf3_sd;     %(146)
 
p2need_cf3_x_sd   = IT_STATS.p2need_cf3_x_sd;   %(148)
p2give_cf3_x_sd   = IT_STATS.p2give_cf3_x_sd;   %(150)
 
need4_cf3_pc     = IT_STATS.need4_cf3_pc;       %(160)
need2give_cf3_pc = IT_STATS.need2give_cf3_pc;   %(162) 

cf3_pd_m2t_cd = IT_STATS.cf3_pd_m2t_cd;         %(168)
 
cf3_pd_m2t_cr = IT_STATS.cf3_pd_m2t_cr;         %(170)
 
cf3_d_m2t_cd  = IT_STATS.cf3_d_m2t_cd;          %(172)
 
cf3_d_m2t_cr  = IT_STATS.cf3_d_m2t_cr;          %(174)
