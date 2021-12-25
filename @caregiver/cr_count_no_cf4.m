function [agt,no_cf4_cntr]=cr_count_no_cf4(agt)

%No-cf4-count function for class CAREGIVER
%agt: caregiver object
%no_cf4_cntr: number of iterations without giving cf4
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

cf4_given = agt.need2give_cf4; %true when care given in current iteration

no_cf4_cntr = agt.no_cf4_cntr;

if cf4_given
    no_cf4_cntr = 0;
else
    no_cf4_cntr = no_cf4_cntr + 1;
end

agt.no_cf4_cntr = no_cf4_cntr;  %0 after Pg==0