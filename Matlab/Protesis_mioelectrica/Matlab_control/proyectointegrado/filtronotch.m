function Hd = filtronotch
%FILTRONOTCH Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.1 and the Signal Processing Toolbox 6.19.
% Generated on: 05-Nov-2017 13:15:28

% Butterworth Bandstop filter designed using FDESIGN.BANDSTOP.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

N   = 16;  % Order
Fc1 = 56;  % First Cutoff Frequency
Fc2 = 64;  % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandstop('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter');

% [EOF]