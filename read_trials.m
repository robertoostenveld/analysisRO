function data = read_trials(trl)
% trl.file='/home/language/rensch/EEG_source_pilot/data/EEG/RO_L1.vhdr';
% trl.prestim=1;
% trl.poststim=1;
% trl.bpfilt=[0 0];
% trl.eventvalue='S128';
% trl.eventtype  = 'Stimulus';

cfg=[];
cfg.dataset    =trl.file;
cfg.channel      = trl.channels;
cfg.trialdef.eventtype  = trl.eventtype;%'string'
cfg.trialdef.eventvalue = trl.eventvalue;%128;
cfg.trialdef.prestim    = trl.prestim;% number, latency in seconds (optional)
cfg.trialdef.poststim   = trl.poststim;%number, latency in seconds (optional)

[cfg] = ft_definetrial(cfg);

if sum(trl.bpfilt(:))>0
    if trl.bpfilt(1)>0
        cfg.bpfilter      = 'yes';
        cfg.bpfreq = trl.bpfilt;
    else
        cfg.lpfilter      = 'yes';
        cfg.lpfreq =trl.bpfilt(2);
    end
end

cfg.datafile     =trl.file;

data=ft_preprocessing(cfg);


