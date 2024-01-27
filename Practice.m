data = readcell('NCState.xlsx');

matASCII = randi([65,90],15,25); % ASCII numbers
puzzle = char(matASCII); % random letters from A to Z

words = data(:,1); % all the words in cell form
row = data(:,2); % all the rows in cell form
col = data(:,3); % all the cols in cell form 
orient = data(:,4); % orientation of the word

for i = 1: length(words) % go through all 10 of the words 

    if orient{i} == 'H' % if it is supposed to be hor. placed
        word = words{i} % pick out the word
        puzzle(row{i},col{i}:col{i}+length(word)-1) = word % place in the 
                                                           % hor. place


    elseif orient{i} == 'V' % if its supposed to be vert. placed
        word = words{i} %pick out the word
        puzzle(row{i}:row{i}+length(word)-1,col{i}) = word % place in puzzle

    end
end



    

    









