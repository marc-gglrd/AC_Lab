function [agt]=cr_approach(agt,lab)

%approach function for class CAREGIVER
%agt: caregiver object

%CAREGIVER APPROACH RULES - THIS IS HOW THE CAREGIVER GIVES CF3
%Caregiver moves towards the child, randomly otherwise:
%   - if child is detected     (distance <= ex_range): moves toward child
%   - If child is not detected (distance > ex_range):  moves randomly (8 attempts available to move within lab edges)

% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%global  SIGNALS PRMS_ACLAB

size = get(lab,'size');

pos  = agt.pos;      %extract current position [x,y]
spd  = agt.speed;    %caregiver move-speed in units per iteration
%spd  = agt.speed*rand;
%exr  = agt.ex_range; %caregiver exploration range
                                                          
%moved = 0; %flag indicating whether caregiver has successfully moved
           %will be set to 1 if caregiver moves
                    
d      = lab.cd_cr_d;   %child-caregiver distance
cd_pos = lab.cd_pos;    %child position
% -------------------------------------------------------------------

% -------------------------------------------------------------------
% --- if child is detected ------------------------------------------ 
% -------------------------------------------------------------------
%if d <= exr 
    
    % --- get close to child ------------------------------
    x_cd = cd_pos(:,1);
    y_cd = cd_pos(:,2);
    
    nx = x_cd + rand-0.5; %new x of caregiver close to child
    ny = y_cd + rand-0.5; %new y of caregiver close to child
    
    % --- spd is the maximum step possible ---------------- 
    if spd < d
        
        x_step = sqrt((x_cd-pos(1))^2);
        y_step = sqrt((y_cd-pos(2))^2);
        
        if x_step~=0
            angle = acos(x_step/d);
        else
            angle = asin(y_step/d);
        end
        
        x_step = spd * cos(angle);
        y_step = spd * sin(angle);
        
        if nx >= pos(1)
           nx = pos(1) + x_step;
        else
           nx = pos(1) - x_step;
        end
        
        if ny >= pos(2)
           ny = pos(2) + y_step;
        else
           ny = pos(2) - y_step;
        end
        
    end
        
    new_pos = [nx ny]; %new caregiver-position close to child
    % -------------------------------------------------
        
    %if new caregiver-position is beyond edge of model, then adjust slightly
    shft=find(new_pos>=size);
    new_pos(shft)=size-rand;
    shft=find(new_pos<=1);
    new_pos(shft)=1+rand;
        
    % -------------------------------------------------
    %moved = 1; %caregiver has found child and moved close to them
    % -------------------------------------------------
    
%end
% -------------------------------------------------------------------
% -------------------------------------------------------------------
% -------------------------------------------------------------------

% -------------------------------------------------------------------
% --- if caregiver has NOT moved toward child -----------------------
% -------------------------------------------------------------------
% if moved == 0
% 
%     % --- caregiver chooses a random direction to move in -----    
%     cnt = 1;
%     dir = rand * 2 * pi; 
%     
%     while moved == 0 & cnt <= 8 
%     %8 attempts available to move within lab edges
%     
%         new_pos(1)=pos(1)+spd*cos(dir); %new x co-ordinate
%         new_pos(2)=pos(2)+spd*sin(dir); %new y co-ordinate
%         
%         if new_pos(1)<size&new_pos(2)<size&new_pos(1)>=1&new_pos(2)>=1 
%         %check that caregiver new position is within edges
%            moved = 1;
%         end
%         
%         cnt = cnt + 1;
%         dir = dir + (pi/4);
%         %if move not successful, increment direction by 45° and try again
%         
%     end
%     
% end
% -------------------------------------------------------------------
% -------------------------------------------------------------------
% -------------------------------------------------------------------

%if moved==1
    agt.pos=new_pos; %update agent position
%end

