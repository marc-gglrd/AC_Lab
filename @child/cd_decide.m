function [agt,ex_done,ap_done]=cd_decide(agt,lab,cf2_on,need_cf2,cf3_on,need_cf3,cf4_on,need_cf4)

%CHILD function to take action
%agt: child object
%lab: lab object
%cf2_on: true when cf2 is on
%need_cf2: true when need for cf2
%cf3_on: true when cf3 is on
%need_cf3: true when need for cf3
%ex_done:  true if exploration done, 0 otherwise
%ap_done: true if approach     done, 0 otherwise
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB

% --- ed-pd-vu-tolerance --------------
ed_tlrnc = PRMS_ACLAB.ed_tlrnc;
pd_tlrnc = PRMS_ACLAB.pd_tlrnc;
vu_tlrnc = PRMS_ACLAB.vu_tlrnc;
% -------------------------------------

ed        = agt.cf2_ed;      % agent e-distance
target_ed = agt.cf2_ed_trgt; % agent target e-distance

pd        = agt.cf3_pd;      % agent p-distance
target_pd = agt.cf3_pd_trgt; % agent target p-distance

vu        = agt.cf4_vu;      % agent vulnerability
target_vu = agt.cf4_vu_trgt; % agent target vulnerability

ex_done = false;
ap_done = false;
        
% -----------------------------------------------------------
% - APPROACH/EXPLORE ----------------------------------------
% -----------------------------------------------------------
% if need_cf2 == false && need_cf3 == false
%     if (cf2_on && (ed < (ed_tlrnc * target_ed))) ||...
%        (cf3_on && (pd < (pd_tlrnc * target_pd)))
%         %[agt,ndx_xplrd] = cd_explore(agt,lab); %EXPLORE
%         ex_done = true;
%     end
% else
%     if (cf2_on && (ed > (ed_tlrnc * target_ed))) ||...
%        (cf3_on && (pd > (pd_tlrnc * target_pd)))
%         %agt = cd_approach(agt,lab);            %APPROACH
%         ap_done = true;
%     end
% end
%--------------------------------------------------------------------
% if need_cf2 == false && need_cf3 == false
%     if (cf2_on && (ed < (ed_tlrnc * target_ed))) ||...
%        (cf3_on && (pd < (pd_tlrnc * target_pd)))
%         ex_done = true;%EXPLORE
%     end
% elseif need_cf2 == true && need_cf3 == true
%     if (cf2_on && (ed > (ed_tlrnc * target_ed))) ||...
%        (cf3_on && (pd > (pd_tlrnc * target_pd)))
%         ap_done = true;%APPROACH
%     end
% elseif need_cf2 == true && need_cf3 == false
%     if (cf2_on && (ed > (ed_tlrnc * target_ed))) 
%         ap_done = true;%APPROACH
%     end
%     if (cf3_on && (pd < (pd_tlrnc * target_pd)))
%         ex_done = true;%EXPLORE
%     end
% elseif need_cf2 == false && need_cf3 == true
%     if (cf2_on && (ed < (ed_tlrnc * target_ed)))
%         ex_done = true;%EXPLORE
%     end
%     if (cf3_on && (pd > (pd_tlrnc * target_pd)))
%         ap_done = true;%APPROACH
%     end
% end
%--------------------------------------------------------------------

%--- cf2 only -----------------------------------
if cf2_on == true
    if need_cf2 == false
        if ed < (ed_tlrnc * target_ed) %&&...
           %ed > (target_ed - (ed_tlrnc * target_ed))
            ex_done = true;%EXPLORE
        end
    elseif need_cf2 == true
        if ed > (ed_tlrnc * target_ed) %||...
           %ed < (target_ed - (ed_tlrnc * target_ed))
            ap_done = true;%APPROACH
        end
    end
end
%--- cf2 only - end -----------------------------

%--- cf3 only -----------------------------------
if cf3_on == true
    if need_cf3 == false
        if pd < (pd_tlrnc * target_pd) %&&...
           %pd > (target_pd - (pd_tlrnc * target_pd))
            ex_done = true;%EXPLORE
        end
    elseif need_cf3 == true
        if pd > (pd_tlrnc * target_pd) %||...
           %pd < (target_pd - (pd_tlrnc * target_pd))
            ap_done = true;%APPROACH
        end
    end
end
%--- cf3 only - end -----------------------------

%--- cf4 only -----------------------------------
if cf4_on == true
    if need_cf4 == false
        if vu < (vu_tlrnc * target_vu) %&&...
           %vu > (target_vu - (vu_tlrnc * target_vu))
            ex_done = true;%EXPLORE
        end
    elseif need_cf4 == true
        if vu > (vu_tlrnc * target_vu) %||...
           %vu < (target_vu - (vu_tlrnc * target_vu))
            ap_done = true;%APPROACH
        end
    end
end
%--- cf4 only - end -----------------------------

% if ex_done == true && ap_done == true
%     if rand > 0.5
%         ex_done = false;
%     else
%         ap_done = false;
%     end
% end