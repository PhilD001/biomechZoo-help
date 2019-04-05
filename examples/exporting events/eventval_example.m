% eventval_example demonstrates how to export events to a spreadsheet 
%
% Usage: Exporting events allows users to run statitical analyses in other software
% e.g. R or SPSS
%
% Example: The files in our example data folder (~/examples/example data) contain the event
% 'Right_FootStrike1'. For this example, we will start by adding an additional event ('PeakFz'), 
% as in bmech_addevent_example. We want to extract the value of channels ForceFz2, RKneeAngles, 
% and RHipAngles at these events. Additionally, we want to extract the 'bodymass' and
% 'height' of each subject. 


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
disp('We will first create a local event as in bmech_addevent_example:')
disp(' ')
bmech_addevent(fld,'ForceFz2','PeakFz','min');
disp(' ')
pause(time)


% Create statistics folder
%
disp('We create a ''Statistics'' folder to contain our new spreadsheet:')

indx = strfind(fld,filesep);
sfld = [fld(1:indx(end)),'Statistics'];

if ~exist(sfld,'dir')
    mkdir(sfld)
end
disp(sfld)
disp(' ')
pause(time)


% Set up export events 
%
levts = {'PeakFz'};                                                            % local events
gevts = {'Right_FootStrike1'};                                                            % global events
aevts = {'Bodymass','Height'};                                              % anthro events
disp('We set up the events that we want to export')
disp('local events: ')
disp(levts)
disp('Global events: ')
disp(gevts)
disp('anthro event: ')
disp(aevts)
disp(' ')
pause(time)

% set up channels to use
%
ch    = {'ForceFz2','RKneeAngles','RHipAngles'};...                 % channels 
disp('We set up the channels for which we would like information')
disp('Channels:')
disp(ch)
disp('Note: If unexploded channels are used, the first column will be extracted')
disp(' ')

% set up dims
dim1  = {'Straight','Turn'};                                                % conditions
dim2  = {'HC002D','HC030A','HC031A','HC032A'};
   
disp('We set up the conditions and the subject names we want to export:')
disp('Conditons:')
disp(dim1)
disp('Subjects:')
disp(dim2)
disp(' ')
pause(time)

% settings
%
excelserver = 'off';                                                        % use java
ext = '.xls';                                                               % pref ext

disp('Finally, we set up the settings for the eventval function:')
disp(['excelserver = ',excelserver])
disp(['extension = ',ext])
disp('**users without excel should turn excelserver to off')
disp(' ')
pause(time)


% Process
%
disp('We can now call eventval as:')
disp('''eventval(''fld'',fld,''dim1'',dim1,''dim2'',dim2,...')
disp('''localevts'',levts,''globalevts'',gevts,''anthroevts'',aevts,''ch'',ch,...')
disp('''excelserver'',excelserver,''ext'',ext);    ''')
disp(' ')
evalFile = eventval('fld',fld,'dim1',dim1,'dim2',dim2,'localevts',levts,...
    'globalevts',gevts,'anthroevts',aevts,'ch',ch,'excelserver',excelserver,...
    'ext',ext);


% Message to user
%
disp('A spreadsheet was exported. explore it here: ')
disp(evalFile)


clear time fld indx fld sfld ext gevts levts aevts dim1 dim2 excelserver ch

