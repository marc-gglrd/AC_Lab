%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf3 plot_stats plot graphs ----------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global N_IT PRMS_ACLAB
       
% -----------------------------------------------------
% -----------------------------------------------------    
if f1_on            
    f1=figure(31);
    set(f1,'Units','Normalized');
    set(f1,'Position',pos3);

    subplot(4,1,1),cla
    subplot(4,1,1),plot((0:N_IT),cf3_d_cd(1:N_IT+1),clr_blk);
    subplot(4,1,1),axis([0 tot_it 0 1.1*max(cf3_d_cd)]);
    subplot(4,1,1),title(title_f1_1);

    subplot(4,1,2),cla
    subplot(4,1,2),plot((0:N_IT),cf3_d_cd_m(1:N_IT+1),clr_red);
    subplot(4,1,2),axis([0 tot_it 0 1.1*max(cf3_d_cd_m)]);
    subplot(4,1,2),title(title_f1_2);

    subplot(4,1,3),cla
    subplot(4,1,3),plot((0:N_IT),cf3_d_cr(1:N_IT+1),clr_blk);
    subplot(4,1,3),axis([0 tot_it 0 1.1*max(cf3_d_cr)]);
    subplot(4,1,3),title(title_f1_3);

    subplot(4,1,4),cla
    subplot(4,1,4),plot((0:N_IT),cf3_d_cr_m(1:N_IT+1),clr_red);
    subplot(4,1,4),axis([0 tot_it 0 1.1*max(cf3_d_cr_m)]);
    subplot(4,1,4),title(title_f1_4);
end
% -----------------------------------------------------
% -----------------------------------------------------

% -----------------------------------------------------
if f2_on          
    f2=figure(32);
    set(f2,'Units','Normalized');
    set(f2,'Position',pos4);

    subplot(2,1,1),cla
    subplot(2,1,1),plot((0:N_IT),p2need_cf3_x(1:N_IT+1),clr_blk);
    subplot(2,1,1),axis([0 tot_it 0 1.1*max(p2need_cf3_x)]);
    subplot(2,1,1),title(title_f2_1);

    subplot(2,1,2),cla
    subplot(2,1,2),plot((0:N_IT),p2give_cf3_x(1:N_IT+1),clr_blu);
    subplot(2,1,2),axis([0 tot_it 0 1.1*max(p2give_cf3_x)]);
    subplot(2,1,2),title(title_f2_2);
end
% -----------------------------------------------------

% -----------------------------------------------------
% -----------------------------------------------------

% -----------------------------------------------------
if f3_on    
    f3=figure(33);
    set(f3,'Units','Normalized');
    set(f3,'Position',pos5);

    subplot(2,1,1),cla
    subplot(2,1,1),plot((0:N_IT),p2need_cf3(1:N_IT+1),clr_blk);
    subplot(2,1,1),axis([0 tot_it 0 1.1*max(p2need_cf3)]);
    subplot(2,1,1),title(title_f3_1);

    subplot(2,1,2),cla
    subplot(2,1,2),plot((0:N_IT),p2give_cf3(1:N_IT+1),clr_blu);
    subplot(2,1,2),axis([0 tot_it 0 1.1*max(p2give_cf3)]);
    subplot(2,1,2),title(title_f3_2);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % --- DYNAMICS -------------------------------------- %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %--- to print both lines in the same graph ------------
      
    f31=figure(331);
    set(f31,'Units','Normalized');
    set(f31,'Position',pos5);
    plot((0:N_IT),p2need_cf3(1:N_IT+1),clr_blk);
    hold on
    plot((0:N_IT),p2give_cf3(1:N_IT+1),clr_red);
    hold off
    %axis([0 tot_it 0.3 1.1*max(p2need_cf3)]);%first 200
    axis([tot_it-200 tot_it 0 1]);%last 200
    %axis([tot_it-200 tot_it 0.3 1.1]);%last 200 Thesis Graph
    %xlabel('Iteration');% Thesis Graph
    f_name = 'N_R (in black) and N_G (in red) -- Am = ' + string(PRMS_ACLAB.ad3_am);
    title(f_name);
    %savefig(f31,f_name+'.fig');

    %--- to print p2need-p2give ---------------------------
    
    f32=figure(332);
    set(f32,'Units','Normalized');
    set(f32,'Position',pos5);
    %set(f32,'Position',get(0, 'Screensize'));%full screen image
    plot(p2need_cf3(1:N_IT+1),p2give_cf3(1:N_IT+1),clr_blk);
    axis([0 1 0 1]);
    f_name = 'Am = ' + string(PRMS_ACLAB.ad3_am);
    title(f_name);
    xlabel('N_R (attacher)'); 
    ylabel('N_G (caregiver)');
    %savefig(f32,f_name+'.fig');
    %saveas(f32,f_name+'.png');

