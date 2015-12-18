%% Captures webcam image and apply basic filters
%   @author Sohel
%   @requires Support Package: OS Generic Video Interface.
%   @param Image width, hight in pixel.
%   @returns Captured image.
%

function y = snap(width, height)

    if nargin < 2 || width < 10 || height < 10
        width = 800;
        height = 600;
    end
    
    vid = videoinput('winvideo', 1);
    set(vid, 'ReturnedColorSpace', 'RGB');
    img = getsnapshot(vid);
    y = imresize(img, [height, width]);

end
