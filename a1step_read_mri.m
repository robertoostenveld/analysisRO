%% Step1
cfg = [];
mri = ft_read_mri('/home/mrphys/simhom/EEG_Data_from_Rene/T1/ERIVDBER_030731_R.OOSTERVELD.MR.PAUGAA_ANATOMICAL-3D.2.1.2003.7.31.11.19.16.312000.53833526.IMA');

mri_cord = ft_determine_coordsys(mri,'interactive','yes');
save('/home/mrphys/simhom/EEG_Data_from_Rene/RO_T1.mat','mri_cord');
