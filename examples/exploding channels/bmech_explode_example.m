% bmech_explode_example demonstrates how to separate n x 3 channels into 3 separate n x 1
% channels using bmech_explode 
%
% Usage: Exploding channels is useful for graphing and adding events, allowing a single vector
% to be examined. 
%
% Example: The files in our example data folder (~/examples/example data) have unexploded
% channels. Let's explode 'RAnklePower' and 'LAnklePower'  

% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup(false);
pause(time)


% Get a file 
%
fl = engine('pth',fld,'extension','zoo');
file = fl{1};
data = zload(file);
disp('we select a file from the data base:')
batchdisp(file,' ')
disp(' ')
pause(time)

chns = {'RAnklePower','LAnklePower'}; 
disp('We want to explode the channels in ''chns'':')
disp('chns = ')
disp(chns)
disp(' ')
pause(time)

disp('Explode channels by calling ''data = explode_data(data,''chns'')'':')
disp(' ')
data = explode_data(data,chns);
pause(time)

disp('The data now contain 6 new n x 1 channels')
ch = fieldnames(data);
ch = ch(end-5:end);
disp(ch)
disp(' ')
pause(time)

disp('A processed file was loaded into the workspace...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear ch chns file fl fld time 