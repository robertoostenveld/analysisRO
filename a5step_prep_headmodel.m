%% Step5

% figure;
% ft_plot_mesh(mesh.bnd(1),'facecolor','none'); %scalp

load('/home/mrphys/simhom/EEG_Data_from_Rene/RO_mesh.mat')

cfg        = [];
cfg.method ='dipoli';
cfg.conductivity=[0.3300 0.0041 0.3300];
vol        = ft_prepare_headmodel(cfg, mesh);

save('/home/mrphys/simhom/EEG_Data_from_Rene/RO_headmodel.mat','vol');