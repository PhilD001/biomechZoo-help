% bmech_addevent_example demonstrates how to add events to zoo file channels 
%
% Usage: Adding events is how analysis results are stored. Events can be extracted in graphical
% form (ensembler) or exported (eventval) for statistical analyses in external programs
% 
% Example: The files in our example data folder (~/examples/example data) contain force plate 
% data. Let's compute the peak vertical force for the second force plate ('ForceFz2' )and store
% it as an  event called 'PeakFz'  

% See also bmech_addevent, addevent_data


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
disp('Let''s identify the peak using the ''min'' option and call it ''PeakFz'':')
disp('bmech_addevent(fld,''ForceFz2'',''PeakFz'',''min'')')
disp(' ')
pause(time)
bmech_addevent(fld,'ForceFz2','PeakFz','min');
disp(' ')
pause(time)


% Show some results to the user
%
fl = engine('path',fld,'extension','zoo','search path','Straight');
data = zload(fl{1});
disp('Event data are always saved as a 1 x 3 matrix [exd eyd 0], where:')
disp('exd represents the index of the event, i.e., when it occurs')
disp('eyd represents the value of the event at the identified index')
disp('*third element is normally unused and set to 0')
disp(' ')
pause(time)

% Plot some results for user to explore
%
disp('Let''s plot the data with the event using zplot(data.ForceFz2):')
disp(' ')
pause(time)
disp('The plot shows the line and event data, clicking on the event reveals it''s name')

figure
zplot(data.ForceFz2)
ylabel('Ground Reaction Force (N)')
xlabel('frames')
pause(time)

disp('The event branch for channel ''ForceFz2'' now contains the  index and value''PeakFz'' information: ')
disp(data.ForceFz2.event)
disp('A processed file was loaded into the workspace...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld indx fld fl

