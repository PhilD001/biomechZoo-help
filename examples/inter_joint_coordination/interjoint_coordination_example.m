% interjoint-coordination example script
%
% In this example, interjoint-coordination between the hip and knee are
% calculated based on the Hilbert transform. 
%
%
% Output metrics
% - mean absolute relative phase
% - deviation phase

% References
% - Lamb, P.F., Stockl, M., On the use of continuous relative phase: review of current approaches and outline for a new 
%   standard. Clin. Biomech. 2014. 29 (5), 484?493. https:// doi.org/10.1016/j.clinbiomech.2014.03.008.
%
% - Ippersiel, P et al. Movement variability in adults with low back pain during sit-to-stand-to-sit
%   Clinical Biomechanics, 2018, 58, 90 - 95. https://doi.org/10.1016/j.clinbiomech.2018.07.011
%
% - Ippersiel, P et al. The Effects of Data Padding Techniques on Continuous Relative-Phase Analysis Using the Hilbert 
%   Transform, Journal of Applied Biomechanics, 2019. 35(4), 247-255. https://doi.org/10.1123/jab.2018-0396

%% STEP 0: GET SAMPLE DATA
% - loads data from the biomechZoo sample study
root = fileparts(which('bmech_addevent'));
indx = strfind(root, 'biomechZoo');
root_help = [root(1:indx-1), 'biomechZoo-help'];
src_data = [root_help, filesep, 'sample study', filesep,'Data', filesep, '1-c3d2zoo'];
dest_data = [root_help, filesep, 'examples', filesep,'inter_joint_coordination', filesep, 'Data'];
copyfile(src_data, dest_data)

%% STEP 1: PREPARE DATA SET
% - keep trials starting with a right foot strike (arbitrary)
% - remove trials that are too short

fld = dest_data;
fl_static = engine('path',fld,'extension','zoo', 'folder', 'Static');
fl_turn = engine('path',fld,'extension','zoo', 'folder','Turn');
fl_straight = engine('path',fld,'extension','zoo', 'folder','Straight');

delfile(fl_static)
delfile(fl_turn)

for i = 1:length(fl_straight)
 
    data = zload(fl_straight{i});
    RFS1 = findfield(data, 'Right_FootStrike1');
    LFS1 = findfield(data, 'Left_FootStrike1');
    RFO2 = findfield(data, 'Right_FootOff2');
    if RFS1(1) > LFS1(1)
       delfile(fl_straight{i}); 
    end
    
    if isempty(RFO2)
        delfile(fl_straight{i});
    end
        
    if strfind(fl_straight{i}, 'HC036')  % contains some nans so remove
        delfile(fl_straight{i});
    end

end

%% STEP 2 : CLEAN UP DATA
% - data are cut (partitionned) over the same section of the gait cycle
% - channels not required are removed to speed up downstream processes
% - channels are exploded (one n x 3 channel becomes three n x 1 channels) 
% - data are normalized to same length (101 frames)
bmech_partition(fld,'Right_FootStrike1', 'Right_FootOff2')
bmech_removechannel(fld, {'SACR', 'LKneeAngles', 'LHipAngles'}, 'keep')
bmech_explode(fld)
bmech_normalize(fld)

%% STEP 3: COMPUTE PHASE ANGLES
% - phase angle computed using hilbert transform
% - data before and after evt1 and evt2 are used for padding to obtain
%   stable Hilbert transform results. 
% - Phase angle data before and after events are set to zeros
evt1 = 'Left_FootStrike1';
evt2 = 'Left_FootStrike2';
chns = {'LHipAngles_x', 'LKneeAngles_x'}; 
bmech_phase_angle(fld, chns, evt1, evt2)

%% STEP 4: COMPUTE CRP
% - continuous relative phase is computed
% - creates new channel with crp data called LKneeAngles_x_phase_LHipAngles_x_phase_crp
dist_phase_angle_ch = 'LKneeAngles_x_phase';
prox_phase_angle_ch = 'LHipAngles_x_phase';
bmech_continuous_relative_phase(fld, dist_phase_angle_ch, prox_phase_angle_ch)

%% STEP 5: COMPUTE METRICS AND PLOT
% - collect CRP and run basic stats to get output metrics
crp_ch = 'LKneeAngles_x_phase_LHipAngles_x_phase_crp';
fl = engine('path',fld,'extension','zoo');
crp_stk = [];
for i = 1:length(fl)
    data = zload(fl{i});
    r = data.(crp_ch).line;
    crp_stk = [crp_stk r];
end
    
[MARP,DP]=CRP_stats(crp_stk');

figure
title('MARP and DP')
plot(MARP, 'LineWidth',2)
hold on
plot(DP, 'LineWidth',2)
legend ('MARP','DP')
title('CRP zoo')

