% bmech_renameevent_example demonstrates how to rename events in zoo file channels 
%
% Usage: Renaming events can be useful to clean up data before exporting or graphing results 
% 
% Example: The files in our example data folder (~/examples/example data) contain gait events 
% representing foot strike and foot off timings in the channel 'SACR'. Let's rename 
% 'Right_FootStrike1' to 'RFS1' for all the files. Note, some files don't contain this events,
% not to worry, these files will be skipped
%  
% See also bmech_renameevent, renameevent_data, 


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
oevt = {'Right_FootStrike1'};
disp('We create a cell array of a single string ''oevt'' representing the event to be renamed:')
disp(oevt)
pause(time)

nevt = {'RFS1'};
disp('We create a cell array of a single string ''nevt'' representing the new event name:')
disp(nevt)
pause(time)


% Process data
%
disp('We call bmech_renameevent(fld,oevt,nevt):')
bmech_renameevent(fld,oevt,nevt) 
disp(' ')
pause(time)


% Show some results to the user
%
fl = engine('path',fld,'extension','zoo','search path','Straight');
data = zload(fl{1});
disp('New event ''RFS1'' listed in the channel ''SACR'' event field: ')
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
clear time fld oevt nevt fl

