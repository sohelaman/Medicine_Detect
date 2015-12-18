%Circular medicine detection in medicine strip.
clear all; clc;
%imaqhwinfo;
%webcamlist;

%IM = imread('sample.jpg');
IM = snap();

%parameters
sensitivity = 0.94;
objectPolarity = 'bright';
rad = [50, 60];
emptyStrip = false;

while(true)
    [c,r] = imfindcircles(IM,rad,'ObjectPolarity',objectPolarity,'Sensitivity',sensitivity);
    if(size(c) < 1 )
        if rad(1) > 0
            rad = rad - 10;
        else
            emptyStrip = true;
        end
    else
        break;
    end
end
imshow(IM); h = viscircles(c,r);

%centers
hold on;
for n = 1:size(c)
    plot(c(n,1),c(n,2),'r.','MarkerSize',20);
end

disp(r);
clear all;

