function [wordBeenFound, indexOfGuessWord] = hasWordBeenFound(theWords,guessWord,foundWordsVector)
% determines if a word has been found already in the puzzle
% INPUTS:
%         theWords: 10 x 1 cell array that contains the words from the
%                  puzzle
%        guessWord: Char Array, the word being guessed by the player
% foundWordsVector: 10 x 1 numerical array of 1s and 0s that contains 
%                  whether a word has been found, 1(word is found) 
%                  or 0(not found yet)
% RETURNS:
%         wordBeenFound: TRUE if the guess word has been previously found,
%                        FALSE, the guessWord is NOT one of the words or it
%                        has NOT been previously found
%      indexOfGuessWord: if the guessWord is found then this is its index
%                        in theWords vector otherwise this variable
%                        should be an empty vector                 

y = strcmpi(theWords,guessWord); % compare the guessword to the words

indexOfGuessWord = find(y,1); % find index

if foundWordsVector(indexOfGuessWord) == true %if index is 1, then the function is true
    wordBeenFound = true;
else
    wordBeenFound = false; %if index is 0, then function false
end
