% engine_example demonstrates how to search for files using biomechZoo's engine function 
%
% Usage: All searching of zoo files for various processes and GUIs relies on the use of the 
% 'engine' recursive fuction.  
% 
% Example: We have a folder 'raw data'. This folder contains numerous trials. We will use 
% engine to search for different sets of files  
%
% See also engine



% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup(false);
pause(time)

% Search using the 'path' command
%
disp('let''s search for all files in our dataset using the ''path'' argument:')
disp(' ')
disp('fl = engine(''path'',fld);')
disp(' ')
fl = engine('path',fld);
for i = 1:length(fl)
    [p,f,ext] = fileparts(fl{i});
    indx = strfind(p,filesep);
    p = p(indx(end-2):end);
    disp([p,filesep,f,ext])
end
disp(' ')
pause(time)

% Search using combination of 'path' and extension'
%
disp('let''s search for all .csv files in our dataset using the ''extension'' argument:')
disp(' ')
disp('fl = engine(''path'',fld,''extension'',''csv'');')
disp(' ')
fl = engine('path',fld,'extension','csv');
for i = 1:length(fl)
    [p,f,ext] = fileparts(fl{i});
    indx = strfind(p,filesep);
    p = p(indx(end-2):end);
    disp([p,filesep,f,ext])
end
disp(' ')
pause(time)


% Search for files located 'downstream' from main folder
%
disp('let''s search for all .c3d files in our dataset located in any ''Straight'' sub folder')
disp(' ')
disp('fl = engine(''path'',fld,''extension'',''c3d'',''folder'',''Straight'');')
disp(' ')
fl = engine('path',fld,'extension','c3d','folder','Straight');
for i = 1:length(fl)
    [p,f,ext] = fileparts(fl{i});
    indx = strfind(p,filesep);
    p = p(indx(end-2):end);
    disp([p,filesep,f,ext])
end
disp(' ')
pause(time)

% Search for certain file names
%
disp('let''s search for all .zoo files in our dataset containing the string ''C03''')
disp(' ')
disp('fl = engine(''path'',fld,''extension'',''zoo'',''search file'',''C03'');')
disp(' ')
fl = engine('path',fld,'extension','zoo','search file','C03');
for i = 1:length(fl)
    [p,f,ext] = fileparts(fl{i});
    indx = strfind(p,filesep);
    p = p(indx(end-2):end);
    disp([p,filesep,f,ext])
end
disp(' ')
pause(time)


% Search for certain file names
%
disp('let''s search for all zoo files in the subfolder ''HC030A'' containing the string ''C03''')
disp(' ')
disp('fl = engine(''path'',fld,''extension'',''zoo'',''search file'',''C03'',''search path'',''HC030A'');')
disp(' ')
fl = engine('path',fld,'extension','zoo','search file','C03','search path','HC030A');
for i = 1:length(fl)
    [p,f,ext] = fileparts(fl{i});
    indx = strfind(p,filesep);
    p = p(indx(end-2):end);
    disp([p,filesep,f,ext])
end
disp(' ')
pause(time)




