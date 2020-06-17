function [Name,Coordinates] = fn_NACA16(CL,Max_Thick)
% NACA 16-Series Airfoils
% First and Second digit : The number 16 indicates the series
% Third Digit : -
% Fourth Digit : Lift coefficient in 1/10 [0-9]
% Last two digits : Maximum thickness in % of the chord [1-40]
%
% Example : Naca 16-123
% Usage: [Name,Coordinates] = fn_NACA16(1,23);
% 1 = The number 1 indicates the series designed for airfoils with regions of barely supersonic flow
% 6 = Minimum pressure area at 60 % of the chord
% - Hyphen
% 1 = Lift coefficient = 0.1
% 23 = Maximum thickness 23%
%
% Programmed by K Vijay Anand, haivijayanand@gmail.com
% June 2020

%% Check Input
IpError = 0;
if(CL<0 || CL>9)
    IpError = 1;
end

if(Max_Thick<1 || Max_Thick>30)
    IpError = 1;
end

if(IpError ==1)
    disp('Error in Input!!!');
    return;
end

% Create Name of Airfoil

Name = sprintf('16-%d%02d',CL,Max_Thick);

% Write .nml file and input file
data=cell(20,0); i1=1;
data{i1}    = '&NACA';     i1=i1+1;
data{i1}    = 'DENCODE = 3';     i1=i1+1;
data{i1}  = sprintf('NAME = "%s"',Name); i1=i1+1;
data{i1}  = sprintf('PROFILE = "4M"'); i1=i1+1;
data{i1}  = sprintf('TOC = %0.2f',Max_Thick/100); i1=i1+1;
if (CL ==0)
    data{i1}  = sprintf('CAMBER = "0"'); i1=i1+1;
else
    data{i1}  = sprintf('CAMBER = "6" '); i1=i1+1;
end
data{i1}  = sprintf('CL = %0.1f',CL/10); i1=i1+1;
data{i1}  = sprintf('LEINDEX = %d',4); i1=i1+1;
data{i1}  = sprintf('XMAXT = %0.1f',0.5); i1=i1+1;
data{i1}  = sprintf('A = %0.1f',1.0); i1=i1+1;
% End of file indicator
data{i1}    = '/';

%% Write Input Files and Execute
fid = fopen([Name '.nml'],'w');
CT = data.';
fprintf(fid,'%s\n', CT{:});
fclose(fid);

%% Create and Execute input string
% .inp file contains only the name of the input file name
Name1 = sprintf('%s.inp',Name);
fid1 = fopen(Name1,'w');
fprintf(fid1,'%s.nml\n', Name);
fclose(fid1);
% Execute the Program
system(sprintf('naca456.exe < %s >%s.tmp',Name1,Name));
% Name.tmp contains the output of dos program

%% Import Data
OutFile =sprintf('%s.out',Name);
strrepInFile(OutFile,'**********','  0.000000','r');

[~,data]=mhdrload(OutFile);
% display(data)
size1 = size(data);

Retain = 0;  % 0 - Delete the files, 1- Retain the files
if (Retain==0)
    eval(sprintf('delete("%s.nml")',Name));
    eval(sprintf('delete("%s.out")',Name));
    eval(sprintf('delete("%s.inp")',Name));
    eval(sprintf('delete("%s.gnu")',Name));
    eval(sprintf('delete("%s.dbg")',Name));
    eval(sprintf('delete("%s.tmp")',Name));
end

if(size1(3)==6)  % Asymmetric Airfoil
    T0 = [];
    T1 = data(:,:,2);
    T2 = data(:,:,4);
    T3 = data(:,:,6);
else
    T0 = data(:,:,2);
    T1=[];
    T2=[];
    T3=[];
end

% Combine Symmetrical and Asymmertrical Airfoil Data
% x yt yt' yc yc' xu yu xl yl x yu yl
if(isempty(T1))
    Coordinates = [T0 T0(:,3:4)*0 T0(:,2:3) T0(:,2) -T0(:,3) T0(:,2) T0(:,3) -T0(:,3)];
else
    Coordinates = [T1 T2(:,2:5) T3(:,2:4)];
end

%% Write output to dat file in XFOIL Format if required
OutputDatFile=1;
if OutputDatFile==1
    fname = [Name '.dat'];
    fid = fopen(fname,'w');
    fprintf(fid,'%s\n',fname);
    fprintf(fid,'%1.5f   %1.5f\n',[Coordinates(end:-1:2,7) Coordinates(end:-1:2,8)]');
    fprintf(fid,'%1.5f   %1.5f\n',[Coordinates(:,9),Coordinates(:,10)]');
    fclose(fid);
fprintf('Airfoil %s Generated Sucessfully !!!\n',Name);
end

end
