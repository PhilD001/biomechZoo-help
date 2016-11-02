22.10.2016 README for biomechZoo example files

Each of the subfolders in 'biomechZoo\examples' contain an example script that can be used to better understand a specific
function or process in the biomechZoo toolbox

Running examples: 
Open a given example script and left click on the 'run' icon. Scripts will run and provide some feedback in the command window. Additional folders may also be created, depending on the example requirements



Examples: 

Basic operations -----------------------------------------------------------------------------------------------	
									
- file searching:							engine_example.m		
- loading zoo files:						zload_example.m		
- plotting zoo files:						zplot_example.m		
- exporting events:						eventval_example.m		

Biomechanical / advanced operations -------------------------------------------------------------------	
																   	
- processing ground reaction forces: 			bmech_processGRF_example.m			
- computing joint centres:					bmech_jointcentrePiG_example.m		
- computing kinematics (kinemat  approach):	bmech_kinematicsRvdB_example.m		
- computing kinematics (PiG approach):		bmech_kinematics_example.m			
- computing kinetics:						bmech_kinetics_example.m			


Zoo conversion: ----------------------------------------------------------------------------------------------
													
- converting from generic text file:			generic2zoo_example.m		
- converting from c3d: 					c3d2zoo_example.m			
- converting from csv (Vicon):           			csv2zooVicon_example.m		


Zoo processing ------------------------------------------------------------------------------------------------
													
- adding channels:						addchannel_data_example.m			
- adding events:						bmech_addevent_example.m			
- removing events:						bmech_removeevent_example.m		
- removing channels:						bmech_removechannel_example.m		
- renaming channels:						bmech_renamechannel_example.m		
- renaming events:						bmech_renameevent_example.m
- splitting n x 3 channels: 					bmech_explode_example.m		
- normalizing data:						bmech_normalize_example.m			
- partitionning data:						bmech_partition_example.m			

Visualization --------------------------------------------------------------------------------------------------

- Creating a prop in director: 				sampleprop_example.m

Please contact philippe dot dixon at gmail dot com to contribute to or request new examples