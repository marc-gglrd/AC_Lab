function [agt_ctnr,lab_ctnr,n_in]=aclab_play_agents(agt_ctnr,lab_ctnr)

%Calls functions to apply rules to agents
%agt_ctnr: agent container
%lab_ctnr: lab container
%n_in: total number of agents in lab at end of iteration
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB SIGNALS IT_STATS N_IT

n       = length(agt_ctnr); %no. of agents
n_in    = 0;                %no. of agents in at end of iteration
n_cd_in = 0;                %no. of children in at end of iteration
n_cr_in = 0;                %no. of caregivers in at end of iteration

this_lab = lab_ctnr{1};

% --- dimension/feature activation ----
cf2_on = PRMS_ACLAB.cf2_on;
cf3_on = PRMS_ACLAB.cf3_on;
cf4_on = PRMS_ACLAB.cf4_on;
% -------------------------------------

% --- ed-pd-vu-tolerance --------------
ed_tlrnc = PRMS_ACLAB.ed_tlrnc;
pd_tlrnc = PRMS_ACLAB.pd_tlrnc;
vu_tlrnc = PRMS_ACLAB.vu_tlrnc;
% -------------------------------------

%execute agent update loop
for ndx=1:n %for each agent
	ct_agt = agt_ctnr{ndx}; %current agent in the cell array agent container
    
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %+++ CHILD ++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if isa(ct_agt,'child') %current agent is child
        
        %%% -----------------------------------------------------------------
        %%% --- UPDATE CHILD INDIFFERENCE & DISTANCING ----------------------
        %%% -----------------------------------------------------------------

        % --- child -------------------------------------
        [ct_agt,cd_i,cd_d,cd_D]=cd_update_idd(ct_agt,this_lab);
        %[curr_cd]=cd_update_tf(curr_cd,curr_cr);

        %%% -----------------------------------------------------------------
        %%% --- UPDATE CHILD ED & PD ----------------------------------------
        %%% -----------------------------------------------------------------

        %--------------------------------------------------
        [ct_agt,cf2_ed_cd,cf3_pd_cd,cf4_vu_cd] = cd_update_ed_pd_vu(ct_agt);     
        %%% -----------------------------------------------------------------
        %%% -----------------------------------------------------------------
        %%% -----------------------------------------------------------------
        
        last_need4_cf2 = ct_agt.need4_cf2;
        last_need4_cf3 = ct_agt.need4_cf3;
        last_need4_cf4 = ct_agt.need4_cf4;
        
        cd_ndx_xplrd = 0;
        
        %+++ cd ad2 +++++++++++++++++++++++++++++++++++++++++++++++++
        if cf2_on
        % - At-Ex RULES - cf2 -----------------------------
        [ct_agt,need4_cf2,p2need_cf2,p2need_cf2_x] = cd_get_need4_cf2(ct_agt,this_lab); 
        %child feels need4_cf2 or not
        else
            need4_cf2 = false;
        end
        %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        
        %+++ cd ad3 +++++++++++++++++++++++++++++++++++++++++++++++++
        if cf3_on
        % - At-Ex RULES - cf3 -----------------------------
        [ct_agt,need4_cf3,p2need_cf3,p2need_cf3_x] = cd_get_need4_cf3(ct_agt,this_lab);
        %child feels need4_cf3 or not     
        else
            need4_cf3 = false;
        end
        %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        
        %+++ cd ad4 +++++++++++++++++++++++++++++++++++++++++++++++++
        if cf4_on
        % - At-Ex RULES - cf4 -----------------------------
        [ct_agt,need4_cf4,p2need_cf4,p2need_cf4_x] = cd_get_need4_cf4(ct_agt,this_lab);
        %child feels need4_cf4 or not     
        else
            need4_cf4 = false;
        end
        %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        
        % -----------------------------------------------------------
        % - CD APPROACH/EXPLORE -------------------------------------
        % -----------------------------------------------------------
        if PRMS_ACLAB.last_need
            need4_cf2 = last_need4_cf2;
            need4_cf3 = last_need4_cf3;
            need4_cf4 = last_need4_cf4;
        end
        
        [ct_agt,cd_do_ex,cd_do_ap] = cd_decide(ct_agt,...
                                               this_lab,...
                                               cf2_on,...
                                               need4_cf2,...
                                               cf3_on,...
                                               need4_cf3,...
                                               cf4_on,...
                                               need4_cf4);
        %%!!!warning!!! matlab error if cd_explore & cd_approach called inside cd_take_action 
        %%!!!warning!!! (error must be in function calling management)
        
        if cd_do_ex
            [ct_agt,cd_ndx_xplrd] = cd_explore(ct_agt,this_lab);
        elseif cd_do_ap
            ct_agt = cd_approach(ct_agt,this_lab);
        end
        % -----------------------------------------------------------
        % -----------------------------------------------------------
        % -----------------------------------------------------------
               
        cd_new_pos = ct_agt.pos; 
        % -----------------------------------------------------------
        % -----------------------------------------------------------
        % -----------------------------------------------------------
               
        agt_ctnr{ndx}=ct_agt; %update cell array with modified agent data structure
        
        curr_cd = ct_agt;
        
        if ~SIGNALS.out(ndx)
            n_cd_in = n_cd_in + 1;
        end
        
        PRMS_ACLAB.cd_explore  = cd_do_ex;        
        PRMS_ACLAB.cd_approach = cd_do_ap;     
        
    end
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %+++ CAREGIVER ++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if isa(ct_agt,'caregiver') %current agent is caregiver
        
        %%% -----------------------------------------------------------------
        %%% --- UPDATE CAREGIVER INDIFFERENCE & DISTANCING ------------------
        %%% -----------------------------------------------------------------

        % --- caregiver ---------------------------------
        [ct_agt,cr_i,cr_d,cr_D]=cr_update_idd(ct_agt,this_lab);
        %[curr_cr]=cr_update_tf(curr_cr,curr_cd);

        %%% -----------------------------------------------------------------
        %%% --- UPDATE CAREGIVER ED & PD ------------------------------------
        %%% -----------------------------------------------------------------

        %--------------------------------------------------
        [ct_agt,cf2_ed_cr,cf3_pd_cr,cf4_vu_cr] = cr_update_ed_pd_vu(ct_agt); 
        %%% -----------------------------------------------------------------
        %%% -----------------------------------------------------------------
        %%% -----------------------------------------------------------------
        
        last_need2give_cf2 = ct_agt.need2give_cf2;
        last_need2give_cf3 = ct_agt.need2give_cf3;
        last_need2give_cf4 = ct_agt.need2give_cf4;
        
        cr_ndx_xplrd = 0;
        
        %+++ cr cf2 +++++++++++++++++++++++++++++++++++++++++++++++++
        if cf2_on
        % - Ca-Ex RULES - cf2 -----------------------------
        [ct_agt,need2give_cf2,p2give_cf2,p2give_cf2_x] = cr_get_need2give_cf2(ct_agt,this_lab); 
        %caregiver feels need2give_cf2 or not
        else
            need2give_cf2 = false;
        end
        %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        %+++ cr cf3 +++++++++++++++++++++++++++++++++++++++++++++++++
        if cf3_on
        % - Ca-Ex RULES - cf3 -----------------------------
        [ct_agt,need2give_cf3,p2give_cf3,p2give_cf3_x] = cr_get_need2give_cf3(ct_agt,this_lab);      
        %caregiver feels need2give_cf3 or not
        else
            need2give_cf3 = false;
        end
        %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        
        %+++ cr cf4 +++++++++++++++++++++++++++++++++++++++++++++++++
        if cf4_on
        % - Ca-Ex RULES - cf4 -----------------------------
        [ct_agt,need2give_cf4,p2give_cf4,p2give_cf4_x] = cr_get_need2give_cf4(ct_agt,this_lab);      
        %caregiver feels need2give_cf4 or not
        else
            need2give_cf4 = false;
        end
        %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        
        % -----------------------------------------------------------
        % - CR APPROACH/EXPLORE -------------------------------------
        % -----------------------------------------------------------
        if PRMS_ACLAB.last_need
            need2give_cf2 = last_need2give_cf2;
            need2give_cf3 = last_need2give_cf3;
            need2give_cf4 = last_need2give_cf4;
        end
        
        [ct_agt,cr_do_ex,cr_do_ap] = cr_decide(ct_agt,...
                                               this_lab,...
                                               cf2_on,...
                                               need2give_cf2,...
                                               cf3_on,...
                                               need2give_cf3,...
                                               cf4_on,...
                                               need2give_cf4);
        %%!!!warning!!! matlab error if cr_explore & cr_approach called inside cr_take_action 
        %%!!!warning!!! (error must be in function calling management)
        
        if cr_do_ex
            [ct_agt,cr_ndx_xplrd] = cr_explore(ct_agt,this_lab);
        elseif cr_do_ap
            ct_agt = cr_approach(ct_agt,this_lab);
        end
        % -----------------------------------------------------------
        % -----------------------------------------------------------
        % -----------------------------------------------------------
        
        cr_new_pos = ct_agt.pos;   
        % -----------------------------------------------------------
        % -----------------------------------------------------------
        % -----------------------------------------------------------
        
        agt_ctnr{ndx}=ct_agt; %update cell array with modified agent data structure
        
        curr_cr = ct_agt;
        
        if ~SIGNALS.out(ndx)
            n_cr_in = n_cr_in + 1;
        end
        
        PRMS_ACLAB.cr_explore  = cr_do_ex;        
        PRMS_ACLAB.cr_approach = cr_do_ap;
        
    end
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    %++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       
    n_in = n_cd_in + n_cr_in;
        
