% xsens2zoo_example demonstrates how to convert xsens files to zoo format
% using the xsens2zoo function
%
% Usage: Helps users import XSens IMU data into biomechZoo
%
% Example: The files in our example data folder (~/examples/example data) contain 
% some Xsens files. We will convert these files to zoo. 


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup;
pause(time)


% Process
%
ext = '.xlsx';
disp('This folder contains the following xlsx Xsens files: ')
fl = engine('path',fld,'extension',ext,'search file','xsens');
for i = 1:length(fl)
    disp(fl{i})
end
disp(' ')
pause(time)

disp('We call xsens2zoo(fld) to process these files:')
disp(' ')
xsens2zoo(fld,ext);               

%load a trial
trial=fl{i};
trial_zoo = strrep(trial, ext,'.zoo');
data = zload(trial_zoo);


% Final message to user
%
[~,file] = fileparts(data.zoosystem.SourceFile);
disp(' ')
disp(['We load the zoo file created from ',file,ext])
disp(' ')
disp('Explore the new zoo file loaded in the workspace...')
disp(' ')
clear fl fld i time file ext
