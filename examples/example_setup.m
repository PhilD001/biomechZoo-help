function fld = example_setup(action)

% fld = EXAMPLE_SETUP cleans up the common startup for all examples and
% returns folder to operate on. This function should not be called
% directly, it is only a support function for the example files


if nargin==0
    action = true;
end


ST = dbstack(1);


% opening message
%
disp(['Running ',ST(1).file,' ...'])
disp(' ')
help(ST(1).file)

% set folders 
%
pth = which(ST(1).file);
indx = strfind(pth,filesep);

fld_ex = fullfile(pth(1:indx(end-1)),'example data');
fld = fullfile(fileparts(pth),'example data (processed)');


% Copy data to new folder which will be processed
%
if action
    s = copyfile(fld_ex,fld,'f');
    if s ==0
        cd(fld_ex)
        copyfile(fld_ex,fld,'f');
    end
    disp('We create a new folder ''fld'' to contain our processed data:')
    batchdisp(fld,' ')
    disp(' ')
else
    fld = fld_ex;
end
