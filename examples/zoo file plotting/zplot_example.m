% zplot_example demonstrates how to plot a single zoo file's line and event data
%
% Usage: Zplot provides a quick way to explore a given zoo file's channel information
% 
% Example: We would like to plot the right ankle power channel's line and event data for
% one of the zoo files in the database. These files don't have any events, so it would
% be interesting to first create an event (we will chose max for simplicity). Also, 
% relevent power data is in third column so we will explode the channel first.
%
% See also zplot


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
data = zload(file);
disp('we select a file from the data base:')
batchdisp(file,' ')
disp(' ')
pause(time)

disp('We start by exploding the channel into 3 n x 1 channels')
disp(' ')
data = explode_data(data,'RAnklePower');
pause(time)

disp('We then add the event ''max'' to the ''RAnklePower_z'' channel: ')
data = addevent_data(data,'RAnklePower_z','max','max');
pause(time)

disp('Now let''s plot the channel using ''zplot(data.RAnklePower''')
zplot(data.RAnklePower_z)
pause(time)

disp('Let''s load the file')
disp(' ')
data = zload(file);


disp('Explore graph and data loaded to workspace...')
clear time fld file fl
