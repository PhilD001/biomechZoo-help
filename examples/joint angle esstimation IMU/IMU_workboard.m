% biomechZoo joint angle esstimation template for IMU data
%
% This sample script shows how to compute knee and hip flexion/extention
% angles using biomechzoo
%
% Key information:
% Here both thigh and shank sensors are placed on the lateral side
% example uses raw IMU data and has capabilities to run with and without magnetometer data. 
% (Note: It is prefered to run code with magnetometer data.)
% Things to consider:
% SI units are very important and data should be in the following SI units
% Acceleration  ----  m/s^2
% Gyroscope     ----  rad/s
% Magnetometer  ----  µT (micro Tesla)
% 
% Processed data is used to run the example:
% biomechZoo-help/examples/example data joint angle esstimation IMU\test_data
%
% REQUIREMENTS
% - biomechZoo and biomechZoo-help installed
%
% NOTES:

%  Code will compares MoCap data against the computed IMU angles.
%% Step 0: Data pre-processing -----------------------------------------------------------
% - select 'test_data' from biomechZoo-help/examples/example data joint angle esstimation IMU

mode = 'auto';                                                             % entire code

if strfind(mode,'auto')                                                    %#ok<*STRIFCND>
    tic
    rfld = fullfile(fileparts(which('all_examples_test')),'IMU_kinematics');
    fld = fullfile(rfld,'test_data');
else
    fld=uigetfolder;
end



%% Step 1: joint angle computation -----------------------------------------------------------

segment_pairs = { {'trunk', 'thighR'}, {'thighR', 'shankR'},{'trunk', 'thighL'},{'thighL', 'shankL'}}; % Sensor pairs
parameters.SampleRate=100; % sampling rate
parameters.AccelerometerGain=0.01; % accelerometer gain
parameters.MagnetometerGain=0.01; % magnetometer gain
parameters.HasMagnetometer=true; 
parameters.OrientationFormat="quaternion"; 
bmech_imu_joint_angle(fld,parameters,segment_pairs) % function that will compute the joint angles
%   SampleRate           - Input sample rate of sensor data (Hz)
%   AccelerometerGain    - Gain of accelerometer versus gyroscope
%   MagnetometerGain     - Gain of magnetometer versus gyroscope
%   HasMagnetometer      - Enable magnetometer input
%   OrientationFormat    - Output format specified as "quaternion" or
%                          "Rotation matrix"

%% Step 2: comparing IMU vs Mocap data -----------------------------------------------------------
file=engine('fld',fld,'ext','.zoo');
data=zload(file);
pairs2compare={{'hipR_flex','RHipAngles_x'},{'kneeR_flex','RKneeAngles_x'},{'hipL_flex','LHipAngles_x'},{'kneeL_flex','LKneeAngles_x'}};
row=2;
colum=2;
titles={'Right Hip flexion/extention angle','Right Knee flexion/extention angle','Left Hip flexion/extention angle','Left Knee flexion/extention angle'};
compare_channels(data,pairs2compare,row,colum,titles)