end

%%% -----------------------------------------------------------------
%%% --- UPDATE OBJECT-ACTIVATION STATUS -----------------------------
%%% -----------------------------------------------------------------
[this_lab]  = update_objs4cd_act(this_lab,cd_ndx_xplrd);%objs4cd is active if of interest to child
%lab_ctnr{1} = this_lab;

[this_lab]  = update_objs4cr_act(this_lab,cr_ndx_xplrd);%objs4cr is active if of interest to caregiver
%lab_ctnr{1} = this_lab;

%%% -----------------------------------------------------------------
%%% --- UPDATE LAB DISTANCE -----------------------------------------
%%% -----------------------------------------------------------------

this_lab.cd_pos  = cd_new_pos;
this_lab.cr_pos  = cr_new_pos;
this_lab.cd_cr_d = calculate_cd_cr_d(this_lab); %lab distance in lab object

%%% -----------------------------------------------------------------
%%% --- UPDATE CHILD & CAREGIVER NO CF-COUNTERS ---------------------
%%% -----------------------------------------------------------------

%caregiver's counter drives the update
%(CR-counter is 0 after Pg==0)

if cf2_on
    cntr_delay = false;
    %cntr_delay = true;%TRICK<---- OK
    %cntr_delay = false;%ALSO OK<---------
    %true  for child counter shifted 1 iteration right (takes previous caregiver counter value)
    %false for same child-caregiver counter
   
    if cntr_delay %1 iteration delay of CD counter
        % --- child -------------------------------------
        [curr_cd,no_cf2_cntr]=cd_count_no_cf2(curr_cd,curr_cr.no_cf2_cntr);
        % --- caregiver ---------------------------------
        [curr_cr,no_cf2_cntr]=cr_count_no_cf2(curr_cr);
    else %same counter
        % --- caregiver ---------------------------------
        [curr_cr,no_cf2_cntr]=cr_count_no_cf2(curr_cr);
        % --- child -------------------------------------
        [curr_cd,no_cf2_cntr]=cd_count_no_cf2(curr_cd,curr_cr.no_cf2_cntr);
    end
    
