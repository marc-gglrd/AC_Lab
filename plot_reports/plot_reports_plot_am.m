%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- AM --- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
subplot(1,1,1),plot(x,y_am_03,clr_ld_1);
hold on
%----------------------------
subplot(1,1,1),plot(x,y_am_05,clr_cd_1);
hold on
subplot(1,1,1),plot(x,y_am_06,clr_cr_1);
hold on
subplot(1,1,1),plot(x,y_am_07,clr_nc_1);
legend('Lab Distance',...
       'CD Need for Physical Care','CR Need to Give Physical Care',...
       'Iterations with No Care',...
       'Location', 'North');
xlabel('Ambivalence');
hold off
subplot(1,1,1),axis([0 1 0 1.1*max(y_am_05)]); 
%----------------------------
subplot(1,1,1),title(title_am_01);
%----------------------------
if save_file
    f_name = f_title_am_01;
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
subplot(1,1,1),plot(x,y_am_03,clr_ld_1);
hold on
%----------------------------
subplot(1,1,1),plot(x,y_am_16,clr_cd_2);
hold on
subplot(1,1,1),plot(x,y_am_17,clr_cd_1);
hold on
subplot(1,1,1),plot(x,y_am_18,clr_cr_2);
hold on
subplot(1,1,1),plot(x,y_am_19,clr_cr_1);
legend('Lab Distance','CD Exploring','CD Approaching',...
       'CR Exploring','CR Approaching',...
       'Location', 'North');
xlabel('Ambivalence');
hold off
subplot(1,1,1),axis([0 1 0 1.1*max(y_am_16)]); 
%----------------------------
subplot(1,1,1),title(title_am_02);
%----------------------------
if save_file
    f_name = f_title_am_02;
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
subplot(1,1,1),plot(x,y_am_03,clr_ld_1);
hold on
%----------------------------
subplot(1,1,1),plot(x,y_am_08,clr_cd_1);
hold on
subplot(1,1,1),plot(x,y_am_09,clr_cr_1);
hold on
subplot(1,1,1),plot(x,y_am_10,clr_cd_3);
hold on
subplot(1,1,1),plot(x,y_am_11,clr_cr_3);
legend('Lab Distance','CD p-distance','CR p-distance',...
       'CD p-distance target','CR p-distance target',...
       'Location', 'North');
xlabel('Ambivalence');
hold off
subplot(1,1,1),axis([0 1 0 1.1*max(y_am_16)]); 
%----------------------------
subplot(1,1,1),title(title_am_03);
%---------------------------- 
if save_file
    f_name = f_title_am_03;
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
subplot(1,1,1),plot(x,y_am_03,clr_ld_1);
hold on
%----------------------------
subplot(1,1,1),plot(x,y_am_12,clr_cd_1);
hold on
subplot(1,1,1),plot(x,y_am_13,clr_cr_1);
hold on
subplot(1,1,1),plot(x,y_am_14,clr_cd_3);
hold on
subplot(1,1,1),plot(x,y_am_15,clr_cr_3);
legend('Lab Distance','CD distancing','CR distancing',...
       'CD distancing target','CR distancing target',...
       'Location', 'South');
xlabel('Ambivalence');
hold off
subplot(1,1,1),axis([0 1 0 1.1*max(y_am_15)]); 
%----------------------------
subplot(1,1,1),title(title_am_04);
%----------------------------
if save_file
    f_name = f_title_am_04;
    savefig(f4,strcat(f_path,f_name,'.fig'));
    saveas(f4,strcat(f_path,f_name,'.png'));
end
drawnow

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%