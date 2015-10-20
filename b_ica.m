%% apped data
load(['/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_bp' num2str(trl.bpfilt(1)) '-'  num2str(trl.bpfilt(1)) 'Hz_art_rej.mat']);
cfg=[];
%data_LR1=ft_appenddata(cfg,data_L1,data_R1);
data_LR2=ft_appenddata(cfg,data_L2,data_R2);

%% do ICA
cfg.method       = 'fastica';%, 'fastica', 'binica', 'pca', 'svd', 'jader', 'varimax', 'dss', 'cca', 'sobi', 'white' or 'csp' (default = 'runica')
%cfg.channel      = 'all':%cell-array with channel selection (default = 'all'), see FT_CHANNELSELECTION for details
cfg.trials       = 'all';% or a selection given as a 1xN vector (default = 'all')
cfg.numcomponent = 'all';% or number (default = 'all')
cfg.demean       = 'no';% or 'yes' (default = 'yes')
comp_LR2=ft_componentanalysis(cfg,data_LR2);

sv_dr=['/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_bp' num2str(trl.bpfilt(1)) '-'  num2str(trl.bpfilt(1)) 'Hz_compLR2.mat'];
save(sv_dr, 'comp_LR2');

% comp_LR1=ft_componentanalysis(cfg,data_LR1);
% 
% sv_dr=['/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_bp' num2str(trl.bpfilt(1)) '-'  num2str(trl.bpfilt(1)) 'Hz_compLR.mat'];
% save(sv_dr, 'comp_LR1');
% 

%% view components
load(['/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_bp' num2str(trl.bpfilt(1)) '-'  num2str(trl.bpfilt(1)) 'Hz_compLR2.mat']);

cfg=[];
cfg.viewmode                =  'component';
cfg.layout                  =  '/home/mrphys/simhom/EEG_Data_from_Rene/Data/MR64.lay';
cfg.compscale               = 'local';
cfg.zlim                    = 'maxabs';
ft_databrowser(cfg,comp_LR2);

%% detected artifact components
%art_comps_LR2=[11 19];%eye blinks/movements
art_comps_LR2=[1 2 3 4 5 6 7 8 9 10 11 12 14 16 17 18 19 20 21 22 22 24 26 27 28 29 30 31 33 34 35 36 38 39 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 ];
%% remove components
load(['/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_bp' num2str(trl.bpfilt(1)) '-'  num2str(trl.bpfilt(1)) 'Hz_compLR2.mat']);
cfg=[];
cfg.component =art_comps_LR2;

data_LR2_clean=ft_rejectcomponent(cfg, comp_LR2);
