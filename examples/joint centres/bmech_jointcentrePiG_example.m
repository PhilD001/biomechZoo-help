% bmech_jointcentrePiG_example demonstrates how to compute lower-limb joint angles for 
% plug-in gait (PiG) data 
%
% Usage: Computing joint centres is a preliminary step for further kinematic processess such 
% as computing joint angles 
%
% Example: The files in our example data folder (~/examples/example data) contain PiG markers
% We will compute hip, knee, and ankle joint centers using the methods described by PiG. We
% compare our results to the original PiG joint centers.
%
% See also bmech_jointcentrePiG,  hipjointcentrePiG_data, jointcentrePiG_data


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
disp('We extract a trial containing joint centres computed by PiG modeller:')
batchdisp(fl{1},' ')
disp(' ')
pause(time)


% Compute hip joint centre
%
disp('We compute the hip joint centre by calling ''hipjointcentrePiG_data(data,test)'':')
disp('Note: With the second argument set to ''true'', the function will compare outputs')
disp('between the PiG and biomechZoo versions')
disp(' ')
test = true;
data = hipjointcentrePiG_data(data,test);
pause(time)

% Compute knee
%
disp('We compute the knee joint centre by calling ''jointcentrePiG_data(data,''knee'',test)'':')
disp('Here we set the 3rd argument test to ''true'' in order to compare outputs')
disp(' ')
data = jointcentrePiG_data(data,'knee',test);
pause(time)


% Compute Ankle
%
disp('We compute the akle joint centre by calling ''jointcentrePiG_data(data,''ankle'',test)'':')
disp('Again, we set the 3rd argument test to ''true'' in order to compare outputs')
disp(' ')
data = jointcentrePiG_data(data,'ankle',test);
pause(time)


% Final output to user
disp('Explore figures...')
disp(' ')
disp('A processed file was loaded into the workspace...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld fl test






