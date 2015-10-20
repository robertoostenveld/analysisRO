trl.prestim=0.6;
trl.poststim=1.4;
trl.bpfilt=[0.5 250];
trl.eventvalue='S128';
trl.eventtype  = 'Stimulus';
trl.channels={'all', '-ECG'};


load(['/home/language/rensch/EEG_source_pilot/data/EEG/RO_bp' num2str(trl.bpfilt(1)) '-'  num2str(trl.bpfilt(2)) 'Hz_TFR_t04_f25_powandcsd.mat'])


cfg = [];
cfg.parameter = 'powspctrm';
cfg.operation='divide';
freq_L_rat=ft_math(cfg,freq_L2_act_f10,freq_L2_bsln_f10);
freq_R_rat=ft_math(cfg,freq_R2_act_f10,freq_R2_bsln_f10);

cfg = [];
cfg.parameter = 'powspctrm';
cfg.operation='log10';
freq_L_rat=ft_math(cfg,freq_L_rat);
freq_R_rat=ft_math(cfg,freq_R_rat);

cfg=[];
cfg.layout='/home/language/rensch/EEG_source_pilot/data/scripts/MR64.lay';
figure;
ft_topoplotER(cfg,freq_L_rat)
figure;
ft_topoplotER(cfg,freq_R_rat)

