%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% select active dimension and its value %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
%to read intermediate value
%e.g. 'av043' for Av = 0.43
%     'am043' for Am = 0.43
is_av = strcmp('av',extractBetween(ad_cf,1,2));
is_am = strcmp('am',extractBetween(ad_cf,1,2));
x_v_az = extractAfter(ad_cf,3);                    %value after zero
x_v    = str2double(x_v_az)/(10^strlength(x_v_az));%value
% ----------------------------------
    if strcmp(ad_cf,'av01')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.1; 
        PRMS_ACLAB.ad3_cf3 = 0.1;
        PRMS_ACLAB.ad4_cf4 = 0.1;
    elseif strcmp(ad_cf,'av02')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.2; 
        PRMS_ACLAB.ad3_cf3 = 0.2;
        PRMS_ACLAB.ad4_cf4 = 0.2;
    elseif strcmp(ad_cf,'av03')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.3; 
        PRMS_ACLAB.ad3_cf3 = 0.3;
        PRMS_ACLAB.ad4_cf4 = 0.3;
    elseif strcmp(ad_cf,'av04')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.4; 
        PRMS_ACLAB.ad3_cf3 = 0.4;
        PRMS_ACLAB.ad4_cf4 = 0.4;
    elseif strcmp(ad_cf,'av05')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.5; 
        PRMS_ACLAB.ad3_cf3 = 0.5;
        PRMS_ACLAB.ad4_cf4 = 0.5;
    elseif strcmp(ad_cf,'av06')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.6; 
        PRMS_ACLAB.ad3_cf3 = 0.6;
        PRMS_ACLAB.ad4_cf4 = 0.6;
    elseif strcmp(ad_cf,'av07')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.7; 
        PRMS_ACLAB.ad3_cf3 = 0.7;
        PRMS_ACLAB.ad4_cf4 = 0.7;
    elseif strcmp(ad_cf,'av08')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.8; 
        PRMS_ACLAB.ad3_cf3 = 0.8;
        PRMS_ACLAB.ad4_cf4 = 0.8;
    elseif strcmp(ad_cf,'av09')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.9; 
        PRMS_ACLAB.ad3_cf3 = 0.9;
        PRMS_ACLAB.ad4_cf4 = 0.9;
    %----------------------------------
    elseif is_av %read intermediate value (e.g. 'av043' for Av = 0.43)
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = x_v; 
        PRMS_ACLAB.ad3_cf3 = x_v;
        PRMS_ACLAB.ad4_cf4 = x_v;
    %----------------------------------
    elseif strcmp(ad_cf,'am01')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.1; 
        PRMS_ACLAB.ad3_cf3 = 0.1;
        PRMS_ACLAB.ad4_cf4 = 0.1;
    elseif strcmp(ad_cf,'am02')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.2; 
        PRMS_ACLAB.ad3_cf3 = 0.2;
        PRMS_ACLAB.ad4_cf4 = 0.2;
    elseif strcmp(ad_cf,'am03')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.3; 
        PRMS_ACLAB.ad3_cf3 = 0.3;
        PRMS_ACLAB.ad4_cf4 = 0.3;
    elseif strcmp(ad_cf,'am04')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.4; 
        PRMS_ACLAB.ad3_cf3 = 0.4;
        PRMS_ACLAB.ad4_cf4 = 0.4;
    elseif strcmp(ad_cf,'am05')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.5; 
        PRMS_ACLAB.ad3_cf3 = 0.5;
        PRMS_ACLAB.ad4_cf4 = 0.5;
    elseif strcmp(ad_cf,'am06')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.6; 
        PRMS_ACLAB.ad3_cf3 = 0.6;
        PRMS_ACLAB.ad4_cf4 = 0.6;
    elseif strcmp(ad_cf,'am07')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.7; 
        PRMS_ACLAB.ad3_cf3 = 0.7;
        PRMS_ACLAB.ad4_cf4 = 0.7;
    elseif strcmp(ad_cf,'am08')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.8; 
        PRMS_ACLAB.ad3_cf3 = 0.8;
        PRMS_ACLAB.ad4_cf4 = 0.8;
    elseif strcmp(ad_cf,'am09')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.9; 
        PRMS_ACLAB.ad3_cf3 = 0.9;
        PRMS_ACLAB.ad4_cf4 = 0.9; 
    %----------------------------------
    elseif is_am %read intermediate value (e.g. 'am043' for Am = 0.43)
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = x_v; 
        PRMS_ACLAB.ad3_cf3 = x_v;
        PRMS_ACLAB.ad4_cf4 = x_v;
    %----------------------------------
    elseif strcmp(ad_cf,'ph01')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.1; 
        PRMS_ACLAB.ad3_cf3 = 0.1;
        PRMS_ACLAB.ad4_cf4 = 0.1;
    elseif strcmp(ad_cf,'ph02')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.2; 
        PRMS_ACLAB.ad3_cf3 = 0.2;
        PRMS_ACLAB.ad4_cf4 = 0.2;
    elseif strcmp(ad_cf,'ph03')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.3; 
        PRMS_ACLAB.ad3_cf3 = 0.3;
        PRMS_ACLAB.ad4_cf4 = 0.3;
    elseif strcmp(ad_cf,'ph04')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.4; 
        PRMS_ACLAB.ad3_cf3 = 0.4;
        PRMS_ACLAB.ad4_cf4 = 0.4;
    elseif strcmp(ad_cf,'ph05')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.5; 
        PRMS_ACLAB.ad3_cf3 = 0.5;
        PRMS_ACLAB.ad4_cf4 = 0.5;
    elseif strcmp(ad_cf,'ph06')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.6; 
        PRMS_ACLAB.ad3_cf3 = 0.6;
        PRMS_ACLAB.ad4_cf4 = 0.6;
    elseif strcmp(ad_cf,'ph07')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.7; 
        PRMS_ACLAB.ad3_cf3 = 0.7;
        PRMS_ACLAB.ad4_cf4 = 0.7;
    elseif strcmp(ad_cf,'ph08')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.8; 
        PRMS_ACLAB.ad3_cf3 = 0.8;
        PRMS_ACLAB.ad4_cf4 = 0.8;
    elseif strcmp(ad_cf,'ph09')
        PRMS_ACLAB.cf2_on = false;
        PRMS_ACLAB.cf3_on = false;
        PRMS_ACLAB.cf4_on = true;
        PRMS_ACLAB.ad2_cf2 = 0.9; 
        PRMS_ACLAB.ad3_cf3 = 0.9;
        PRMS_ACLAB.ad4_cf4 = 0.9;    
    elseif strcmp(ad_cf,'aa01')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.1; 
        PRMS_ACLAB.ad3_cf3 = 0.1;
        PRMS_ACLAB.ad4_cf4 = 0.1;
    elseif strcmp(ad_cf,'aa02')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.2; 
        PRMS_ACLAB.ad3_cf3 = 0.2;
        PRMS_ACLAB.ad4_cf4 = 0.2;
    elseif strcmp(ad_cf,'aa03')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.3; 
        PRMS_ACLAB.ad3_cf3 = 0.3;
        PRMS_ACLAB.ad4_cf4 = 0.3;
    elseif strcmp(ad_cf,'aa04')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.4; 
        PRMS_ACLAB.ad3_cf3 = 0.4;
        PRMS_ACLAB.ad4_cf4 = 0.4;
    elseif strcmp(ad_cf,'aa05')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.5; 
        PRMS_ACLAB.ad3_cf3 = 0.5;
        PRMS_ACLAB.ad4_cf4 = 0.5;
    elseif strcmp(ad_cf,'aa06')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.6; 
        PRMS_ACLAB.ad3_cf3 = 0.6;
        PRMS_ACLAB.ad4_cf4 = 0.6;
    elseif strcmp(ad_cf,'aa07')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.7; 
        PRMS_ACLAB.ad3_cf3 = 0.7;
        PRMS_ACLAB.ad4_cf4 = 0.7;
    elseif strcmp(ad_cf,'aa08')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.8; 
        PRMS_ACLAB.ad3_cf3 = 0.8;
        PRMS_ACLAB.ad4_cf4 = 0.8;
    elseif strcmp(ad_cf,'aa09')
        PRMS_ACLAB.cf2_on = true;
        PRMS_ACLAB.cf3_on = true;
        PRMS_ACLAB.cf4_on = false;
        PRMS_ACLAB.ad2_cf2 = 0.9; 
        PRMS_ACLAB.ad3_cf3 = 0.9;
        PRMS_ACLAB.ad4_cf4 = 0.9;
    end