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
fld_HC031A = [fld, filesep, 'HC031A'];
fl = engine('path',fld_HC031A,'extension','zoo');
disp('We conduct dynamic normalization on 2 trials...')
for i = 1:length(fl)
    batchdisp(fl{i},' ')
end
disp(' ')
pause(time)


disp('lets conduct basic EMG processing first using bmech_emgprocess(fld) for R_gast... ')
disp(' ')
lp_cut = 450;
hp_cut = 20;
order = 4;
span = 50;
bmech_emgprocess(fld_HC031A,{'VoltageR_Gast'}, lp_cut,hp_cut,order,span);
pause(time)

disp('lets rename processed channel names as they are very long ... ')
disp(' ')
och = {'VoltageR_Gast_filthigh_filtlow_rect_RMS'};
nch = {'R_Gast_processed'};
disp(['old channel names', och])
disp(['new channel names', nch])
bmech_renamechannel(fld_HC031A,och,nch);
pause(time)

disp('lets conduct dynamic normlization ... ')
disp(' ')
bmech_emg_dynamic_normalization(fld_HC031A,nch)

disp('reload new normalized data...')
fl =  engine('path',fld_HC031A,'extension','zoo');

for i = 1:length(fl)
    data= zload(fl{i});
    raw = data.VoltageR_Gast.line;
    processed = data.R_Gast_processed.line;
    normalized = data.R_Gast_processed_normalized.line;
    subplot(2,3,3*i-2)
    plot(raw)
    xlabel('frames')
    ylabel('raw')
    subplot(2,3,3*i-1)
    plot(processed)
    xlabel('frames')
    ylabel('processed')
    subplot(2,3,3*i)
    plot(normalized)
    xlabel('frames')
    ylabel('normalized')
    
end

