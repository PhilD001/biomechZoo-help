% generic2zoo_example demonstrates how to convert generic text style files 
% to zoo format using the generic2zoo function
%
% Usage: Many systems in biomechanics output text style data with a generic 
% format e.g. A series of text header rows, followed by numeric data arranged in
% colums, each with a channel identifier row above (last header row). We
% need a generic function to convert these files to the zoosystem
% 
% Example: The files in our example data folder (~/examples/example data) contain 
% a '.forces' text file. Opening this file in a text reader tells us that the
% format is appropriate for generic converting with generic2zoo. Use generic2zoo
% to convert this file.


% Example setup
%
clc
close all
clear variables

time = 2; 
fld = example_setup;
pause(time)



% get file
%
% 
ext = '.forces';
disp(['In this folder, we have a ',ext,' file:'])
fl = engine('path',fld,'extension',ext);

batchdisp(fl{1},' ')
disp(' ')
pause(time)

% Process set up
%
disp('This file is a basic spreadsheet:')
disp('- file starts with 5 header rows (check in any text reader)')
disp('- last row are channel names for the data to follow (arranged in columns')
disp('- columns are separated by space (''\n'') delimiter')
disp(' ')
pause(time)

chHeaderRow = 5;
del = false;
delimiter = '\n';
section = 'Video';
disp('We call ''generic2zoo(fld,chHeaderRow,ext,delimiter,del)'', where: ')
disp(['chHeaderRow = ',num2str(chHeaderRow)])
disp(['ext = ',ext])
disp('delimiter = ''\n''')
disp('section = ''Video''')
disp(['del =', num2str(del)])
disp(' ')
pause(time)

data = generic2zoo(fl,chHeaderRow,ext,delimiter,section,del);
    
     
% Final message to user
%
[~,file] = fileparts(data.zoosystem.SourceFile);
disp(' ')
disp(['We load the zoo file created from ',file,ext])
disp(' ')
disp('Explore the new zoo file created')
disp(' ')
clear delimiter section fl fld chHeaderRow del time ext file
