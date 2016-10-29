% bmech_kinematicsRvdB_example demonstrates how to compute lower-limb 
% (ankle, knee, hip) joint kinematics using the kinemat toolbox of Reinschmidt 
% and Van den Bogert
%
% Usage: Computing joint kinematics allows for an understanding of how body segments move in 
% relation to each other.  
%
% Example: The files in our example data folder (~/examples/example data) contain marker data 
% affixed to body segments. Use these markers to compute ankle kinematics using the kinemat 
% toolbox functions. 
%
%
% See also bmech_kinematicsRvdB,  bmech_kinematics, kinematicsRvdB_data, kinematics_data


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup(false);
pause(time)


% Info
%
disp('Ankle kinematics represent the movement of the foot relative to the shank')
disp(' ')
disp('We need to identify at least three markers to define each segment:')
disp('Defnine ''Shank'':')
Shank  = {'ANK','TIB','HFB'};                                            % for kinemat
disp(Shank)
disp('Define: ''Foot'':')
Foot = {'HEE','TOE','D5M'};
disp(Foot)
pause(time)


% Process
%
disp('kinemat processing requires both static and dynamic trials to compute kinematics')
disp(' ')
disp('We will load a subject for which both these trials are available:')
pause(time)


% Load files
%
flSta = engine('path',fld,'extension','zoo','search path','Static','search file','HC032');
flDyn = engine('path',fld,'extension','zoo','search path','Straight','search file','HC032');

batchdisp(flSta{1},' ')
batchdisp(flDyn{1},' ')
disp(' ')
sdata = zload(flSta{1});
data  = zload(flDyn{1});
pause(time)

% Process
%
sequence = 'yxz';
disp('We must define the cardan sequence to use for computation, we choose ''sequence = yxz'':')
disp(' ')
disp(' ')
pause(time)

disp('We call the function as ''kinematicsRvdB_data(sdata,data,{''},{''},Shank,Foot,sequence,test)''')
test = true;
disp('The function will produce plots when test = true')
disp(' ')
data = kinematicsRvdB_data(sdata,data,{''},{''},Shank,Foot,sequence,test);
disp(' ')
pause(time)



% Final output to user
disp('A processed file was loaded into the workspace...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld fl test






