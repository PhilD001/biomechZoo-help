% addchannel_data_example demonstrates how to add channels in zoo files.
%
% Usage: Adding channels can be useful to store new computed quantities as
% line data (for addition of discrete events see bmech_addevent)
%
% Note: There is no 'bmech_addchannel' file in the biomechZoo toolbox. Users must bulid
% their own batch process file which calls 'addchannel_data' on each loaded zoo file
%
% Example: The files in our example data folder (~/examples/example data) contain force data.
% We would like to compute the magnitude of the resultant vector across time for force plate2
% and add this information as a new channel  'ForceFmag2'
%
% See also addchannel_data


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup;
pause(time)


% Process
%
disp('In order to add channels to our data, we need to build our own batch process script:')
disp(' ')
disp('fl = engine(''fld'',fld,''extension'',''zoo'')');                        
disp(' ')
disp('for i = 1:length(fl)')
disp('    data = zload(fl{i})');                                       
disp('    batchdisplay(fl{i},''computing resultant force'')')              
disp(' ')   
disp('    fx = data.ForceFx2.line');                                     
disp('    fy = data.ForceFy2.line');                
disp('    fz = data.ForceFz2.line');
disp(' ')    
disp('    Fmag = magnitude([fx fy fz])');                                
disp(' ')    
disp('    data = addchannel_data(data,''Fmag2'',Fmag,''Video'')');           
disp(' ')   
disp('    zsave(fl{i},data)')                                            
disp('end')
disp(' ')
pause(time)

disp('Note: Fmag is added by calling data = addchannel_data(data,''Fmag2'',Fmag,''Video'')');
disp(' ')
pause(time)


fl = engine('fld',fld,'extension','zoo');                        % get location of all files

for i = 1:length(fl)
    data = zload(fl{i});                                         % load individual file
    batchdisplay(fl{i},'computing resultant force')              % display message to user
    
    fx = data.ForceFx2.line;                                     % extract forces
    fy = data.ForceFy2.line;                
    fz = data.ForceFz2.line;
    
    Fmag = magnitude([fx fy fz]);                                % compute magnitude
    
    data = addchannel_data(data,'Fmag2',Fmag,'Video');           % add magnitude info to data
    
    zsave(fl{i},data)                                            % save info to zoo file
end
disp(' ')
pause(time)


% Show some results to the user
%
fl = engine('path',fld,'extension','zoo');
data = zload(fl{1});
pause(time)
disp('Each file now contains the new channel ''Fmag2'': ')
disp(' ')
disp('A processed file was loaded into the workspace ...')
disp(' ')
disp('Explore the file by double clicking on ''data'' or by typing ''data'' in the command window')
clear time fld indx fld1 fld2 fl fx fy fz Fmag i 

