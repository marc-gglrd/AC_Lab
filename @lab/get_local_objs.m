function [obj_idxs,obj_ds]=get_local_objs(lab,pos,obj,rds)

%object detection function for class LAB
%(1) detects objects of kind obj in circle of radius rds around position pos
%(2) extracts distances of objs from pos and indexes of objs in radius
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

if     obj == lab.obj4cd
    obj_n   = lab.obj4cd_n;
    obj_pos = lab.obj4cd_pos;
elseif obj == lab.obj4cr
    obj_n   = lab.obj4cr_n;
    obj_pos = lab.obj4cr_pos;
end

obj_idxs = [];
obj_ds   = [];

%get distance of objs from pos and indexes of objs in radius
for i = 1:obj_n
   d = sqrt((obj_pos(1,1,i)-pos(:,1)).^2+(obj_pos(1,2,i)-pos(:,2)).^2); %distance of objs from pos
   if d <= rds
       obj_idxs = [obj_idxs i]; %indexes of objs in radius
       obj_ds   = [obj_ds d];   %distances of objs from pos
   end
end
                                         
