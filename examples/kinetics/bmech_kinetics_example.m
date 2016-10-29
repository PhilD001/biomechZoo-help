% bmech_kinetics_example demonstrates how to compute lower-limb joint kinetics according to 
% the plug-in gait (PiG) model
% 
% Usage: Computing joint kinetics allows for an understanding of the joint moments and power
% 
% Example: The files in our example data folder (~/examples/example data) contain PiG marker data 
% affixed to body segments. Use these markers to compute lower-limb joint kinetics and compare
% results to PiG outputs. 
%
%
% See also bmech_kinetics, kinetics_data 


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup(false);
pause(time)


% Settings
%
filt = setFilt;
disp('We start by defining filter properties for the processess:')
disp('filt: ')
disp(filt)
disp(' ')
disp('We define a settings struct to set the mode used by the processes:')
settings.segpar = 'segments.xls';
settings.graph  = true;
settings.city   = 'standard';
settings.filt   = false;
settings.comp   = true;
settings.static = 'Static';
disp('settings:')
disp(settings)
pause(time)
disp('Note: The settings ''segpar'' field points to an excel file where the segment properties are listed')
disp(' ')



% Load files
%
disp('We load a sample file to operate on')
fl = engine('path',fld,'extension','zoo','search path','Straight','search file','HC032');
batchdisp(fl{1},' ')
disp(' ')
data  = zload(fl{1});
pause(time)

disp('We call the function as ''data = kinetics_data(data,settings,filt)'':')
disp(' ')
data = kinetics_data(data,settings,filt);

disp('Let''s plot the comparisons')
disp(' ')
figs =findobj('type','fig');
delete(figs(1))  % hide oxford foot model comparisons 
pause(time)


% Final output to user
disp('A processed file was loaded into the workspace...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld figs filt settings fl






