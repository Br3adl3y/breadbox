%How many unique sets of 7 Scrabble tiles have a total score of 46?

%Brute Force Solution:
%Loop thru all tiles, discard set that don't score 46, discard duplicates.
%Required Loops: 80,678,106,432,000

%Optimization 1: 
%Sets cannot reach 46 without the 4 highest tiles: J X Q Z
%Last four tiles are fixed to J X Q Z. Puzzle can be 10 points/3 tiles.
%Required Loops: 857,280

%Optimization 2: 
%Only 3 maximum of each letter is required. 
%Duplicates of each letter after 3 removed from matrix.
%Required Loops: 175,560

%Optimization 3: 
%Any set with a blank tile cannot total 46 exactly.
%Blank tiles removed from matrix.
%Required Loops: 157,410

%Optimization 4: 
%Sets with more than 1 tile worth 1 point cannot reach 46
%Duplicates of score 1 tiles removed
%Required Loops: 39,270

%Optimization 5: 
%Sets with more than 1 tile worth 2 points cannot reach 46
%Duplicates of score 2 tiles removed
%Required Loops: 26,970

%Optimization 6:
%Tiles worth 1 or 2 only need to be looped thru once and solution can be
%adjusted afterwards
%1 and 2 tiles deleted except A and D. Set with A = 10 sets, D = 2 sets
%Required Loops: 7,980

%Final processing time: 0.575 seconds
%Solution = 138

tiles = {'A'  1; 'D'  2; 'B'  3; 'B'  3; 'C'  3; 'C'  3; 'M'  3; 'M'  3; 'P'  3; 'P'  3; ...
         'F'  4; 'F'  4; 'H'  4; 'H'  4; 'V'  4; 'V'  4; 'W'  4; 'W'  4; 'Y'  4; 'Y'  4; ...
         'K'  5};
hands = cell.empty; %Storage array
for i = 1:19 %Loop thru 1st tile
    for j = i+1:20 %Loop thru 2nd tile
        for k = j+1:21 %Loop thru 3rd tile
            hand = strjoin(tiles([i j k], 1)',''); %Assemble set
            score = sum(cell2mat(tiles([i j k], 2))); %Evalute score
            if score == 10
                hands = [hands hand]; %Store when score = 10
            end
        end
    end
end
hands = unique(hands); %Discard Duplicates
solution = length(hands) + sum(cell2mat(strfind(hands, 'A')))*9 + sum(cell2mat(strfind(hands, 'D'))) %Get number of sets
