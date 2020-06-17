function strrepInFile(fname,C,R,opt)
warning('off');
%strrepInFile Find and replace substring in file
%
% strrepInFile(FILE,C,R) replaces substring C by substring R in file FILE.
% If C and R are cell arrays of string, strrepInFile process elements by
% elements. C and R must have the same number of elements.
%
% strrepInFile(...,OPT) replaces FILE content if OPT is "r" (no copy
% created). Otherwise it creates a new file with "new_" prefix appended to
% its name.
%
% See also strrep.

% Author  : Jerome Briot
% Version : 1.0 - 03 Jun 2012
%           1.1 - 16 Sep 2016 last argument no more case sensitive
% Contact : dutmatlab@yahoo.fr
%

narginchk(3, 4);

if nargin==3
    opt = 'c';
end

if ~iscell(C)
    if C(end)~=' '
        C = cellstr(C);
    else
        C = cellstr(C);
        C{1}(end+1) = ' ';
    end
end
if ~iscell(R)
    if R(end)~=' '
        R = cellstr(R);
    else
        R = cellstr(R);
        R{1}(end+1) = ' ';
    end
end

if numel(C)~=numel(R)
    error('Number of characters to replace must be the same in both entries');
end

fid = fopen(fname,'r');
if fid==-1
    error('Unable to open "%s"',fname);
end
X = fread(fid);
fclose(fid);

for n = 1:numel(C)
        X = strrep(X,C{n}+0,R{n}+0);
    % Modified by K Vijay Anand
%     X = strrep(X,C{n}+0string(['']),R{n}+string(['']));
end

if strcmpi(opt, 'r')
    [pname,fname,ext] = fileparts(fname);
    fname = [fname ext];
else
    [pname,fname,ext] = fileparts(fname);
    fname = ['new_' fname ext];
end

fid = fopen(fullfile(pname,fname),'w');
if fid==-1
    error('Unable to open "%s"',fname);
end
fwrite(fid,X);
fclose(fid);