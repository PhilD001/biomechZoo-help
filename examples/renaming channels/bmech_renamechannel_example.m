
% bmech_renamechannel_example demonstrates how to rename channels in zoo files. 
%
% Usage: Renaming channels in zoo files can be useful to ensure channel names best represent
% the data. Renaming channels can be beneficial prior to producing figures. 
% 
% Example: The files in our example data folder (~/examples/example data) contain muscle 
% activity channels which contain the prefix 'Voltage'. We would like to remove the prefix
% 'Voltage' from each of these channels.  
%
% See also bmech_renamechannel, renamechannel_data


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup;
pause(time)



% Exisiting channel names
%
och = {'VoltageL_Gast';'VoltageL_Hams';'VoltageL_Rect';'VoltageL_Tib_Ant';...
       'VoltageL_Tib_Post';'VoltageR_Gast';'VoltageR_Hams';'VoltageR_Rect';...
       'VoltageR_Tib_Ant';'VoltageR_Tib_Post'};

disp('We list the existing channel names as cell array of strings ''och'': ')
disp(och)
disp(' ')
pause(time)

% New channel names
%
nch = strrep(och,'Voltage',''); 
disp('We list the new channel names as cell array of strings ''nch'': ')
disp(nch)
pause(time)


% Process
%
disp('we call ''bmech_renamechannel(fld,och,nch)'' to run the process:')
pause(time)
bmech_renamechannel(fld,och,nch);
pause(time)
disp(' ')


% Show some results to the user
%
fl = engine('path',fld,'extension','zoo');
data = zload(fl{1});
pause(time)
disp('A processed file was loaded into the workspace ...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld och nch fl