end
% -----------------------------------------------------

% -----------------------------------------------------
% -----------------------------------------------------

% -----------------------------------------------------
if f4_on    
    f4=figure(34);
    set(f4,'Units','Normalized');
    set(f4,'Position',pos6);
    subplot(2,1,1),cla

    subplot(2,1,1),plot((0:N_IT),no_cf3_cntr(1:N_IT+1),clr_mgt);
    subplot(2,1,1),axis([0 tot_it 0 1.1*max([no_cf3_cntr 0.1])]);
    subplot(2,1,1),title(title_f4_1);

    subplot(2,1,2),cla
    subplot(2,1,2),plot((0:N_IT),no_cf3_m(1:N_IT+1),clr_red);
    subplot(2,1,2),axis([0 tot_it 0 1.1*max([no_cf3_m 0.1])]);
    subplot(2,1,2),title(title_f4_2); 
end
% -----------------------------------------------------

% -----------------------------------------------------
% -----------------------------------------------------

% -----------------------------------------------------
if f5_on     
    f5=figure(35);
    set(f5,'Units','Normalized');
    set(f5,'Position',pos7);

    subplot(4,1,1),cla
    subplot(4,1,1),plot((0:N_IT),cf3_pd_cd(1:N_IT+1),clr_blk);
    subplot(4,1,1),axis([0 tot_it 0 1.1*max(cf3_pd_cd)]);
    subplot(4,1,1),title(title_f5_1);

    subplot(4,1,2),cla
    subplot(4,1,2),plot((0:N_IT),cf3_pd_cd_m(1:N_IT+1),clr_red);
    subplot(4,1,2),axis([0 tot_it 0 1.1*max(cf3_pd_cd_m)]);
    subplot(4,1,2),title(title_f5_2);

    subplot(4,1,3),cla
    subplot(4,1,3),plot((0:N_IT),cf3_pd_cr(1:N_IT+1),clr_blu);
    subplot(4,1,3),axis([0 tot_it 0 1.1*max([cf3_pd_cr 0.1])]);
    subplot(4,1,3),title(title_f5_3);

    subplot(4,1,4),cla
    subplot(4,1,4),plot((0:N_IT),cf3_pd_cr_m(1:N_IT+1),clr_red);
    subplot(4,1,4),axis([0 tot_it 0 1.1*max(cf3_pd_cr_m)]);
    subplot(4,1,4),title(title_f5_4);
end
% -----------------------------------------------------

% -----------------------------------------------------
if fx_on     
    fx=figure(91);
    set(fx,'Units','Normalized');
    set(fx,'Position',pos7);

    subplot(5,1,1),cla
    subplot(5,1,1),plot((0:N_IT),no_cf3_cntr(1:N_IT+1),clr_mgt);
    subplot(5,1,1),axis([0 tot_it 0 1.1*max([no_cf3_cntr 0.1])]);
    subplot(5,1,1),title(title_f4_1);%iterations with no care
    
    %------------------------------------------------------
    
    subplot(5,1,2),cla
    subplot(5,1,2),plot((0:N_IT),cf3_pd_cd(1:N_IT+1),clr_blk);
    subplot(5,1,2),axis([0 tot_it 0 1.1*max(cf3_pd_cd)]);
    subplot(5,1,2),title(title_f5_1);%CD p-distance (Dp)
    
    subplot(5,1,3),cla
    subplot(5,1,3),plot((0:N_IT),p2need_cf3_x(1:N_IT+1),clr_blk);
    subplot(5,1,3),axis([0 tot_it 0 1.1*max(p2need_cf3_x)]);
    subplot(5,1,3),title(title_f2_1);%CD x (drive)
    
    %------------------------------------------------------

    subplot(5,1,4),cla
    subplot(5,1,4),plot((0:N_IT),cf3_pd_cr(1:N_IT+1),clr_blk);
    subplot(5,1,4),axis([0 tot_it 0 1.1*max([cf3_pd_cr 0.1])]);
    subplot(5,1,4),title(title_f5_3);%CR p-distance (Dp)
   
    subplot(5,1,5),cla
    subplot(5,1,5),plot((0:N_IT),p2give_cf3_x(1:N_IT+1),clr_blu);
    subplot(5,1,5),axis([0 tot_it 0 1.1*max(p2give_cf3_x)]);
    subplot(5,1,5),title(title_f2_2);%CR x (drive)
end
% -----------------------------------------------------

% -----------------------------------------------------

