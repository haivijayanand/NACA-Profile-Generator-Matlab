clear all
close all
clc
% Compare all possible 4 series airfoils with t/c=12%
% Created by K Vijay Anand

N.Dist_Max_Camber = 0:1:9;
N.Max_Camber = 0:1:9;
N.Max_Thick = 12;
% Generate Combinations
Array = permutor(struct2cell(N));

% Number of Airfoils
N1 = size(Array,1);

for i1=1:N1
    Max_Camber(i1) = Array(i1,2);
    Dist_Max_Camber(i1) = Array(i1,1);
    Max_Thick(i1) = Array(i1,3);
end

% Get the Coordinates
for i1=1:N1
    [Name,Coordinates]=fn_NACA4(Max_Camber(i1),Dist_Max_Camber(i1),Max_Thick(i1));
    s(i1).Name = Name;
    s(i1).Coordinates = Coordinates;
end
%% Plot all the variation in same graph
clf;
for i1=1:100
    smplot(10,10,i1,'right',.1,'top',.1);%,'axis','on');
    fill([s(i1).Coordinates(end:-1:2,7);s(i1).Coordinates(:,9)],[s(i1).Coordinates(end:-1:2,8);s(i1).Coordinates(:,10)],'r');
    axis equal    
    xlim([-.1 1]);ylim([-.2 .3]);
    axis off;
    text(0.1,0.4,s(i1).Name,'Color','b','FontSize',10);
%   title(s(i1).Name);     
end
