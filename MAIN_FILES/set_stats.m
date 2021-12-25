function set_stats()

%sets up data structure to record statistics for each iteration
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%IT_STATS: data structure containing statistics on model at each iteration (number of agents etc)

%%% --- AFTER SET UP ------------------------------------------------------------
%%% --- VALUES OF IT_STATS UPDATED AT THE END OF aclab_play_agents ONLY ---------
%%% --- ALL OTHER FUNCTIONS READ FROM IT_STATS ONLY -----------------------------

global IT_STATS PRMS_ACLAB PRMS_C_LAB PRMS_C_CD PRMS_C_CR
 
 IT_STATS.tot_cd        = zeros(1,PRMS_ACLAB.tot_it+1);   %(1)  total no. children   in lab at current iteration
 IT_STATS.tot_cr        = zeros(1,PRMS_ACLAB.tot_it+1);   %(2)  total no. caregivers in lab at current iteration
 IT_STATS.tot           = zeros(1,PRMS_ACLAB.tot_it+1);   %(3)  total no. agents     in lab at current iteration
 IT_STATS.pos_cd        = zeros(1,2,PRMS_ACLAB.tot_it+1); %(4)
 IT_STATS.pos_cr        = zeros(1,2,PRMS_ACLAB.tot_it+1); %(5) 
 
 set_stats_cf2 %setup stats for avoidance   (cf2) (m-file)
 set_stats_cf3 %setup stats for ambivalence (cf3) (m-file)
 set_stats_cf4 %setup stats for phobicity   (cf4) (m-file)
 
 IT_STATS.d_cd_cr       = zeros(1,PRMS_ACLAB.tot_it+1);   %(22)
 IT_STATS.d_cd_cr_2     = zeros(1,PRMS_ACLAB.tot_it+1);   %(22b)
 
 %- child coordinate variables ---------
 IT_STATS.pos_cd_x =     zeros(1,PRMS_ACLAB.tot_it+1);
 IT_STATS.pos_cd_y =     zeros(1,PRMS_ACLAB.tot_it+1);
 IT_STATS.pos_cd_x_pre = zeros(1,PRMS_ACLAB.tot_it+1);
 IT_STATS.pos_cd_y_pre = zeros(1,PRMS_ACLAB.tot_it+1);
 %--------------------------------------

 %- caregiver coordinate variables -----
 IT_STATS.pos_cr_x =     zeros(1,PRMS_ACLAB.tot_it+1);
 IT_STATS.pos_cr_y =     zeros(1,PRMS_ACLAB.tot_it+1);
 IT_STATS.pos_cr_x_pre = zeros(1,PRMS_ACLAB.tot_it+1);
 IT_STATS.pos_cr_y_pre = zeros(1,PRMS_ACLAB.tot_it+1);
 %--------------------------------------
 
 % --- lab distance -------------------------------------------------
 
 IT_STATS.d_cd_cr_s    = 0;                              %(63)
 IT_STATS.d_cd_cr_m    = zeros(1,PRMS_ACLAB.tot_it+1);   %(64)
 IT_STATS.d_cd_cr_dm2s = 0;                              %(65)
 IT_STATS.d_cd_cr_sd   = zeros(1,PRMS_ACLAB.tot_it+1);   %(66)
 
 % --- explore/approach ---------------------------------------------
 
 IT_STATS.cd_explore  = false(1,PRMS_ACLAB.tot_it+1);        %(151)
 IT_STATS.cd_approach = false(1,PRMS_ACLAB.tot_it+1);        %(152)
 IT_STATS.cr_explore  = false(1,PRMS_ACLAB.tot_it+1);        %(153)
 IT_STATS.cr_approach = false(1,PRMS_ACLAB.tot_it+1);        %(154)
 
 IT_STATS.cd_explore_cntr  = zeros(1,PRMS_ACLAB.tot_it+1);   %(155)
 IT_STATS.cd_approach_cntr = zeros(1,PRMS_ACLAB.tot_it+1);   %(156)
 IT_STATS.cr_explore_cntr  = zeros(1,PRMS_ACLAB.tot_it+1);   %(157)
 IT_STATS.cr_approach_cntr = zeros(1,PRMS_ACLAB.tot_it+1);   %(158) 
 
 % --- percentages ----------
 
 IT_STATS.cd_explore_pc  = zeros(1,PRMS_ACLAB.tot_it+1);   %(163)
 IT_STATS.cd_approach_pc = zeros(1,PRMS_ACLAB.tot_it+1);   %(164)    
 IT_STATS.cr_explore_pc  = zeros(1,PRMS_ACLAB.tot_it+1);   %(165)
 IT_STATS.cr_approach_pc = zeros(1,PRMS_ACLAB.tot_it+1);   %(166)
 
 % ------------------------------------------------------------------
 % ------------------------------------------------------------------
 % --- initialize first element (iteration zero) --------------------
 % ------------------------------------------------------------------
 % ------------------------------------------------------------------
 
 IT_STATS.tot_cd(1)        = PRMS_ACLAB.n_cd;                 %(1)      
 IT_STATS.tot_cr(1)        = PRMS_ACLAB.n_cr;                 %(2)
 IT_STATS.tot(1)           = PRMS_ACLAB.n_cd+PRMS_ACLAB.n_cr; %(3)
 IT_STATS.pos_cd(:,:,1)    = PRMS_C_CD.pos;                   %(4)
 IT_STATS.pos_cr(:,:,1)    = PRMS_C_CR.pos;                   %(5)

 IT_STATS.d_cd_cr(1)       = sqrt((PRMS_C_CD.pos(1)-...       %(22)
                                   PRMS_C_CR.pos(1)).^2+... 
                                  (PRMS_C_CD.pos(2)-...
                                   PRMS_C_CR.pos(2)).^2);
                               
 IT_STATS.d_cd_cr_2(1)     = (PRMS_C_CD.pos(1)-...            %(22b) 
                              PRMS_C_CR.pos(1))+... 
                             (PRMS_C_CD.pos(2)-...
                              PRMS_C_CR.pos(2));
                          
 %- child coordinate variables ---------
 IT_STATS.pos_cd_x(1)     = PRMS_C_CD.pos(1);
 IT_STATS.pos_cd_y(1)     = PRMS_C_CD.pos(2);
 IT_STATS.pos_cd_x_pre(1) = PRMS_C_CD.pos(1);
 IT_STATS.pos_cd_y_pre(1) = PRMS_C_CD.pos(2);
 %--------------------------------------

 %- caregiver coordinate variables -----
 IT_STATS.pos_cr_x(1)     = PRMS_C_CR.pos(1);
 IT_STATS.pos_cr_y(1)     = PRMS_C_CR.pos(2);
 IT_STATS.pos_cr_x_pre(1) = PRMS_C_CR.pos(1);
 IT_STATS.pos_cr_y_pre(1) = PRMS_C_CR.pos(2);
 %--------------------------------------
 
 % --- lab distance -------------------------------------------------
 
 IT_STATS.d_cd_cr_s     = PRMS_C_LAB.cd_cr_d; %(63)
 IT_STATS.d_cd_cr_m(1)  = PRMS_C_LAB.cd_cr_d; %(64)
 IT_STATS.d_cd_cr_dm2s  = 0;                  %(65)
 IT_STATS.d_cd_cr_sd(1) = 0;                  %(66)
 
 % --- explore/approach ---------------------------------------------
 
 IT_STATS.cd_explore(1)  = PRMS_ACLAB.cd_explore;  %(151)
 IT_STATS.cd_approach(1) = PRMS_ACLAB.cd_approach; %(152)
 IT_STATS.cr_explore(1)  = PRMS_ACLAB.cr_explore;  %(153)
 IT_STATS.cr_approach(1) = PRMS_ACLAB.cr_approach; %(154)
 
 if IT_STATS.cd_explore(1)
     IT_STATS.cd_explore_cntr(1)  = 1;             %(155)
     IT_STATS.cd_explore_pc(1)    = 100;           %(163)
 end
 
 if IT_STATS.cd_approach(1)
     IT_STATS.cd_approach_cntr(1) = 1;             %(156) 
     IT_STATS.cd_approach_pc(1)   = 100;           %(164)    
 end
 
 if IT_STATS.cr_explore(1)
     IT_STATS.cr_explore_cntr(1)  = 1;             %(157)
     IT_STATS.cr_explore_pc(1)    = 100;           %(165)
 end
 
 if IT_STATS.cr_approach(1)
     IT_STATS.cr_approach_cntr(1) = 1;             %(158)
     IT_STATS.cr_approach_pc(1)   = 100;           %(166)
 end
 