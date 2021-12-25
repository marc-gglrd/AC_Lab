function [agt,no_cf2_cntr]=cr_count_no_cf2(agt)

%No-cf2-count function for class CAREGIVER
%agt: caregiver object
%no_cf2_cntr: number of iterations without giving cf2
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

cf2_given = agt.need2give_cf2; %true when care given in current iteration

no_cf2_cntr = agt.no_cf2_cntr;

if cf2_given
    no_cf2_cntr = 0;
else
    no_cf2_cntr = no_cf2_cntr + 1;
end

agt.no_cf2_cntr = no_cf2_cntr;  %0 after Pg==0
