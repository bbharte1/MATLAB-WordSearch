function isValidWord = isValidPuzzleWord(theWords, guessWord)

% Determines if a word is part of the puzzle. It is case insensitive.
% This function should work for upper and lower case letters
% INPUTS:
%       theWords: 10x1 cell array that contains the words from the puzzle
%       guessWord: word being guessed by the player
% RETURNS:
%       isValidWord: True if it is part of the puzzle, False otherwise.

for i = 1:length(theWords) % go through loop from 1 to the amount of words
    s = strcmpi(theWords{i},guessWord); %compare the words

    if s == true % if guessword compared it true
        isValidWord = true; %its a valid word
        break % stop the loop if it is true
    else
        isValidWord = false; % if the guessword compared if false, not valid word
    end

end
