%% Circular medicine detection
%   @author Sohel
%   @requires Support Package: OS Generic Video Interface.
%   @param MAT image, FLOAT sensitivity.
%   @returns MAT detected medicine centers, MAT next medicine center.
%

function [centers, nextItem] = detector(IM, sensitivity)
    
    %clear all; clc;
    %imaqhwinfo;
    %webcamlist;
    
    if nargin < 2
        sensitivity = 0.92;
    end

    %parameters
    objectPolarity = 'bright';
    rad = [30, 50];
    emptyStrip = false;

    while(true)
        [c,r] = imfindcircles(IM, rad, 'ObjectPolarity', objectPolarity, 'Sensitivity', sensitivity);
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

    imshow(IM);
    h = viscircles(c,r);

    %sorting
    if( size(c) > 0 )
        d = sortrows(c,2);
        centers = d;
        
        %centers
        hold on;
        for n = 1:size(d)
            plot( d(n,1), d(n,2), 'r.', 'MarkerSize', 20 );
        end

        if(~emptyStrip)
            nextAvailTablet = d(1,:);
        end
        
        nextItem = nextAvailTablet;
    end
end

