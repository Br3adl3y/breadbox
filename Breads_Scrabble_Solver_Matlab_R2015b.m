%How many unique sets of 7 Scrabble tiles have a total score of 46?

%Loop thru all tiles, discard set that don't score 46, discard duplicates.
%Required Loops: 80,678,106,432,000

%Optimization 1: Sets cannot reach 46 without the 4 highest tiles: J X Q Z
%Last four tiles are fixed to J X Q Z.
%Required Loops: 857,280

%Optimization 2: Only 3 maximum of each letter is required. 
%Duplicates of each letter after 3 removed from matrix.
%Required Loops: 175,560

%Optimization 3: Any set with a blank tile cannot total 46 exactly.
%Blank tiles removed from matrix.
%Required Loops: 157,410

%Final processing time: 11.003 seconds
%Solution = 138

tiles = {'A'  1; 'A'  1; 'A'  1; 'E'  1; 'E'  1; 'E'  1; 'I'  1; 'I'  1; 'I'  1; 'O'  1; ...
         'O'  1; 'O'  1; 'U'  1; 'U'  1; 'U'  1; 'L'  1; 'L'  1; 'L'  1; 'N'  1; 'N'  1; ...
         'N'  1; 'S'  1; 'S'  1; 'S'  1; 'T'  1; 'T'  1; 'T'  1; 'R'  1; 'R'  1; 'R'  1; ...
         'D'  2; 'D'  2; 'D'  2; 'G'  2; 'G'  2; 'G'  2; 'B'  3; 'B'  3; 'C'  3; 'C'  3; ...
         'M'  3; 'M'  3; 'P'  3; 'P'  3; 'F'  4; 'F'  4; 'H'  4; 'H'  4; 'V'  4; 'V'  4; ...
         'W'  4; 'W'  4; 'Y'  4; 'Y'  4; 'K'  5; 'J'  8; 'X'  8; 'Q' 10;'Z' 10};
hands = cell.empty; %Storage array
for i = 1:53 %Loop thru 1st tile
    for j = i+1:54 %Loop thru 2nd tile
        for k = j+1:55 %Loop thru 3rd tile
            hand = strjoin(tiles([i j k 56 57 58 59], 1)',''); %Assemble set
            score = sum(cell2mat(tiles([i j k 56 57 58 59],2))); %Evalute score
            if score == 46
                hands = [hands hand]; %Store when score = 46
            end
        end
    end
end
hands = unique(hands) %Discard Duplicates
solution = length(hands) %Get number of sets