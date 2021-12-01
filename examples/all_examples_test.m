function all_examples_test

% ALL_EXAMPLES_TEST runs through every example to test that there are no errors


% Basic operations ----------------------------------------------------------------------------	
%
engine_example		
zload_example		
zplot_example		
eventval_example		

% Biomechanical / advanced operations ---------------------------------------------------------	
%																   	
bmech_processGRF_example			
bmech_jointcentrePiG_example		
bmech_kinematicsRvdB_example		
bmech_kinematics_example			
bmech_kinetics_example			
bmech_emgprocess_example
bmech_cocontraction_example
bmech_emg_dynamic_normalization_example
% Zoo conversion: ----------------------------------------------------------------------------
													
generic2zoo_example		
c3d2zoo_example			
csv2zooVicon_example
xsens2zoo_example
biometricsEMG2zoo_example


% Zoo processing ------------------------------------------------------------------------------
%													
addchannel_data_example			
bmech_addevent_example			
bmech_removeevent_example		
bmech_removechannel_example		
bmech_renamechannel_example		
bmech_renameevent_example	
bmech_explode_example
bmech_normalize_example			
bmech_partition_example			

% Visualization--------------------------------------------------------------------------------
%
sampleprop_example
