function final_report_out = aclab_go(ad_cf,...    %(1) attachment dimension / caregiving feature
                                     c_mode,...   %(2) lab configuration mode: 0 standard (fixed), 1 random
                                     tot_it,...   %(3) number of total iterations
                                     out_intr,... %(4) output interval: iterations between outputs (zero for first-last only)                               
                                     out_strt,... %(5) output start iteration                      (zero for first-last only)
                                     out_end,...  %(6) output end   iteration                      (zero for first-last only)
                                     out_plot,... %(7) output plot -1(no plots)/0(lab)/1(graphs) - default is 1
                                     out_imgs)    %(8) output images true/false - default is false

%standard call: aclab_go(0)

%Project: AC-Lab - Attachment-Caregiving Lab
%Agent-Based Model: Child & Caregiver interacting in Lab
%AUTHOR: Marcantonio Gagliardi (M.G.) / mgagliardi1@sheffield.ac.uk
%Created Feb 2020

%Definition of GLOBAL VARIABLES
%N_IT: current iteration number
%IT_STATS:   data structure containing statistics on model at each iteration (iniitialized in set_stats.m)
%PRMS_ACLAB: data structure containing model parameters (initialized in aclab_go_set.m)
%PRMS_C_LAB: data structure containing lab parameters   (initialized in aclab_go_set.m)         

    %clear any global variables / close figures from previous simulations
    clear global
    close all

    global N_IT PRMS_ACLAB  
    global IT_STATS PRMS_C_LAB %used in eval (saving at end of aclab_go)
    
    %%% ----------------------------------------------------------------------------
    %%% --- MODEL INITIALIZATION ---------------------------------------------------
    %%% ----------------------------------------------------------------------------
    
    %%% --- set all parameters ----------------------------
    
    if nargin == 0
        aclab_go_set();
    elseif nargin == 1
        aclab_go_set(ad_cf);   
    elseif nargin == 2
        aclab_go_set(ad_cf,c_mode);   
    elseif nargin == 3
        aclab_go_set(ad_cf,c_mode, tot_it);   
    elseif nargin == 4
        aclab_go_set(ad_cf,c_mode, tot_it, out_intr);  
    elseif nargin == 5
        aclab_go_set(ad_cf,c_mode, tot_it, out_intr, out_strt); 
    elseif nargin == 6
        aclab_go_set(ad_cf,c_mode, tot_it, out_intr, out_strt, out_end); 
    elseif nargin == 7
        aclab_go_set(ad_cf,c_mode, tot_it, out_intr, out_strt, out_end, out_plot); 
    elseif nargin == 8
        aclab_go_set(ad_cf,c_mode, tot_it, out_intr, out_strt, out_end, out_plot, out_imgs); 
    end
    
    f_path = PRMS_ACLAB.plot_path;
    
    %%% --- select random/non-random simulation -----------
   
    %randomizes random number sequence (NOT agent order)
    %if rndm_smltn is false, then simulation should be identical to previous for same initial values
    
    %if rndm_smltn true,  resets random seed for completely random simulation
    %if rndm_smltn false, loads old random seeds
    %                     so simulation should be identical to the previous one
    %                     (for the same initial conditions)
    
    if PRMS_ACLAB.c_mode == true
        rstate.r=rand('state');
        rstate.rn=randn('state');
        save zz_prev_rand.mat rstate
    else
        load zz_prev_rand
        rand('state',rstate.r);
        randn('state',rstate.rn);
    end
    
    %%% --- create objects --------------------------------
    
    %with parameters set in aclab_go_set
    
    [lab_ctnr]=create_lab(); %creates lab
                             %places it in a cell array called
                             %'lab_ctnr' (lab container)
      
    [agt_ctnr]=create_agents(); %creates child, caregiver, stranger agents
                                %places them in a cell array called
                                %'agt_ctnr' (agent container)
                                
    %%% --- set up messages and stas ----------------------                           
                           
    signal(agt_ctnr); %sets data structure for message exchance between child and caregiver
    set_stats();      %sets data structure for storing iteration values
    
    %%% ----------------------------------------------------------------------------
    %%% --- MODEL INITIALIZATION - END ---------------------------------------------
    %%% ----------------------------------------------------------------------------
    
    %%% ----------------------------------------------------------------------------
    %%% --- MODEL EXECUTION --------------------------------------------------------
    %%% ----------------------------------------------------------------------------
    
    strt_cnfg = true; %flag to call plot_stas on start configuration
    
    for n_it = 1:PRMS_ACLAB.tot_it %main execution loop
    
        N_IT = n_it;
        
        % -----------------------------------------------------------
        % --- PLAY AGENTS -------------------------------------------
        % -----------------------------------------------------------      
                      
        % --- PLOT_STATS ON START CONFIGURATION ---------------------
        if strt_cnfg
            plot_stats(agt_ctnr,lab_ctnr,strt_cnfg); %updates result figures and structures
            strt_cnfg = false;
            %mov(n_it)=getframe(fig3);
            %k01 = IT_STATS; %DEBUG
        end
        
        [agt_ctnr,lab_ctnr,n] = aclab_play_agents(agt_ctnr,lab_ctnr); %calls the rules
        %%% --- VALUES OF IT_STATS CHANGED AT THE END OF aclab_play_agents ONLY ---------
        %%% --- ALL OTHER FUNCTIONS READ FROM IT_STATS ONLY -----------------------------
        
        % --- PLOT_STATS ON FOLLOWING CONFIGURATIONS ----------------
        plot_stats(agt_ctnr,lab_ctnr,strt_cnfg); %updates result figures and structures
                
        % -----------------------------------------------------------
        % --- PLAY AGENTS --- END -----------------------------------
        % -----------------------------------------------------------
        
        %------------------------------------------
        if n<=0 %if no more agents, then stop simulation
            break
            disp('General convergence criteria satisfied - no agents in lab! > ')
        end
        %------------------------------------------
        
    end
    
    final_report_out = PRMS_ACLAB.final_report_out;
    
    %%% ----------------------------------------------------------------------------
    %%% --- MODEL EXECUTION - END --------------------------------------------------
    %%% ----------------------------------------------------------------------------

% save workspace in mat file
save(strcat(f_path,'aaa_results_c_mode_',...
            num2str(PRMS_ACLAB.c_mode),'_tot_it_',...
            num2str(PRMS_ACLAB.tot_it),'.mat'));
%eval(['save zz_results_c_mode_' num2str(PRMS_ACLAB.c_mode) '_tot_it_' num2str(PRMS_ACLAB.tot_it) '.mat IT_STATS PRMS_C_LAB' ]);

clear global
