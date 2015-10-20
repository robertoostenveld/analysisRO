%% Step3
load('/home/mrphys/simhom/EEG_Data_from_Rene/RO_T1_r.mat');
cfg           = [];
cfg.output    = {'brain','skull','scalp'};
mri_r_s  = ft_volumesegment(cfg, mri_r);

save('/home/mrphys/simhom/EEG_Data_from_Rene/RO_T1_r_s.mat','mri_r_s');