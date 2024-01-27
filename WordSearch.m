% Names: Brianna Harte and Javier Roman Martinez
% Emails: bbharte@ncsu.edu and jaromanm@ncsu.edu 
% Date: 10/2/2022
% Lab Sections: Both 207
% Project 2: Word Search Game, Fall 2022
clc; clear; close('all');
%% First while loop to start game over

playAgain = 1; % to start game over
while playAgain == 1 % start while loop of the play again feature

    %% 1. Welcome to the game
    fprintf('*********************************\n'); %display welcome to the game
    fprintf('Let''s Play WordSearch!\n');
    fprintf('*********************************\n');

    %% 2. Theme selection

    % display new game
    fprintf('---------------------------------\n');
    fprintf('New Game begins:\n');
    fprintf('---------------------------------\n');

    %display the options for the user
    fprintf('   NC State(1)\nPumpkin Pie(2)\nVideo Games(3)\n')

    %ask for user input
    puzzleData = input('What puzzle do you like to solve?: ');

    % switch case on the choice
    switch puzzleData
        case 1
            puzzleData = readcell('NCState.xlsx'); %reads cell for the choice
            theme = "NC State Words"; % gives the theme of the puzzle

        case 2
            puzzleData = readcell('PumpkinPie.xlsx');
            theme = "Pumpkin Pie Words";
        case 3
            puzzleData = readcell('VideoGames.xlsx');
            theme = "Video Game Words";
    end
    fprintf('---------------------------------\n');
    fprintf('Playing the %s.\n',theme); %displays which theme was chosen
    fprintf('---------------------------------\n');

    %% 2.3 Puzzle Creation
    puzzle = createPuzzle(puzzleData); % creates puzzle based on input

    %% 2.4 Display the puzzle - displayPuzzle.m

    foundWordsVector = zeros(10,1); % start with an empty vector of 10 0s
    displayPuzzle(puzzle,theme); % displays puzzle based on input

    fprintf('\n'); % skips a line

    %% 2.5 Determine if the player has guessed a words - isValidPuzzleWord.m

    while sum(foundWordsVector) < 10 %goes through the loop as long as foundwordsvector is not complete

        WordsLeft = (10 - sum(foundWordsVector)); % how many words left to find

        %display how many words are to be found
        if WordsLeft == 10
            fprintf('Find %d hidden words in the puzzle\n',WordsLeft);
        elseif WordsLeft < 10
            fprintf('You have %d more words to find.\n',WordsLeft); % print words left
        end

        guessWord = input('Guess a Word: ','s'); % ask user to guess a word

        theWords = puzzleData(:,1); % Get the words for the function
        isValidWord = isValidPuzzleWord(theWords,guessWord); % use isValidPuzzleWord function


        %% 2.6 has the word been prev. found - hasWordBeenFound.m

        [wordBeenFound, IndexOfWord] = hasWordBeenFound(theWords,guessWord,foundWordsVector); % hasWordBeenFound function
        foundWordsVector(IndexOfWord) = true;

        if wordBeenFound == 0 % if word hasnt been found before

            if isValidWord == 0 % if its not a valid word
                fprintf('%s is NOT one of the puzzle words!\n\n',upper(guessWord));
            elseif isValidWord == 1 % if it is a valid word
                fprintf('%s is a puzzle word!\n\n',upper(guessWord));
            end

        elseif wordBeenFound == 1 % if word was found before
            fprintf('%s has already been found! Try another word!\n\n',upper(guessWord));
        end


        %% 2.7 update the puzzle updatePuzzle.m

        puzzle = updatePuzzle(puzzle,puzzleData,guessWord); %update the puzzle with astericks

        displayPuzzle(puzzle,theme); %display new puzzle using displayPuzzle function

        %% 2.8 print the words that the player has already found - printFoundWords.m
        printFoundWords(theWords, foundWordsVector); % pring the words already found

    end

    fprintf('You have 0 more words to find.\n'); % tell user no more words are to be found
    fprintf('\nCongratulations! You have found all 10 puzzle words!\n'); % end first while loop by congratulating
    playAgain = input('\nWould you like to play again? (1) yes (2) no: '); % ask to play again

end





