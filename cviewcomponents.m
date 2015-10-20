load /home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_bp0.5-0.5Hz_compLR2.mat
load /home/mrphys/simhom/EEG_Data_from_Rene/EEG/RO_bp0.5-0.5Hz_art_rej.mat

cfg           = [];
cfg.component = [ 15 23 25 37];       % specify the component(s) that should be plotted
cfg.layout    = '/home/mrphys/simhom/EEG_Data_from_Rene/Data/MR64.lay'; % specify the layout file that should be used for plotting
cfg.comment   = 'no';

ft_topoplotIC(cfg, comp_LR2)



cfg = [];
cfg.channel = [15 23 25 37];
cfg.viewmode = 'component';
cfg.layout    = '/home/mrphys/simhom/EEG_Data_from_Rene/Data/MR64.lay';
ft_databrowser(cfg, comp_LR2)