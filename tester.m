
clear all; clc;
%imaqhwinfo;
%webcamlist;


%IM = snap();
IM = snapip();

[data, next] = detector(IM, 0.91);
disp(data);

dlmwrite('data/data.txt', data);
dlmwrite('data/next.txt', next);

%type('data.txt');
%var = dlmread('data.txt');
