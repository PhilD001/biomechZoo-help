% single trial kinematics PiG + OFM 
% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup(false);
pause(time)


% Load files (set path manually to correct path)
%
flSta = {'/Users/phild/Code/openOFM/Test Data/HF059A_share_ofm/HF059A02.zoo'};
flDyn = {'/Users/phild/Code/openOFM/Test Data/HF059A_share_ofm/HF059A08.zoo'};
batchdisp(flSta{1},' ')
batchdisp(flDyn{1},' ')
disp(' ')
sdata = zload(flSta{1});
data  = zload(flDyn{1});

% Compute ankle static offset using static trial
%
disp('We define a settings struct to set the mode used by the various processes')

settings.graph = true;        % graph comparisons between biomechZoo and PiG
settings.flat  = true;        % the subject had their feet flat on the ground in static pose
settings.comp  = false;       % compare (RMS difference between biomechZoo and PiG)
disp('settings.graph = true,  to produce comparison plots between biomechZoo and PiG')
disp('settings.flat = true,   assume subjects had feet flat on floor during static pose')
disp('settings.comp = false,  do not numerically (RMS diff) compare outputs')
disp(' ')

disp('we start by creating ''bones'' for the static data: ''sdata = makebones(sdata,''static'',settings.flat)''')
disp('These ''bones'' represent local coordinate systems for each body segment')
disp(' ')
sdata = makebones_data(sdata,'static',settings.flat);
pause(time)

disp('We then compute kinematics for the static trial by calling ''sdata = kinematics_data(sdata)''');
disp(' ')
sdata = kinematics_data(sdata);
pause(time)
  
disp('We call ''ankleoffsetPiG_data(data,sdata)'' to compute the ankle offset angle based on static pose')
disp(' ')
data = ankleoffsetPiG_data(data,sdata);

disp('We can now create the ''bones'' for the dynamic trial: ''data = makebones(data,''dynamic'')''');
disp(' ')
data = makebones_data(data,'dynamic');
pause(time)

disp('Finally, we can compute kinematics for the dynamic trial: ''data = kinematics_data(data,settings)''');
disp(' ')
disp('Let''s plot the comparisons')
disp(' ')
data = kinematics_data(data,settings);
figs =findobj('type','fig');
delete(figs(1))  % hide oxford foot model comparisons
pause(time)

% Final output to user
disp('A processed file was loaded into the workspace...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear figs flDyn flSta sdata settings time fld fl test






