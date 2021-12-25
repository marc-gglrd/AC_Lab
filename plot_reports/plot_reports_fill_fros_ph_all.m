function [fro_ph_all, fros_ph_all] = plot_reports_fill_fros_ph_all(fros_ph_all,fro_size,fros_size,c_mode,tot_it)
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
%%% --- ph1 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph01',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(1,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = fro;

%%% --- ph2 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph02',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(2,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = [fro_ph_all, fro(:,2)];

%%% --- ph3 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph03',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(3,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = [fro_ph_all, fro(:,2)];

%%% --- ph4 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph04',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(4,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = [fro_ph_all, fro(:,2)];

%%% --- ph5 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph05',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(5,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = [fro_ph_all, fro(:,2)];

%%% --- ph6 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph06',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(6,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = [fro_ph_all, fro(:,2)];

%%% --- ph7 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph07',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(7,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = [fro_ph_all, fro(:,2)];

%%% --- ph8 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph08',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(8,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = [fro_ph_all, fro(:,2)];

%%% --- ph9 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('ph09',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(9,fro,fros_size);
fros_ph_all = [fros_ph_all, fros];
fro_ph_all  = [fro_ph_all, fro(:,2)];















