% bmech_normalize_example demonstrates how to normalize channels in zoo data  
%
% Usage: Normalizing channels is important for plotting multiple trial over a common time 
% interval. 
%
% Example: The files in our example data folder (~/examples/example data) contain a series of 
% gait trials. We would like to present data normalized to 100% of a right limb gait cycle. 
% First, we need to partition the data between 'Right_FootStrike1' and 'Right_FootStrike2'
% Second, we can apply the normalization algorithm. 
% 
% See also bmech_normalize, normaliza_data, bmech_partition, partition_data


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
data1 = zload(fl{1});
data2 = zload(fl{2});
disp('We extract two trials that we want to normalize:')
batchdisp(fl{1},' ')
batchdisp(fl{2},' ')
disp(' ')
pause(time)

disp('Let''s plot the unpartitionned data for the right knee angles using ''plot(data.RKneeAngles.line(:,1))''')
disp(' ')
pause(time)
subplot(1,3,1)
plot(data1.RKneeAngles.line(:,1),'b')
hold on
plot(data2.RKneeAngles.line(:,1),'b')
ylabel('Right Knee Angles (deg)')
xlabel('frames')
title('Unpartitionned data')
pause(time)

% Process
%
evt1 = 'Right_FootStrike1';
evt2 = 'Right_FootStrike2';
disp('First, we will partition all channels between ''evt1'' and ''evt2''):')
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
data1 = zload(fl{1});
data2 = zload(fl{2});
disp('We reload the same two files that are now partitionned:')
batchdisp(fl{1},' ')
batchdisp(fl{2},' ')
disp(' ')
pause(time)

disp('Let''s plot the partitionned data:')
disp(' ')
subplot(1,3,2)
plot(data1.RKneeAngles.line(:,1),'r')
hold on
plot(data2.RKneeAngles.line(:,1),'r')
ylabel('Right Knee Angles (deg)')
xlabel('frames')
title('Partitionned data')
pause(time)


% Normalize
%
disp(['Trial 1 consists of ',num2str(length(data1.RKneeAngles.line)),' frames'])
disp(['Trial 2 consists of ',num2str(length(data2.RKneeAngles.line)),' frames'])
disp(' ')
pause(time)

disp('We now want to normalize both trials to 100% of the gait cycle')
disp('We call ''bmech_normalize(fld)'':')
disp(' ')
bmech_normalize(fld)
disp(' ')
pause(time)


data1 = zload(fl{1});
data2 = zload(fl{2});
disp('We reload the same two files that are now partitionned:')
batchdisp(fl{1},' ')
batchdisp(fl{2},' ')
disp(' ')
pause(time)


disp('Let''s plot the normalized data:')
disp(' ')
subplot(1,3,3)
plot(data1.RKneeAngles.line(:,1),'k')
hold on
plot(data2.RKneeAngles.line(:,1),'k')
ylabel('Right Knee Angles (deg)')
xlabel('frames')
title('Normalized data')
pause(time)


disp(['Trial 1 now consists of ',num2str(length(data1.RKneeAngles.line)),' frames'])
disp(['Trial 2 now consists of ',num2str(length(data2.RKneeAngles.line)),' frames'])
disp(' ')
pause(time)


disp('The two processed files were loaded into the workspace...')
disp(' ')
disp('Explore the files by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld evt1 evt2 fl

