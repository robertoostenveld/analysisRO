%% Step 4
load('/home/mrphys/simhom/EEG_Data_from_Rene/RO_T1_r_s.mat');

cfg=[];
cfg.tissue={'brain','skull','scalp'};
cfg.numvertices = [6000 4000 2000];
mesh=ft_prepare_mesh(cfg,mri_r_s);

save('/home/mrphys/simhom/EEG_Data_from_Rene/RO_mesh.mat','mesh');
