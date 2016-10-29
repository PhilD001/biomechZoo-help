% bmech_removechannel_example demonstrates how to remove channels from zoo files. 
%
% Usage: Removing channels from a zoo files can be useful process to remove unwanted channels
% from zoo data. This process makes the files smaller and easier to navigate
% 
% Example: The files in our example data folder (~/examples/example data) contains channels
% that we are not interested in analysing for our study. We only want to analyse lower-limb
% angles for the right limb. We will remove all other channels using bmech_removechannel
%
% See also bmech_removechannel, removechannel_data


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup;
pause(time)


% List channels to keep
%
chkp = {'RHipAngles','RKneeAngles','RAnkleAngles',...
        'LHipAngles','LKneeAngles','LAnkleAngles'}';
disp('We list the channels we want to keep as a cell array of strings ''chkp'': ')
disp(chkp)
pause(time)

% Process
%
disp('we call the process with the ''keep'' option: ''bmech_removechannel(fld,chkp,''keep'')'':')
disp(' ')
pause(time)
bmech_removechannel(fld,chkp,'keep');
pause(time)


% Show some results to the user
%
fl = engine('path',fld,'extension','zoo');
data = zload(fl{1});
ch = setdiff(fieldnames(data),'zoosystem');
disp(' ')
disp('Data now contain only the following channels: ')
disp(ch)
pause(time)


% List channels to remove
%
chrm = {'LHipAngles','LKneeAngles','LAnkleAngles'}';
disp('We only wanted the right limb data, we need to remove channels listed in ''chrm'':')
disp(chrm)
pause(time)


% Process
%
disp('We call the process with the ''remove'' option: ''bmech_removechannel(fld,chrm,''remove'')''')
disp(' ')
bmech_removechannel(fld,chrm,'remove');
disp(' ')
pause(time)


% Show some results to the user
%
fl = engine('path',fld,'extension','zoo');
data = zload(fl{1});
ch = setdiff(fieldnames(data),'zoosystem');
disp('Data now contain only the following channels: ')
disp(ch)
disp('A processed file was loaded into the workspace ...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld chkp chrm ch fl

