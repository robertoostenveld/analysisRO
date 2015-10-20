%% Step2
load('/home/mrphys/simhom/EEG_Data_from_Rene/RO_T1.mat');

cfg=[];
cfg.coordsys='ctf';
cfg.viewmode='surface';
cfg.method         ='fiducial';

   cfg.fiducial.nas    = [ 89 120  26]; %position of nasion
   cfg.fiducial.lpa    = [142 151 138]; %position of LPA
   cfg.fiducial.rpa    = [ 32 151 137]; %position of RPA


   
mri_r = ft_volumerealign(cfg, mri);

save('/home/mrphys/simhom/EEG_Data_from_Rene/RO_T1_r.mat','mri_r');