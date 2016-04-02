%% Transmits data over serial
%   @author Sohel
%   @requires Serial.
%   @param Port name as string, Data as string.
%   @returns Null.
%

function y = transmit(port, data)
    
    s = serial(port);
    set (s, 'DataBits' , 8 );
    set (s, 'StopBits' , 1 );
    set (s, 'BaudRate' , 9600 );
    set (s, 'Parity' , 'none' );
    fopen(s);
    y = fprintf(s, '%c', data);
    fclose(s);

end
