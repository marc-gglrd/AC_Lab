function [agt,imprinted]=imprint_ad2(wm)

%ad2 imprint-function for class IWM
%agt: iwm object
%imprinted: true if new value of ad2 is imprinted, false otherwise
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%IMPRINTING RULE
%Tracks cf2 provided by the caregiver and updates ad2 accordingly
%ad2 can be:
% - leaved unchanged: if current value is not different enough from past value
% - increased: if current value is greater enough than past value
% - decreased: if current value is smaller enough than past value

global PARAM IT_STATS N_IT 

