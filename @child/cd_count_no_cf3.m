function [agt,no_cf3_cntr]=cd_count_no_cf3(agt,set_value)

%No-cf3-count function for class CHILD
%agt: child object
%no_cf3_cntr: number of iterations without receiving cf3
%set_value: value to be set as no_cf3_cntr
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

agt.no_cf3_cntr = set_value;

no_cf3_cntr     = set_value;