% zload_example demonstrates how to load a zoo file into Matlab's workspace 
%
% Usage: Loading zoo files allow various processess to be run on a given file. 
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
batchdisp(file,' ')
disp(' ')
pause(time)

disp('The zload function relies on Matlab''s built-in ''load'' function')
disp('It is a shortcut to avoid typing the following: ')
disp('data = load(fl,''-mat'');');
disp('data = data.data;')
disp(' ')
pause(time)

disp('Let''s load the file using ''data = zload(file)''')
disp(' ')
data = zload(file);


disp('Explore data loaded to workspace...')
clear time fld file fl