end

if cf3_on %caregiver to be updated first
    cntr_delay = false;
    %cntr_delay = true;%TRICK
    %true  for child counter shifted 1 iteration right (takes previous caregiver counter value)
    %false for same child-caregiver counter
   
    if cntr_delay %1 iteration delay of CD counter
        % --- child -------------------------------------
        [curr_cd,no_cf3_cntr]=cd_count_no_cf3(curr_cd,curr_cr.no_cf3_cntr);
        % --- caregiver ---------------------------------
        [curr_cr,no_cf3_cntr]=cr_count_no_cf3(curr_cr);
    else %same counter
        % --- caregiver ---------------------------------
        [curr_cr,no_cf3_cntr]=cr_count_no_cf3(curr_cr);
        % --- child -------------------------------------
        [curr_cd,no_cf3_cntr]=cd_count_no_cf3(curr_cd,curr_cr.no_cf3_cntr);
    end
    
end

if cf4_on %caregiver to be updated first
    cntr_delay = false;
    %true  for child counter shifted 1 iteration right (takes previous caregiver counter value)
    %false for same child-caregiver counter
   
    if cntr_delay %1 iteration delay of CD counter
        % --- child -------------------------------------
        [curr_cd,no_cf4_cntr]=cd_count_no_cf4(curr_cd,curr_cr.no_cf4_cntr);
        % --- caregiver ---------------------------------
        [curr_cr,no_cf4_cntr]=cr_count_no_cf4(curr_cr);
    else %same counter
        % --- caregiver ---------------------------------
        [curr_cr,no_cf4_cntr]=cr_count_no_cf4(curr_cr);
        % --- child -------------------------------------
        [curr_cd,no_cf4_cntr]=cd_count_no_cf4(curr_cd,curr_cr.no_cf4_cntr);
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- update objects ----------------------------------------------
lab_ctnr{1} = this_lab;
agt_ctnr{1} = curr_cd;
agt_ctnr{2} = curr_cr;
%%% -----------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% -----------------------------------------------------------------
%%% --- EXCHANGE MESSAGES THROUGH SIGNALS ---------------------------
%%% -----------------------------------------------------------------

%SIGNALS to be written here only
signal(agt_ctnr);

%%% -----------------------------------------------------------------
%%% --- WRITE VALUES TO IT_STATS ------------------------------------
%%% -----------------------------------------------------------------

%IT_STATS to be written here only  
n_it = update_stats(n_cd_in,n_cr_in,curr_cd,curr_cr);

