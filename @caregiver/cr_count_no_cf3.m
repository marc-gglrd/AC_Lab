function [agt,no_cf3_cntr]=cr_count_no_cf3(agt)

%No-cf3-count function for class CAREGIVER
%agt: caregiver object
%no_cf3_cntr: number of iterations without giving cf3
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

cf3_given = agt.need2give_cf3; %true when care given in current iteration

no_cf3_cntr = agt.no_cf3_cntr;

if cf3_given
    no_cf3_cntr = 0;
else
    no_cf3_cntr = no_cf3_cntr + 1;
end

agt.no_cf3_cntr = no_cf3_cntr;  %0 after Pg==0