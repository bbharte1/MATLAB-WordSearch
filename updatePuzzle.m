function puzzle = updatePuzzle(puzzle,puzzleData,guessWord)
% replaces a new found word contained in the puzzle with asterisks (*)
% INPUTS:
%       puzzle: 15 x 25 char array of the current game
%   puzzleData: 10 x 4 cell array that contains all the puzzle data from
%               the input Excel Files (words, rows, columns, orientation)
%    guessWord: the word that has been found
% RETURNS: 
%       puzzle: the UPDATED puzzle Char Array where the guessWord has been
%               replaced with astericks



num = strcmpi(guessWord,puzzleData(:,1)); % compare the guessword to all words
ind = find(num,1); %index of the word

rows = puzzleData(:,2); % all the rows in cell form
cols = puzzleData(:,3); % all the cols in cell form 


if sum(num) == 0 % if guessword wasnt in words

    puzzle = puzzle; % puzzle stays same

elseif puzzleData{ind,4} == 'V' %if word vertically placed

    %index into the puzzle and place astricks where word was previously
    puzzle(rows{ind}:(length(guessWord)+rows{ind}-1),cols{ind}) = char(randi([42,42],1,length(guessWord)));

elseif puzzleData{ind,4} == 'H' % if word hor. placed

    %index into the puzzle and place astericks where word was
    puzzle(rows{ind},cols{ind}:(length(guessWord)+cols{ind}-1)) = char(randi([42,42],1,length(guessWord)));


end


