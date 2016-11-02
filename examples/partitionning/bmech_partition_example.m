% bmech_partition_example demonstrates how to parttion channels in zoo  
%
% Usage: Partitionning files is relevant when one wants to focus on a particular section of the
% data time series. Partitioning can make event identification or computations easier since data
% are restricted to a known zone.
%
% Example: The files in our example data folder (~/examples/example data) contain gait events
% representing foot strike and foot off. Let's partition trials to contain a single right limb
% stance phase defined from 'Right_FootStrike1' to 'Right_FootStrike2'.
 

% See also bmech_partition, partition_data


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup;
pause(time)


% Show some results to the user
%
fl = engine('path',fld,'extension','zoo','search path','Straight');
data = zload(fl{1});

disp('We extract a trial to show existing events and data: :')
disp(fl{1})
disp(' ')
disp(['Right_FootStrike1 occurs at frame: ',num2str(data.SACR.event.Right_FootStrike1(1))])
disp(['Right_FootStrike2 occurs at frame: ',num2str(data.SACR.event.Right_FootStrike2(1))])
disp(' ')
pause(time)

disp('Let''s plot the data for the right knee angles using ''plot(data.RKneeAngles.line(:,1))''')
disp(' ')
subplot(1,2,1)
plot(data.RKneeAngles.line(:,1))
ylabel('Right Knee Angles (deg)')
xlabel('frames')
title('Unpartitionned data')
pause(time)

% Process
%
evt1 = 'Right_FootStrike1';
evt2 = 'Right_FootStrike2';
disp('We will partition all channels between ''evt1'' and ''evt2''):')
disp(['evt1: ',evt1])
disp(['evt2: ',evt2])
disp(' ')
pause(time)


disp('We call ''bmech_partition(fld,evt1,evt2)'':')
disp(' ')
bmech_partition(fld,evt1,evt2)
disp(' ')
pause(time)


% Show some results to the user
%
data = zload(fl{1});
disp('We reload the same file that is now partitionned:')
disp(fl{1})
disp(' ')
pause(time)

% Plot some results for user to explore
%
disp('the new event indices are: ')
disp(['Right_FootStrike1 occurs at frame: ',num2str(data.SACR.event.Right_FootStrike1(1))])
disp(['Right_FootStrike2 occurs at frame: ',num2str(data.SACR.event.Right_FootStrike2(1))])
disp(' ')

disp('Let''s replot the data:')
disp(' ')
subplot(1,2,2)
plot(data.RKneeAngles.line(:,1),'r')
ylabel('Right Knee Angles (deg)')
xlabel('frames')
title('Partitionned data')
pause(time)

disp('The plot shows the recognizable gait cycle for the right knee')
disp(' ')


disp('A processed file was loaded into the workspace...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld evt1 evt2 fl

