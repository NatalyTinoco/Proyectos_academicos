function R = get_data(BaseFile, n)
for i = 1 : n
    % Open consecutively each of the remaining files
    d(i) = fopen([BaseFile num2str(i) '.txt']);
    % Skip the first column of the new file (an '*' to do this)     % and keep on building the array
    R = [R textscan(d(i), '%*f %f', 'headerLines', 4)];
    % Close the file
    fclose(d(i));
end