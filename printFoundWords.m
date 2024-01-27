function printFoundWords(theWords, foundWordsVector)
% prints the list of found words to the command window
% INPUTS: 
%         theWords: 10 x 1 cell array that contains the words from the
%                   puzzle 
% foundWordsVector: 10 x 1 numerical array of 1s and 0s that contains
%                   whether a word has been found, 1(word is found) or
%                   0(not found yet)
% PRINTS to the command window
foundWordsVector = logical(foundWordsVector); % make foundWordsVector logical

if sum(foundWordsVector) > 0 %if foundWordsVector isnt empty
    WordsBeenFoundCell = {theWords{foundWordsVector}}; %pull out the words
    WordsBeenFoundString = join((string(WordsBeenFoundCell)),','); % join to get as 1x1 string
    fprintf('\nSo far you have found the words: [%s] \n',WordsBeenFoundString); %print the words found
elseif sum(foundWordsVector) == 0 %if foundWordsVector is empty
    fprintf('\nNo words found yet\n'); % show nothing has been found
end
end