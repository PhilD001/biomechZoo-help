% bmech_remmoveevent_example demonstrates how to remove events in zoo file channels 
%
% Usage: Removing events can be useful to clean up data before exporting or graphing results 
% 
% Example: The files in our example data folder (~/examples/example data) contain gait events 
% representing foot strike and foot off timings in the channel 'SACR'. Let's remove 
% 'Right_FootStrike1' and 'Right_FootStrike2' from all the files. Note, some files don't
% contain these events, not to worry, these files will be skipped.
%  
% See also bmech_removeevent, removeevent_data


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup;
pause(time)



% Process set up
%
evts = {'Right_FootStrike1';'Right_FootStrike2'};
disp('We create a cell array of strings ''evts'' representing the events to be removed:')
disp(evts)
pause(time)


% Process data
%
disp('We call ''bmech_removeevent(fld,evts,''SACR'')'':')
disp(' ')
pause(time)
bmech_removeevent(fld,evts,'SACR');
disp(' ')
pause(time)


% Show some results to the user
%
fl = engine('path',fld,'extension','zoo','search path','Straight');
data = zload(fl{1});
disp('Event data for the channel ''SACR'' no longer contains the events we removed: ')
disp(' ')
disp('data.SACR.event:')
pause(time)
disp(fieldnames(data.SACR.event))
pause(time)


% Closing message
%
disp('A processed file was loaded into the workspace ...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld evts fl

