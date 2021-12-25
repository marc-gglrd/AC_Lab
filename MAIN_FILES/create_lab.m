function [lab_ctnr]=create_lab()

%Creates and populates a lab object
%lab_ctnr: lab container
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_C_LAB

this_lab = lab(PRMS_C_LAB.shape, ...        %(1)
               PRMS_C_LAB.unit, ...         %(2)
               PRMS_C_LAB.size, ...         %(3)
               PRMS_C_LAB.out_pos, ...      %(4)
               PRMS_C_LAB.door_pos, ...     %(5)
               PRMS_C_LAB.field,...         %(6)
               PRMS_C_LAB.empty_field, ...  %(7)
               PRMS_C_LAB.obj4cd, ...       %(8)
               PRMS_C_LAB.obj4cr, ...       %(9)
               PRMS_C_LAB.obj4cd_n, ...     %(10)
               PRMS_C_LAB.obj4cr_n, ...     %(11)
               PRMS_C_LAB.obj4cd_pos, ...   %(12)
               PRMS_C_LAB.obj4cr_pos, ...   %(13)
               PRMS_C_LAB.obj4cd_mex, ...   %(14)
               PRMS_C_LAB.obj4cr_mex, ...   %(15)
               PRMS_C_LAB.obj4cd_xint, ...  %(16)
               PRMS_C_LAB.obj4cr_xint,...   %(17)
               PRMS_C_LAB.obj4cd_xc, ...    %(18)
               PRMS_C_LAB.obj4cr_xc, ...    %(19)
               PRMS_C_LAB.obj4cd_xic, ...   %(20)
               PRMS_C_LAB.obj4cr_xic,...    %(21)
               PRMS_C_LAB.obj4cd_act, ...   %(22)
               PRMS_C_LAB.obj4cr_act,...    %(23)
               PRMS_C_LAB.cd_pos,...        %(24)
               PRMS_C_LAB.cr_pos,...        %(25)
               PRMS_C_LAB.cd_cr_d);         %(26)        

[objs4cd_ok,this_lab] = place_objs4cd(this_lab);
[objs4cr_ok,this_lab] = place_objs4cr(this_lab);

lab_ctnr{1} = this_lab;





 
