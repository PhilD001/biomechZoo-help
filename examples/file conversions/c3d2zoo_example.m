% c3d2zoo_example demonstrates how to convert c3d files to zoo format
% using the c3d2zoo function
%
% Usage: Many systems in biomechanics use the c3d file format to store data. In order to use
% these files in biomechZoo, we must convert these files to zoo format. This format has expected
% fields that make processing easier. 
%
% Example: The files in our example data folder (~/examples/example data) contain some c3d files
% We will convert these files to zoo 


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
ext = '.c3d';
disp('This folder contains the following c3d files: ')
fl = engine('path',fld,'extension',ext);
for i = 1:length(fl)
    batchdisp(fl{i},' ')
end
disp(' ')
pause(time)

disp('We call c3d2zoo(fld) to process these files:')
disp(' ')
c3d2zoo(fld);               

%load a trial
trial=fl{i};
trial_zoo = strrep(trial,'.c3d','.zoo');
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
