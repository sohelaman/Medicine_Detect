%% Captures webcam image and apply basic filters
%   @author Sohel
%   @param Image width, hight in pixel.
%   @returns Captured image from IP Webcam.
%

function y = snapip(width, height)

    if nargin < 2 || width < 10 || height < 10
        width = 800;
        height = 600;
    end
    
    url = 'http://192.168.1.9:8080/photoaf.jpg';
    
    img  = imread(url);
    %imshow(img);
    %img = imresize(img, [height, width]);
    %y = imrotate(img, 270);
    %bw = im2bw(y);
    y = img;

end
