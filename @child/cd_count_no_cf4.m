function [agt,no_cf4_cntr]=cd_count_no_cf4(agt,set_value)

%No-cf4-count function for class CHILD
%agt: child object
%no_cf4_cntr: number of iterations without receiving cf4
%set_value: value to be set as no_cf4_cntr
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

agt.no_cf4_cntr = set_value;

no_cf4_cntr     = set_value;