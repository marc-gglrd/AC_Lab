%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- PH --- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
%%% --- GRAPH 1 ---------------------------------
f1=figure(5);
set(f1,'Units','Normalized');
set(f1,'Position',pos1);
subplot(1,1,1),cla
%----------------------------    
subplot(1,1,1),plot(x,y_ph_03,clr_ld_1);
hold on
%----------------------------
subplot(1,1,1),plot(x,y_ph_05,clr_cd_1);
hold on
subplot(1,1,1),plot(x,y_ph_06,clr_cr_1);
hold on
subplot(1,1,1),plot(x,y_ph_07,clr_nc_1);
legend('Lab Distance',...
       'CD Need for Physical Care','CR Need to Give Physical Care',...
       'Iterations with No Care',...
       'Location', 'North');
xlabel('Phobicity');
hold off
subplot(1,1,1),axis([0 1 0 1.1*max(y_ph_05)]); 
%----------------------------
subplot(1,1,1),title(title_ph_01);
%----------------------------
if save_file
    f_name = f_title_ph_01;
    savefig(f1,strcat(f_path,f_name,'.fig'));
    saveas(f1,strcat(f_path,f_name,'.png'));
end
drawnow

%%% --- GRAPH 2 ---------------------------------
f2=figure(6);
set(f2,'Units','Normalized');
set(f2,'Position',pos2);
subplot(1,1,1),cla
%----------------------------
subplot(1,1,1),plot(x,y_ph_03,clr_ld_1);
hold on
%----------------------------
subplot(1,1,1),plot(x,y_ph_16,clr_cd_2);
hold on
subplot(1,1,1),plot(x,y_ph_17,clr_cd_1);
hold on
subplot(1,1,1),plot(x,y_ph_18,clr_cr_2);
hold on
subplot(1,1,1),plot(x,y_ph_19,clr_cr_1);
legend('Lab Distance','CD Exploring','CD Approaching',...
       'CR Exploring','CR Approaching',...
       'Location', 'North');
xlabel('Phobicity');
hold off
subplot(1,1,1),axis([0 1 0 1.1*max(y_ph_16)]); 
%----------------------------
subplot(1,1,1),title(title_ph_02);
%----------------------------
if save_file
    f_name = f_title_ph_02;
    savefig(f2,strcat(f_path,f_name,'.fig'));
    saveas(f2,strcat(f_path,f_name,'.png'));
end
drawnow

%%% --- GRAPH 3 ---------------------------------
f3=figure(7);
set(f3,'Units','Normalized');
set(f3,'Position',pos3);
subplot(1,1,1),cla
%----------------------------
subplot(1,1,1),plot(x,y_ph_03,clr_ld_1);
hold on
%----------------------------
subplot(1,1,1),plot(x,y_ph_08,clr_cd_1);
hold on
subplot(1,1,1),plot(x,y_ph_09,clr_cr_1);
hold on
subplot(1,1,1),plot(x,y_ph_10,clr_cd_3);
hold on
subplot(1,1,1),plot(x,y_ph_11,clr_cr_3);
legend('Lab Distance','CD vulnerability','CR vulnerability',...
       'CD vulnerability target','CR vulnerability target',...
       'Location', 'North');
xlabel('Phobicity');
hold off
subplot(1,1,1),axis([0 1 0 1.1*max(y_ph_16)]); 
%----------------------------
subplot(1,1,1),title(title_ph_03);
%----------------------------
if save_file
    f_name = f_title_ph_03;
    savefig(f3,strcat(f_path,f_name,'.fig'));
    saveas(f3,strcat(f_path,f_name,'.png'));
end
drawnow

%%% --- GRAPH 4 ---------------------------------
f4=figure(8);
set(f4,'Units','Normalized');
set(f4,'Position',pos4);
subplot(1,1,1),cla
%----------------------------
subplot(1,1,1),plot(x,y_ph_03,clr_ld_1);
hold on
%----------------------------
subplot(1,1,1),plot(x,y_ph_12,clr_cd_1);
hold on
subplot(1,1,1),plot(x,y_ph_13,clr_cr_1);
hold on
subplot(1,1,1),plot(x,y_ph_14,clr_cd_3);
hold on
subplot(1,1,1),plot(x,y_ph_15,clr_cr_3);
legend('Lab Distance','CD distancing','CR distancing',...
       'CD distancing target','CR distancing target',...
       'Location', 'South');
xlabel('Phobicity');
hold off
subplot(1,1,1),axis([0 1 0 1.1*max(y_ph_15)]); 
%----------------------------
subplot(1,1,1),title(title_ph_04);
%----------------------------
if save_file
    f_name = f_title_ph_04;
    savefig(f4,strcat(f_path,f_name,'.fig'));
    saveas(f4,strcat(f_path,f_name,'.png'));
end
drawnow

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%