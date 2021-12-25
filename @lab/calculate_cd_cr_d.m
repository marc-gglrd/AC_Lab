function [d]=calculate_cd_cr_d(lab)

%child-caregiver distance function for class LAB
%calculates distance between child and caregiver in the lab
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

cd_x = lab.cd_pos(1); %child x position
cd_y = lab.cd_pos(2); %child y position

cr_x = lab.cr_pos(1); %caregiver x position
cr_y = lab.cr_pos(2); %caregiver y position

d = sqrt((cd_x-cr_x)^2+(cd_y-cr_y)^2); %child-caregiver distance
          
          

