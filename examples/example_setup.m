function fld = example_setup(action)

% fld = EXAMPLE_SETUP cleans up the common startup for all examples and
% returns folder to operate on


if nargin==0
    action = true;
end


ST = dbstack(1);


% opening message
%
disp(['Running ',ST.file,' ...'])
disp(' ')
help(ST.file)

% set folders 
%
pth = which(ST.file);
indx = strfind(pth,filesep);

fld_ex = fullfile(pth(1:indx(end-1)),'example data');
fld = fullfile(fileparts(pth),'example data (processed)');


% Copy data to new folder which will be processed
%
if action
    copyfile(fld_ex,fld,'f');
    disp('We create a new folder ''fld'' to contain our processed data:')
    batchdisp(fld,' ')
    disp(' ')
else
    fld = fld_ex;
end
