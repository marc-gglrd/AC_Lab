function signal(agt_ctnr)

%sets/updates data structure representing signals agents send to each other
%(i.e. the info - messages - they exchanhe)
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%SIGNALS: data structure containing info that agents exchange
   %    SIGNALS.atype: n x 1 array listing the type of each agent in the model
   %    SIGNALS.pos: list of every agent position in [x y]
   %    MESSAGE.out: n x 1 array containing true for agents that are out in the current iteration
   
%%% --- AFTER SET UP ----------------------------------------------------------
%%% --- VALUES OF SIGNALS UPDATED AT THE END OF aclab_play_agents ONLY --------
%%% --- ALL OTHER FUNCTIONS READ FROM SIGNALS ONLY ----------------------------
   
 global SIGNALS PRMS_ACLAB
 
 for ndx=1:length(agt_ctnr)
     % ----------------------------------------------------
     % --- messages sent by child -------------------------
     % ----------------------------------------------------
     if isa(agt_ctnr{ndx},'child')
        SIGNALS.atype(ndx)      = PRMS_ACLAB.type_cd;              %agent is child
        SIGNALS.pos(ndx,:)      = get(agt_ctnr{ndx},'pos');        %position of child
        SIGNALS.need4_cf2(ndx)  = get(agt_ctnr{ndx},'need4_cf2');  %child needs to get cf2 (true/false)
        SIGNALS.need4_cf3(ndx)  = get(agt_ctnr{ndx},'need4_cf3');  %child needs to get cf3 (true/false)
        SIGNALS.need4_cf4(ndx)  = get(agt_ctnr{ndx},'need4_cf4');  %child needs to get cf4 (true/false)
        SIGNALS.p2need_cf2(ndx) = get(agt_ctnr{ndx},'p2need_cf2'); %probability to need cf2
        SIGNALS.p2need_cf3(ndx) = get(agt_ctnr{ndx},'p2need_cf3'); %probability to need cf3
        SIGNALS.p2need_cf4(ndx) = get(agt_ctnr{ndx},'p2need_cf4'); %probability to need cf4
        SIGNALS.cf2_ed(ndx)     = get(agt_ctnr{ndx},'cf2_ed');     %cf2 emotional distance (0 to 100)
        SIGNALS.cf3_pd(ndx)     = get(agt_ctnr{ndx},'cf3_pd');     %cf3 physical  distance (0 to 100)
        SIGNALS.cf4_vu(ndx)     = get(agt_ctnr{ndx},'cf4_vu');     %cf4 vulnerability      (0 to 100)
     % ----------------------------------------------------
     % --- messages sent by caregiver ---------------------
     % ----------------------------------------------------
     elseif isa(agt_ctnr{ndx},'caregiver')
        SIGNALS.atype(ndx)         = PRMS_ACLAB.type_cr;                 %agent is caregiver
        SIGNALS.pos(ndx,:)         = get(agt_ctnr{ndx},'pos');           %position of caregiver
        SIGNALS.need2give_cf2(ndx) = get(agt_ctnr{ndx},'need2give_cf2'); %caregiver needs to give cf2 (true/false)
        SIGNALS.need2give_cf3(ndx) = get(agt_ctnr{ndx},'need2give_cf3'); %caregiver needs to give cf3 (true/false)
        SIGNALS.need2give_cf4(ndx) = get(agt_ctnr{ndx},'need2give_cf4'); %caregiver needs to give cf4 (true/false)
        SIGNALS.p2give_cf2(ndx)    = get(agt_ctnr{ndx},'p2give_cf2');    %probability to give cf2
        SIGNALS.p2give_cf3(ndx)    = get(agt_ctnr{ndx},'p2give_cf3');    %probability to give cf3
        SIGNALS.p2give_cf4(ndx)    = get(agt_ctnr{ndx},'p2give_cf4');    %probability to give cf4
        SIGNALS.cf2_ed(ndx)        = get(agt_ctnr{ndx},'cf2_ed');        %cf2 emotional distance (0 to 100)
        SIGNALS.cf3_pd(ndx)        = get(agt_ctnr{ndx},'cf3_pd');        %cf3 physical  distance (0 to 100)
        SIGNALS.cf4_vu(ndx)        = get(agt_ctnr{ndx},'cf4_vu');        %cf4 vulnerability      (0 to 100)
     % ----------------------------------------------------
     % --- messages sent by stranger ----------------------
     % ----------------------------------------------------
     elseif isa(agt_ctnr{ndx},'stranger')
        SIGNALS.atype(ndx) = PRMS_ACLAB.type_sr;       %agent is stranger
        SIGNALS.pos(ndx,:) = get(agt_ctnr{ndx},'pos'); %position of stranger
     else
        %ERROR MESSAGE
     end
     SIGNALS.out(ndx) = false;
 end
     
