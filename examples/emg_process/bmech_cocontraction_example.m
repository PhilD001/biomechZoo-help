% bmech_cocontraction_example demonstrates how to run mucle cocontraction analysis
%
% Usage: bmech_cocontraction allows users to copute muscle cocontraction using different methods

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

disp('Let''s plot the raw EMG signal for the Right gastroc and Right Rib ant...')
disp(' ')
subplot(5,2,1)
plot(data.VoltageR_Gast.line(:,1))
ylabel('EMG')
xlabel('frames')
ylabel('Raw')
xlim([0 length(data.VoltageR_Gast.line(:,1))])
subplot(5,2,2)
plot(data.VoltageR_Tib_Ant.line(:,1))
ylabel('EMG')
xlabel('frames')
ylabel('Raw')
pause(time)

disp('lets conduct basic EMG processing first using bmech_emgprocess(fld)... ')
disp(' ')
lp_cut = 450;
hp_cut = 20;
order = 4;
span = 50;
data = emgprocess_data(data,{'VoltageR_Gast'}, lp_cut,hp_cut,order,span);
data = emgprocess_data(data,{'VoltageR_Tib_Ant'}, lp_cut,hp_cut,order,span);
pause(time)

disp('lets rename processed channel names as they are very long ... ')
disp(' ')
och = {'VoltageR_Gast_filthigh_filtlow_rect_RMS', 'VoltageR_Tib_Ant_filthigh_filtlow_rect_RMS'};
nch = {'R_Gast_processed', 'R_Tib_Ant_processed'};
disp(['old channel names', och])
disp(['new channel names', nch])
data = renamechannel_data(data,och,nch);

subplot(5,2,3)
plot(data.R_Gast_processed.line)
xlabel('frames')
ylabel('processed')
subplot(5,2,4)
plot(data.R_Tib_Ant_processed.line)
xlabel('frames')
ylabel('processed')

disp('lets conduct co-contraction analsysis using different methods ... ')
disp(' ')
pairs = {'R_Gast_processed-R_Tib_Ant_processed'};
methods = {'Rudolph','Falconer', 'Lo2017'};

for i = 1:length(methods)
    disp(['method ', methods{i},' ...'])
    if strcmp(methods{i}, 'Lo2017')
        evts = {'Right_FootStrike1','Right_FootStrike2'};
        data = cocontraction_data(data,pairs,methods{i},evts);
    else
        data = cocontraction_data(data,pairs,methods{i});
    end
    subplot(5,2,2*i +3)
    plot(data.(['R_Gast_processed_R_Tib_Ant_processed','_',methods{i}]).line)
    xlabel('frames')
    ylabel(['cc (',methods{i},')'])
   
end

