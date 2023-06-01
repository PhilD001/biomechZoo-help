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
% - remove turning and static trials
% - remove trials that are too short

fld = dest_data;
fl_static = engine('path',fld,'extension','zoo', 'folder', 'Static');
fl_turn = engine('path',fld,'extension','zoo', 'folder','Turn');

delfile(fl_static)
delfile(fl_turn)


%% STEP 2 : CLEAN UP DATA
% - channels not required are removed to speed up downstream processes
% - channels are exploded (one n x 3 channel becomes three n x 1 channels) 
bmech_removechannel(fld, {'SACR', 'RKneeAngles', 'RHipAngles'}, 'keep')
bmech_explode(fld)

%% STEP 3: COMPUTE PHASE ANGLES
% - phase angle computed using hilbert transform
% - data before and after evt1 and evt2 are used for padding to obtain
%   stable Hilbert transform results. 
% - Phase angle data before and after events are set to zeros
evt1 = 'Right_FootStrike1';
evt2 = 'Right_FootStrike2';
chns = {'RHipAngles_x', 'RKneeAngles_x'}; 
bmech_phase_angle(fld, chns, evt1, evt2)

%% STEP 4: COMPUTE CRP
% - continuous relative phase is computed
% - creates new channel with crp data called LKneeAngles_x_phase_LHipAngles_x_phase_crp
dist_phase_angle_ch = 'RKneeAngles_x_phase';
prox_phase_angle_ch = 'RHipAngles_x_phase';
bmech_continuous_relative_phase(fld, dist_phase_angle_ch, prox_phase_angle_ch)

%% STEP 5: PARTITION AND NORMALIZE DATA
% - get rid of data before and after events
% - normalize to 100% to allow computation of CRP stats MARP, DP)
bmech_partition(fld, 'Right_FootStrike1', 'Right_FootStrike2')
bmech_normalize(fld)

%% STEP 5: COMPUTE METRICS AND PLOT
% - collect CRP and run basic stats to get output metrics

crp_ch = 'RHipAngles_x_phase_RKneeAngles_x_phase_crp';
fl = engine('path',fld,'extension','zoo');
crp_stk = zeros(length(fl), 101);
for i = 1:length(fl)
    data = zload(fl{i});
    crp_stk(i, :) = data.(crp_ch).line;
end
    
[MARP,DP]=CRP_stats(crp_stk);

figure
title('MARP and DP')
plot(MARP, 'LineWidth',2)
hold on
plot(DP, 'LineWidth',2)
legend ('MARP','DP')
title(crp_ch)

