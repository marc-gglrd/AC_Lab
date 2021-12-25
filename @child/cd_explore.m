function [agt,ndx_xplrd]=cd_explore(agt,lab)

%explore function for class CHILD
%agt: child object

%CHILD EXPLORE RULES - to be applied if no need for care
%Child moves towards the nearest active obj4cd, randomly otherwise:
%Child finds obj4cds around them in radius exr, considering active obj4cds only:
%   - if obj4cd is found: gets close to the nearest obj4cd
%   - If obj4cd is not found: moves randomly (8 attempts available to move within lab edges)

% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

obj4cd = get(lab,'obj4cd');
size   = get(lab,'size');
   
pos  = agt.pos;      %extract current position [x,y]
spd  = agt.speed;    %child move-speed in units per iteration
%spd  = agt.speed*rand;    %child move-speed in units per iteration
exr  = agt.ex_range; %child exploration range

obj_idxs  = []; %indexes of obj4cds in exr
ndx_xplrd = 0;  %index of obj4cd the child explores

% --- get obj4cds around child in radius exr ------------------------                                                                                   
[obj_idxs,obj_ds] = get_local_objs(lab,pos,obj4cd,exr);%obj_idxs: indexes of obj4cds in the lab instance

% --- consider active obj4cds only ----------------------------------                                                                                   
obj4cd_act = get(lab,'obj4cd_act');
n_found_objs = length(obj_idxs);

for i = 1:n_found_objs
    ndx = obj_idxs(n_found_objs + 1 - i);
    if obj4cd_act(ndx) == false %object is of no interest at the moment
        obj_idxs(n_found_objs + 1 - i) = [];
        obj_ds  (n_found_objs + 1 - i) = [];
    end
end    
% -------------------------------------------------------------------

moved = 0; %flag indicating whether child has successfully moved
           %will be set to 1 if child moves

% -------------------------------------------------------------------
% --- if there is at least 1 obj4cd in radius ----------------------- 
% -------------------------------------------------------------------
if ~isempty(obj_idxs)  
    
    [d_nrst,ndx_nrst] = min(obj_ds);
    %d_nrst:   distances to closest obj4cds
    %ndx_nrst: indexes of closest obj4crs in obj_ds (not in lab) (lab indexes are in obj_idxs)

                             
    % --- get nearest obj4cd ------------------------------
    if length(ndx_nrst) > 1       
    %if more obj4cds located at same distance then randomly pick one to head towards
        
        s = round(rand*(length(ndx_nrst)-1))+1;
        ndx_nrst = ndx_nrst(s); %index of nearest object of interest
            
    end
    
    % --- get close to the nearest obj4cd -----------------
    x_nrst = lab.obj4cd_pos(1,1,obj_idxs(ndx_nrst));
    y_nrst = lab.obj4cd_pos(1,2,obj_idxs(ndx_nrst));
    
    nx = x_nrst + rand-0.5; %new x of child close to nearest obj4cd
    ny = y_nrst + rand-0.5; %new y of child close to nearest obj4cd
    
    % --- spd is the maximum step possible ---------------- 
    if spd < d_nrst
        
        x_step = sqrt((x_nrst-pos(1))^2);
        y_step = sqrt((y_nrst-pos(2))^2);
        
        if x_step~=0
            angle = acos(x_step/d_nrst);
        else
            angle = asin(y_step/d_nrst);
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
        
    else
        
       ndx_xplrd = obj_idxs(ndx_nrst); %obj4cd is explored only if within reach
        
    end
        
    new_pos = [nx ny]; %new child-position close to nearest obj4cd
    % -------------------------------------------------
        
    %if new child-position is beyond edge of model, then adjust slightly
    shft=find(new_pos>=size);
    new_pos(shft)=size-rand;
    shft=find(new_pos<=1);
    new_pos(shft)=1+rand;
        
    % -------------------------------------------------
    moved = 1; %child has found an obj4cd and moved close to it
    % -------------------------------------------------
    
end
% -------------------------------------------------------------------
% -------------------------------------------------------------------
% -------------------------------------------------------------------

% -------------------------------------------------------------------
% --- if child has NOT moved toward an object -----------------------
% -------------------------------------------------------------------
if moved == 0

    % --- child chooses a random direction to move in -----    
    cnt = 1;
    dir = rand * 2 * pi; 
    
    while moved == 0 & cnt <= 8 
    %8 attempts available to move within lab edges
    
        new_pos(1)=pos(1)+spd*cos(dir); %new x co-ordinate
        new_pos(2)=pos(2)+spd*sin(dir); %new y co-ordinate
        
        if new_pos(1)<size&new_pos(2)<size&new_pos(1)>=1&new_pos(2)>=1 
        %check that child new position is within edges
           moved = 1;
        end
        
        cnt = cnt + 1;
        dir = dir + (pi/4);
        %if move not successful, increment direction by 45° and try again
        
    end
    
end
% -------------------------------------------------------------------
% -------------------------------------------------------------------
% -------------------------------------------------------------------

if moved==1
    agt.pos=new_pos; %update agent position
end
