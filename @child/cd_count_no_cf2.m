function [agt,no_cf2_cntr]=cd_count_no_cf2(agt,set_value)

%No-cf2-count function for class CHILD
%agt: child object
%no_cf2_cntr: number of iterations without receiving cf2
%set_value: value to be set as no_cf2_cntr
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

agt.no_cf2_cntr = set_value;

no_cf2_cntr     = set_value;