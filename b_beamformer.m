load /home/mrphys/simhom/EEG_Data_from_Rene/RO_headmodel
load /home/mrphys/simhom/EEG_Data_from_Rene/RO_mesh.mat
load /home/mrphys/simhom/EEG_Data_from_Rene/elec_realign.mat

%%   'AF3'    'AF4'   'AF7'    'AF8'    'Fpz'  'Fp1'    'Fp2' dropped


cfg=[];
cfg.method= 'mtmconvol';
cfg.output     = 'pow';
cfg.pad        =2.4;

cfg.trials     =find(data_LR2_clean.trialinfo(:,2)==2);
cfg.taper      ='hanning';
cfg.foi        =2.5:2.5:250;
%cfg.tapsmofrq  =2.5*ones(1,length(cfg.foi));
cfg.t_ftimwin  =0.4*ones(1,length(cfg.foi));
cfg.toi        =-0.4:0.1:1.2;

cfg.trials=find(data_LR2_clean.trialinfo(:,2)==2);
freq_L2_t04_f25=ft_freqanalysis(cfg, data_LR2_clean);

cfg.trials=find(data_LR2_clean.trialinfo(:,2)==4);
freq_R2_t04_f25=ft_freqanalysis(cfg, data_LR2_clean);

cfg              = []; 
cfg.method       = 'dics';
cfg.frequency    = freq_data_LR2_clean;  
cfg.grid         = mesh; 
cfg.headmodel        = vol;
cfg.dics.projectnoise = 'yes';
cfg.dics.lambda       = 0;

sourcePost_nocon = ft_sourceanalysis(cfg,);