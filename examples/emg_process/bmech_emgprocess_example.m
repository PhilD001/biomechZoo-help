% bmech_emgprocess_example demonstrates how to run basic emg processing steps
%
% Usage: bmech_emgprocess allows users to peform the followig operations: 
%  1- High pass filter @ 20Hz
%  2- Low-pass filter  @ 500 Hz
%  3- Rectify signal
%  4- Root mean square 
%
% Example: The files in our example data folder (~/examples/example data) 
% contain raw EMG data
% Let's run the processs and plot the results for a sample trial 
 
% See also bmech_emgprocess, emgprocess_data


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
disp('We extract a trial with raw EMG:')
batchdisp(fl{1},' ')
disp(' ')
pause(time)

disp('Let''s plot the raw EMG signal for the Right gastroc')
disp(' ')
subplot(1,5,1)
plot(data.VoltageR_Gast.line(:,1))
ylabel('EMG')
xlabel('frames')
ylabel('Raw')
xlim([0 length(data.VoltageR_Gast.line(:,1))])
pause(time)

disp('bmech_emgprocess(fld) performs a number of processing steps: ')

disp('1- High pass filter @ 20Hz')
disp('2- Low-pass filter  @ 456 Hz')
disp('3- Rectify signal')
disp('4- Root mean square over 50 frames')
disp(' ')
pause(time)

disp('We will run these processess and show intermediate outputs')
disp(' ')
pause(time)

lp_cut = 450;
hp_cut = 20;
order = 4;
span = 50;
data = emgprocess_data(data,{'VoltageR_Gast'}, lp_cut,hp_cut,order,span);

subplot(1,5,2)
hold on
plot(data.VoltageR_Gast_filthigh.line,'r')
xlabel('frames')
ylabel('High pass filtered')
ylim([-0.8, 0.6])

subplot(1,5,3)
plot(data.VoltageR_Gast_filthigh_filtlow.line)
xlabel('frames')
ylabel('High pass + low pass filter')
ylim([-0.8, 0.6])

subplot(1,5,4)
plot(data.VoltageR_Gast_filthigh_filtlow_rect.line)
xlabel('frames')
ylabel('High pass + low pass filter + Rectifty')
ylim([-0.8, 0.6])

subplot(1,5,5)
plot(data.VoltageR_Gast_filthigh_filtlow_rect_RMS.line)
xlabel('frames')
ylabel('High pass + low pass filter + Rectifty + RMS')
ylim([-0.8, 0.6])