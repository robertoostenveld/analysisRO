elec=ft_read_sens('/home/mrphys/simhom/EEG_Data_from_Rene/Data/RO.pos','senstype','eeg');


%load('/home/language/rensch/EEG_source_pilot/data/MRI/RO_T1_r.mat');
load('/home/mrphys/simhom/EEG_Data_from_Rene/RO_vol.mat');
cfg=[];
cfg.method         ='fiducial';%'interactive';%
%cfg.warp          ='rigidbody';%'globalrescale';
cfg.channel        = 'all';
cfg.fiducial       =  {'nasion', 'left', 'right'};
cfg.elec          = elec;
%cfg.feedback       = 'yes';

cfg.template.chanpos(1,:) = [15.0 0 0];  % location of the nose
cfg.template.chanpos(2,:) = [0  9.0 0];  % left ear
cfg.template.chanpos(3,:) = [0 -9.0 0];  % right ear
cfg.template.label    = {'nasion', 'left', 'right'};

cfg.headshape      = vol.bnd(1);

elec_r = ft_electroderealign(cfg) ;

elec_r = ft_convert_units(elec_r, 'mm');

save('/home/mrphys/simhom/EEG_Data_from_Rene/elec_realign.mat','elec_r');

%%
% load volume conduction model
%load vol;                              
figure;
% head surface (scalp)
ft_plot_mesh(vol.bnd(1), 'edgecolor','none','facealpha',0.8,'facecolor',[0.6 0.6 0.8]); 
hold on;
% electrodes
ft_plot_sens(elec_r,'style', 'sk');    