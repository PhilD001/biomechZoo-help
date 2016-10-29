% bmech_processGRF_example demonstrates how to process ground reaction force (GRF) data
% in a manner similar to that performed by the Plug-in Gait modeller in Vicon.   
%
% Usage: bmech_processGRF allows users to reproduce or modify standard GRF data processing
%
% Example: The files in our example data folder (~/examples/example data) contain raw GRF data
% Let's run the processs and plot the results for a sample trial 
 
% See also bmech_processGRF, processGRF_data


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup;
pause(time)


% Show initial data to user
%
fl = engine('path',fld,'extension','zoo','search path','Straight');
data = zload(fl{1});
disp('We extract a trial with raw GRF data:')
batchdisp(fl{1},' ')
disp(' ')
pause(time)

disp('Let''s plot the vertical GRF for force plate 2 using plot(data.ForceFz2.line)')
disp(' ')
subplot(1,3,1)
plot(data.ForceFz2.line(:,1))
ylabel('Vertical GRF (N)')
xlabel('frames')
title('Raw')
xlim([0 length(data.ForceFz2.line(:,1))])
pause(time)

disp('bmech_processGRF(fld) performs a number of processing steps: ')
disp('1-filtering (see filter_data.m)')
disp('2-resampling to match kinematic data (see resample_data.m)')
disp('3-computes center of pressure (see centreofpressure_data.m')
disp('4-associate limb to force plate (see forceplate2limbside_data.m')
disp('5-normalize data to mass (N to N/kg) (see massnormalize_data.m)')
disp('6-Change reference system (see grfref_data)')
disp(' ')
pause(time)

disp('We will run each of these processess and show intermediate outputs (where relevant)')
disp(' ')
pause(time)

% Filter
disp('We filter and plot the data')
disp(' ')
data = filter_data(data,data.zoosystem.Analog.FPlates.LABELS);

subplot(1,3,1)
hold on
plot(data.ForceFz2.line(:,1),'r')
ylabel('Vertical GRF (N)')
xlabel('frames')
title('Raw + Filtered')
legend('raw','filtered')
pause(time)


% resample
disp('We now resample GRF to match the kinematic output:')
disp(['Original sampling rate: ',num2str(data.zoosystem.Analog.Freq),' Hz'])
data = resample_data(data,data.zoosystem.Analog.FPlates.LABELS);
disp(['New sampling rate: ',num2str(data.zoosystem.Analog.Freq),' Hz'])
disp(' ')
pause(time)

disp('Let''s plot the resampled data')
disp(' ')
subplot(1,3,2)
plot(data.ForceFz2.line(:,1))
ylabel('Vertical GRF (N)')
xlabel('frames')
title('Down-Sampled')
xlim([0 length(data.ForceFz2.line(:,1))])


% cop
localOr = getFPLocalOrigin(data);                               % true local FP origin
[globalOr,orientFP] = getFPGlobalOrigin(data);
data = centreofpressure_data(data,localOr,globalOr,orientFP);  % compute cop w orientFP

% rename
disp('The force plate channels are now renamed similar to PiG outputs')
disp('Original force plate channel names: ')
disp(data.zoosystem.Analog.FPlates.LABELS)
data = forceplate2limbside_data(data);                         % ass limb side w FP
data = fprename_data(data);                                         % rename 'RightGroundRea...'
disp('New force plate channel names: ')
disp(data.zoosystem.Analog.FPlates.LABELS')
pause(time)

% mass normalize
disp('In order to compare GRF across subjects, we normalize by subject mass')
disp(['The mass for this subject is: ',num2str(data.zoosystem.Anthro.Bodymass),' kg'])
disp(' ')
disp('Let''s mass normalize and plot the data')
disp(' ')
data = massnormalize_data(data,data.zoosystem.Analog.FPlates.LABELS);

subplot(1,3,3)
plot(data.RightGroundReactionForce.line(:,3))
ylabel('Vertical GRF (N/kg)')
xlabel('frames')
title('Mass normalized')
xlim([0 length(data.RightGroundReactionForce.line(:,1))])
pause(time)


% Change reference system
%
disp('Let''s update the GRF reference system and plot the data')
disp(' ')
data = grfref_data(data,orientFP);
subplot(1,3,3)
hold on
plot(data.RightGroundReactionForce.line(:,3),'r')
title('Mass normalized+ ref change')
legend('Normalize','New Ref')
pause(time)


disp('A processed file was loaded into the workspace...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld evt1 evt2 fl localOr globalOr orientFP
