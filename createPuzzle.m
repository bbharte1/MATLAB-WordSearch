function [puzzle] = createPuzzle(puzzleData)

% Creates a 15 x 25 word search puzzle based on the themed words 
% INPUTS: 
% puzzleData: 10 x 4 Cell Array that contains all the puzzle data from the
%             input Excel files (words, rows, columns, orientation)
% RETURNS:
%             puzzle: 15 x 25 Char Array that contains all the words placed
%             in their positions (Horizontally or Vertically) and random
%             characters from [A to Z].


matASCII = randi([65,90],15,25); % ASCII numbers
puzzle = char(matASCII); % random letters from A to Z

words = puzzleData(:,1); % all the words in cell form
row = puzzleData(:,2); % all the rows in cell form
col = puzzleData(:,3); % all the cols in cell form 
orient = puzzleData(:,4); % orientation of the word

for i = 1: length(words) % go through all 10 of the words

    if orient{i} == 'H' % if it is supposed to be hor. placed
        word = words{i}; % pick out the word
        puzzle(row{i},col{i}:col{i}+length(word)-1) = word; % place in the
        % hor. place


    elseif orient{i} == 'V' % if its supposed to be vert. placed
        word = words{i}; %pick out the word
        puzzle(row{i}:row{i}+length(word)-1,col{i}) = word; % place in puzzle

    end
end