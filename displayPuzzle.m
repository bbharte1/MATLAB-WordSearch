function displayPuzzle(puzzle,theme)
% Prints the theme AND the puzzle to the command window
%INPUTS: 
%   puzzle: 15 x 25 Char Array that contains the words places in their 
%       positions (hor. or vert) and random characters from [A to Z]
%   theme: Char Array, either 'NC State Words', 'Pumpkin Pie Words' or 
%   'Video Game Words'
%RETURNS
%   Prints to the command window

theme = upper(theme); % find theme in uppercase
fprintf('--%s--\n',theme); % print the theme
disp(puzzle); % print the puzzle