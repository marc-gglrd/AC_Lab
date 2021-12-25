function [fro_am_all, fros_am_all] = plot_reports_fill_fros_am_all(fros_am_all,fro_size,fros_size,c_mode,tot_it)
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
%%% --- am1 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am01',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(1,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = fro;

%%% --- am2 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am02',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(2,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = [fro_am_all, fro(:,2)];

%%% --- am3 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am03',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(3,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = [fro_am_all, fro(:,2)];

%%% --- am4 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am04',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(4,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = [fro_am_all, fro(:,2)];

%%% --- am5 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am05',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(5,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = [fro_am_all, fro(:,2)];

%%% --- am6 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am06',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(6,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = [fro_am_all, fro(:,2)];

%%% --- am7 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am07',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(7,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = [fro_am_all, fro(:,2)];

%%% --- am8 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am08',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(8,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = [fro_am_all, fro(:,2)];

%%% --- am9 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('am09',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(9,fro,fros_size);
fros_am_all = [fros_am_all, fros];
fro_am_all  = [fro_am_all, fro(:,2)];















