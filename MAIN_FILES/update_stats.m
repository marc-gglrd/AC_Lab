function n_it=update_stats(n_cd_in,n_cr_in,curr_cd,curr_cr)

%updates data structure to record statistics for each iteration
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%IT_STATS: data structure containing statistics on model at each iteration (number of agents etc)

%%% --- AFTER SET UP ------------------------------------------------------------
%%% --- VALUES OF IT_STATS UPDATED AT THE END OF aclab_play_agents ONLY ---------
%%% --- ALL OTHER FUNCTIONS READ FROM IT_STATS ONLY -----------------------------

global IT_STATS N_IT PRMS_ACLAB

 n_it = N_IT;
                           
 IT_STATS.tot_cd    (N_IT+1)     = n_cd_in;                      %(1)
 IT_STATS.tot_cr    (N_IT+1)     = n_cr_in;                      %(2)
 IT_STATS.tot       (N_IT+1)     = n_cd_in+n_cr_in;              %(3)
 IT_STATS.pos_cd    (:,:,N_IT+1) = curr_cd.pos;                  %(4)
 IT_STATS.pos_cr    (:,:,N_IT+1) = curr_cr.pos;                  %(5)
 
 update_stats_cf2 %update stats for avoidance   (cf2) (m-file)
 update_stats_cf3 %update stats for ambivalence (cf3) (m-file)
 update_stats_cf4 %update stats for phobicity   (cf4) (m-file)
 
 % --- lab distance -------------------------------------------------
 
 IT_STATS.d_cd_cr   (N_IT+1)     = sqrt((curr_cr.pos(1)-...      %(22)
                                         curr_cd.pos(1)).^2+...
                                        (curr_cr.pos(2)-...
                                         curr_cd.pos(2)).^2);
                                     
 IT_STATS.d_cd_cr_2  (N_IT+1)    = (curr_cr.pos(1)-...           %(22b)
                                    curr_cd.pos(1))+...
                                   (curr_cr.pos(2)-...
                                    curr_cd.pos(2));
                                
 %- child coordinate variables ---------
 IT_STATS.pos_cd_x    (N_IT+1) = IT_STATS.pos_cd(1,1,N_IT+1);
 IT_STATS.pos_cd_y    (N_IT+1) = IT_STATS.pos_cd(1,2,N_IT+1);
 IT_STATS.pos_cd_x_pre(N_IT+1) = IT_STATS.pos_cd(1,1,N_IT);
 IT_STATS.pos_cd_y_pre(N_IT+1) = IT_STATS.pos_cd(1,2,N_IT);
 %--------------------------------------

 %- caregiver coordinate variables -----
 IT_STATS.pos_cr_x    (N_IT+1) = IT_STATS.pos_cr(1,1,N_IT+1);
 IT_STATS.pos_cr_y    (N_IT+1) = IT_STATS.pos_cr(1,2,N_IT+1);
 IT_STATS.pos_cr_x_pre(N_IT+1) = IT_STATS.pos_cr(1,1,N_IT);
 IT_STATS.pos_cr_y_pre(N_IT+1) = IT_STATS.pos_cr(1,2,N_IT);
 %--------------------------------------
                                                                                       
 IT_STATS.d_cd_cr_s          = IT_STATS.d_cd_cr_s + IT_STATS.d_cd_cr(N_IT+1); %(63) 
 IT_STATS.d_cd_cr_m(N_IT+1)  = IT_STATS.d_cd_cr_s / (N_IT+1);                 %(64) 
 IT_STATS.d_cd_cr_dm2s       = IT_STATS.d_cd_cr_dm2s + ...
                              (IT_STATS.d_cd_cr(N_IT+1) - ...
                               IT_STATS.d_cd_cr_m(N_IT+1))^2;                 %(65) 
 IT_STATS.d_cd_cr_sd(N_IT+1) = sqrt(IT_STATS.d_cd_cr_dm2s / (N_IT));          %(66)
 
 % --- explore/approach ---------------------------------------------
 
 IT_STATS.cd_explore (N_IT+1) = PRMS_ACLAB.cd_explore;                          %(151)
 IT_STATS.cd_approach(N_IT+1) = PRMS_ACLAB.cd_approach;                         %(152)
 IT_STATS.cr_explore (N_IT+1) = PRMS_ACLAB.cr_explore;                          %(153)
 IT_STATS.cr_approach(N_IT+1) = PRMS_ACLAB.cr_approach;                         %(154)
 
 IT_STATS.cd_explore_cntr (N_IT+1) = IT_STATS.cd_explore_cntr (N_IT);           %(155)
 IT_STATS.cd_approach_cntr(N_IT+1) = IT_STATS.cd_approach_cntr(N_IT);           %(156)    
 IT_STATS.cr_explore_cntr (N_IT+1) = IT_STATS.cr_explore_cntr (N_IT);           %(157)
 IT_STATS.cr_approach_cntr(N_IT+1) = IT_STATS.cr_approach_cntr(N_IT);           %(158)
    
 if IT_STATS.cd_explore (N_IT+1)
     IT_STATS.cd_explore_cntr (N_IT+1) = IT_STATS.cd_explore_cntr (N_IT+1) + 1; %(155)
 end
 
 if IT_STATS.cd_approach(N_IT+1)
     IT_STATS.cd_approach_cntr(N_IT+1) = IT_STATS.cd_approach_cntr(N_IT+1) + 1; %(156)    
 end
 
 if IT_STATS.cr_explore (N_IT+1)
     IT_STATS.cr_explore_cntr (N_IT+1) = IT_STATS.cr_explore_cntr (N_IT+1) + 1; %(157)
 end
 
 if IT_STATS.cr_approach(N_IT+1)
     IT_STATS.cr_approach_cntr(N_IT+1) = IT_STATS.cr_approach_cntr(N_IT+1) + 1; %(158)
 end
  
 % --- percentages ----------
 
 IT_STATS.cd_explore_pc   (N_IT+1) = 100 * IT_STATS.cd_explore_cntr   (N_IT+1) / (N_IT+1); %(163)
 IT_STATS.cd_approach_pc  (N_IT+1) = 100 * IT_STATS.cd_approach_cntr  (N_IT+1) / (N_IT+1); %(164)    
 IT_STATS.cr_explore_pc   (N_IT+1) = 100 * IT_STATS.cr_explore_cntr   (N_IT+1) / (N_IT+1); %(165)
 IT_STATS.cr_approach_pc  (N_IT+1) = 100 * IT_STATS.cr_approach_cntr  (N_IT+1) / (N_IT+1); %(166)
 
 