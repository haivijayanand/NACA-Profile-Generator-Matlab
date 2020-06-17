clear all
close all
clc

%% Sample Codes for generating NACA Profiles
%% 4 Series Airfoils
% [Name,Coordinates] = fn_NACA4(Max_Camber,Dist_Max_Camber,Max_Thick)

% 0012
[Name,Coordinates] = fn_NACA4(0,0,12);
% 1408
[Name,Coordinates] = fn_NACA4(1,4,08);
% 2412
[Name,Coordinates] = fn_NACA4(2,4,12);
% 4421
[Name,Coordinates] = fn_NACA4(8,2,21);
% 6412
[Name,Coordinates] = fn_NACA4(6,4,12);

%% 4 Series Mod Airfoils
% [Name,Coordinates] = fn_NACA4M(Max_Camber,Dist_Max_Camber,Max_Thick,LE_Radius,Dist_Max_Thick)

% 0010-64
[Name,Coordinates] = fn_NACA4M(0,0,10,6,4);

%% 5 Series Airfoils
% [Name,Coordinates] = fn_NACA5(CL,Dist_Max_Camber,Reflex,Max_Thick)

% 23012
[Name,Coordinates] = fn_NACA5(2,3,0,12);
% 23015
[Name,Coordinates] = fn_NACA5(2,3,0,15);
% 23112
[Name,Coordinates] = fn_NACA5(2,3,1,12);

%% 5 Series Mod Airfoils
% [Name,Coordinates] = fn_NACA5M(CL,Dist_Max_Camber,Reflex,Max_Thick,LE_Radius,Dist_Max_Thick)

% 23012-35
[Name,Coordinates] = fn_NACA5M(2,3,0,12,3,5);

%% 16 Series Airfoils
% [Name,Coordinates] = fn_NACA16(CL,Max_Thick)

% 16-009
[Name,Coordinates] = fn_NACA16(0,09);
% 16-015
[Name,Coordinates] = fn_NACA16(0,15);
% 16-212
[Name,Coordinates] = fn_NACA16(2,12);


%% 6 Series Airfoils [There is no provision to input the subscript of CL Range in this program ie for 641-612 airfoil is represented as 64-612 only!!!]
% [Name,Coordinates] = fn_NACA6(Dist_Min_Press,CL,Max_Thick,Mean_Line)
% 63-006
[Name,Coordinates] = fn_NACA6(3,0,06,1.0); % meanline is 1.0 if not given
% 63-021
[Name,Coordinates] = fn_NACA6(3,0,21,1.0); % meanline is 1.0 if not given
% 63-206
[Name,Coordinates] = fn_NACA6(3,2,06,1.0); % meanline is 1.0 if not given
% 64-010a0.8
[Name,Coordinates] = fn_NACA6(4,0,10,0.8);
% 65-010a0.6
[Name,Coordinates] = fn_NACA6(5,0,10,0.6);
% 65-021
[Name,Coordinates] = fn_NACA6(5,0,21,1.0); % meanline is 1.0 if not given
% 66-021
[Name,Coordinates] = fn_NACA6(6,0,21,1.0); % meanline is 1.0 if not given
% 67-021
[Name,Coordinates] = fn_NACA6(7,0,21,1.0); % meanline is 1.0 if not given

%% 6A Series Airfoils
% [Name,Coordinates] = fn_NACA6A(Dist_Min_Press,CL,Max_Thick)

% 63A010
[Name,Coordinates] = fn_NACA6A(3,0,10);  % mean line is at a=0.8 for all 6A series airfoils. So, no need to mention.
% 63A210
[Name,Coordinates] = fn_NACA6A(3,2,10);
% 63A409
[Name,Coordinates] = fn_NACA6A(3,4,09);
% 63A415
[Name,Coordinates] = fn_NACA6A(3,4,15);
% 64A010
[Name,Coordinates] = fn_NACA6A(4,0,15);
% 64A015
[Name,Coordinates] = fn_NACA6A(4,0,15);
% 64A410
[Name,Coordinates] = fn_NACA6A(4,4,10);
% 65A010
[Name,Coordinates] = fn_NACA6A(5,0,10);
