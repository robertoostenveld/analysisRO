%read_data

trl.prestim=0.6;
trl.poststim=1.4;
trl.bpfilt=[0.5 250];
trl.eventvalue='S128';
trl.eventtype  = 'Stimulus';
trl.channels={'all', '-ECG'};

% trl.file='/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_L1.vhdr';
% data_L1=read_trials(trl);

% trl.file='/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_R1.vhdr';
% data_R1=read_trials(trl);

trl.file='/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_L2.vhdr';
data_L2=read_trials(trl);


trl.file='/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_R2.vhdr';
data_R2=read_trials(trl);

%% label conditions
% data_L1.trialinfo=[data_L1.trialinfo ones(length(data_L1.trialinfo),1)];
% data_R1.trialinfo=[data_R1.trialinfo 3*ones(length(data_R1.trialinfo),1)];
data_L2.trialinfo=[data_L2.trialinfo 2*ones(length(data_L2.trialinfo),1)];
data_R2.trialinfo=[data_R2.trialinfo 4*ones(length(data_R2.trialinfo),1)];

%% change reference
cfg=[];
cfg.reref         = 'yes';%'no' or 'yes' (default = 'no')
cfg.refchannel    = data_L2.label;% cell-array with new EEG reference channel(s), this can be 'all' for a common average reference
%cfg.implicitref   = 'FCz';%'label' or empty, add the implicit EEG reference as zeros (default = [])

%data_L1= ft_preprocessing(cfg, data_L1);
%data_R1= ft_preprocessing(cfg, data_R1);
data_L2= ft_preprocessing(cfg, data_L2);
data_R2= ft_preprocessing(cfg, data_R2);
%% %reject artifacts
%data_L1=ft_rejectvisual(cfg,data_L1);
%data_L2=ft_rejectvisual(cfg,data_R1);
data_R1=ft_rejectvisual(cfg,data_L2);
data_R2=ft_rejectvisual(cfg,data_R2);

% 
% cfg.preproc.bpfilter    = 'yes';
% cfg.preproc.bpfreq      = [110 140];
% cfg.preproc.bpfiltord   =  8;
% cfg.preproc.bpfilttype  = 'but';
% cfg.preproc.rectify     = 'yes';
% cfg.preproc.boxcar      = 0.2;
% 
% data_L1=ft_rejectvisual(cfg,data_L1);
% data_R1=ft_rejectvisual(cfg,data_R1);
% data_L2=ft_rejectvisual(cfg,data_L2);
% data_R2=ft_rejectvisual(cfg,data_R2);
sv_dr=['/home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_bp' num2str(trl.bpfilt(1)) '-'  num2str(trl.bpfilt(1)) 'Hz_art_rej.mat'];
save(sv_dr, 'data_*');