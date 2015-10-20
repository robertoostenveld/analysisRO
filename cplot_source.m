%load('/home/language/rensch/EEG_source_pilot/data/MRI/RO_source_LR_f75125_s0304.mat');

load('/home/language/rensch/EEG_source_pilot/data/MRI/RO_source_LR_f10_bslnAct.mat');

cfg = [];
cfg.parameter = 'avg.pow';
cfg.operation='divide';
source_L_rat=ft_math(cfg,source_L_act,source_L_bsln);
source_R_rat=ft_math(cfg,source_R_act,source_R_bsln);

cfg = [];
cfg.parameter = 'avg.pow';
cfg.operation='log10';

source_L_lograt=ft_math(cfg,source_L_rat);
source_R_lograt=ft_math(cfg,source_R_rat);

load('/home/language/rensch/EEG_source_pilot/data/MRI/RO_T1_r.mat');

source.anatomy=mri_r.anatomy;

cfg=[];
cfg.method        ='ortho';
%cfg.anaparameter  ='anatomy';
cfg.funparameter = 'avg.pow';

%figure;
ft_sourceplot(cfg, source_L_lograt)
%figure;
ft_sourceplot(cfg, source_R_lograt)