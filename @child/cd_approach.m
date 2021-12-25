function [agt]=cd_approach(agt,lab)

%approach function for class CHILD
%agt: caregiver object

%CHILD APPROACH RULES - THIS IS HOW THE CHILD TAKES CF3 (ACTS TO REDUCE NEED FOR CF3)
%Child moves towards the caregiver, randomly otherwise:
%   - if caregiver is detected     (distance <= ex_range): moves toward caregiver
%   - If caregiver is not detected (distance > ex_range):  moves randomly (8 attempts available to move within lab edges)

% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%global  SIGNALS PRMS_ACLAB

size = get(lab,'size');
   
pos  = agt.pos;      %extract current position [x,y]
spd  = agt.speed;    %child move-speed in units per iteration
%spd  = agt.speed*rand;    
%exr  = agt.ex_range; %child exploration range

%moved = 0; %flag indicating whether child has successfully moved
           %will be set to 1 if child moves
                    
d      = lab.cd_cr_d;   %child-caregiver distance
cr_pos = lab.cr_pos;    %caregiver position
% -------------------------------------------------------------------

% -------------------------------------------------------------------
% --- if caregiver is detected -------------------------------------- 
% -------------------------------------------------------------------
%if d <= exr  
       
    % --- get close to caregiver -------------------------- 
    x_cr = cr_pos(:,1);
    y_cr = cr_pos(:,2);
    
    nx = x_cr + rand-0.5; %new x of child close to caregiver
    ny = y_cr + rand-0.5; %new y of child close to caregiver
    
    % --- spd is the maximum step possible ---------------- 
    if spd < d
        
        x_step = sqrt((x_cr-pos(1))^2);
        y_step = sqrt((y_cr-pos(2))^2);
        
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
        
    new_pos = [nx ny]; %new child-position close to caregiver
    % -------------------------------------------------
        
    %if new child-position is beyond edge of model, then adjust slightly
    shft=find(new_pos>=size);
    new_pos(shft)=size-rand;
    shft=find(new_pos<=1);
    new_pos(shft)=1+rand;
        
    % -------------------------------------------------
    %moved = 1; %child has found caregiver and moved close to them
    % -------------------------------------------------
    
%end
% -------------------------------------------------------------------
% -------------------------------------------------------------------
% -------------------------------------------------------------------

% -------------------------------------------------------------------
% --- if child has NOT moved toward caregiver -----------------------
% -------------------------------------------------------------------
% if moved == 0
% 
%     % --- child chooses a random direction to move in -----    
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
%         %check that child new position is within edges
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
