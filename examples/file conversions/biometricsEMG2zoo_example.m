% biometricsEMG2zoo_example demonstrates how to convert files exported from the 
% biometrics data logger to zoo format using the biometricsEMG2zoo function
%
% Usage: Helps users import biometrics data logger EMG data into biomechZoo
%
% Example: The files in our example data folder (~/examples/example data) contain 
% an biometrics data logger file. We will convert the file to zoo. 


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
ext = '.csv';
disp('This folder contains the following biometrics data logger files: ')
fl = engine('path',fld,'search file','biometricsEMG2zoo_sample_file.csv');
for i = 1:length(fl)
    disp(fl{i})
end
disp(' ')
pause(time)

disp('We call biometricsEMG2zoo(fld) to process these files:')
disp(' ')
data = biometricsEMG2zoo(fl{1});               

% Final message to user
%
[~,file] = fileparts(data.zoosystem.SourceFile);
disp(' ')
disp(['We load the zoo file created from ',file,ext])
disp(' ')
disp('Explore the new zoo file loaded in the workspace...')
disp(' ')
clear fl fld i time file ext
