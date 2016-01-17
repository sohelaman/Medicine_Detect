%Circular medicine detection in medicine strip.
clear all; clc;
%imaqhwinfo;
%webcamlist;
IMG = imread('sample.jpg');
IM = imresize(IMG, [450,800]);
IM = imrotate(IMG, 90);
%IM = snap();


%parameters
sensitivity = 0.95;
objectPolarity = 'bright';
rad = [50, 60];
emptyStrip = false;




while(true)
    [c,r] = imfindcircles(IM,rad,'ObjectPolarity',objectPolarity,'Sensitivity',sensitivity);
    if(size(c) < 1 )
        if rad(1) > 10
            rad = rad - 10;
        else
            emptyStrip = true;
            break;
        end
    else
        break;
    end
end
imshow(IM); h = viscircles(c,r);

%sorting
if( size(c) > 0 )
    d = sortrows(c, 2);

    %centers
    hold on;
    for n = 1:1%size(d)
        plot(d(n,1),d(n,2),'r.','MarkerSize',20);
    end

    disp(d);
    if(~emptyStrip)
        nextAvailTablet = d(1,:);
    end
    disp('Next Tablet Center: ');
    disp(nextAvailTablet);
    
end

%comPort = 'COM4';
%s = serial(comPort);
%set (s, 'DataBits' , 8 );
%set (s, 'StopBits' , 1 );
%set (s, 'BaudRate' , 9600 );
%set (s, 'Parity' , 'none' );
%fopen(s);
%fprintf(s, '%c', 'aa');
%fclose(s);
disp('Finished');
clear all;

