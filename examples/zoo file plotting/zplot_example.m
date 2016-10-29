% zplot_example demonstrates how to plot a single zoo file's line and event data
%
% Usage: Zplot provides a quick way to explore a given zoo file's channel information
%Loading zoo files allow various processess to be run on a given file. 
% 
% Example: We have a file 'HC002D06.zoo' that we would like to open. 
%
% See also zload


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup(false);
pause(time)


% Get a file 
%
fl = engine('pth',fld,'extension','zoo');
file = fl{1};
disp('we select a file from the data base:')
disp(file)
disp(' ')
pause(time)

disp('The zload function relies on Matlab''s built-in ''load'' function')
disp('It is a shortcut to avoid typing the following: ')
disp('data = load(fl,''-mat'');');
disp('data = data.data;')
disp(' ')
pause(time)

disp('Let''s load the file')
disp(' ')
data = zload(file);


disp('Explore data loaded to workspace...')
clear time fld file fl
