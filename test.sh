#!/bin/bash

# testing arguments - should be 1 for a filename
echo -e "\n\n~~ Argument Tests ~~"

echo -n "Testing no arguments - "
./maze > tmp
if grep -q "Usage: maze <filename>" tmp;
then 
    echo "PASS"
else 
    echo "FAIL"
fi

echo -n "Testing too many arguments - "
./maze test1.txt test2.txt > tmp
if grep -q "Usage: maze <filename>" tmp;
then 
    echo "PASS"
else 
    echo "FAIL"
fi

# should print maze after correct argument amount entered
echo -n "Correct file test - "
./maze testFiles/correctFile.txt > tmp
if grep -q testFiles/correctFile.txt;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# testing file valid - be within 5-100 and each column and row are the same length
echo -e "\n\n~~ File Validity ~~"

# testing a file that is entered exists
echo -n "Non existent file test - "
./maze nonExistent.txt > tmp
if grep -q "File doesn't exist";
then 
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Non text file test - "
./maze testFiles/incorrectType.csv > tmp
if grep -q "File is not a .txt file";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# a too long file - should tell user file is too long
echo -n "Out of range file - "
./maze testFiles/outOfRange.txt > tmp
if grep -q "File must be under 100 rows";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# a too short file - should tell user file too short
echo -n "Below range file - "
./maze testFiles/belowRange.txt > tmp
if grep -q "File must be over 5 rows";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# testing rows, where they are different length 
echo -n "Below range file - "
./maze testMaps/differentLength.txt > tmp
if grep -q "File must have rows of the same length";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# testing correct file
echo -n "Correct file range - "
./maze testFiles/correctFile.txt > tmp
if grep -q "Correct length file";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# testing to see if a file is valid by having an S and E
echo -n "Start and end test - "
./maze testMaps/emptyMaze.txt > tmp
if grep -q "No start or no end";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# testing movement - W/A/S/D should move the character the correct way
# each test should take one move in the right direction to exit the maze
echo - e "\n\n~~ Movement Tests ~~"

echo -n "Moving right test - "
./maze testMaps/rightTest.txt < inputs/moveRight.txt > tmp
if grep -q "Found exit";
then 
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Moving right test - "
./maze testMaps/upTest.txt < inputs/moveForward.txt > tmp
if grep -q "Found exit";
then 
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Moving left test - "
./maze testMaps/leftTest.txt < inputs/moveLeft.txt > tmp
if grep -q "Found exit";
then 
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Moving down test - "
./maze testMaps/downTest.txt < inputs/moveDown.txt > tmp
if grep -q "Found exit";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# testing validity of moves 
echo -e "\n\n~~ Movement Validity Tests ~~"

# should return an error if the player moves into a wall
echo -n "Moving into wall test - "
./maze testMaps/wallTest.txt < inputs/moveForward.txt > tmp
if grep -q "Can't move into wall";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# should return valid if the player moves into a space
echo -n "Valid move test - "
./maze testFiles/correctFile.txt < inputs/moveRight.txt > tmp
if grep -q "Valid move";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# check if player hits the exit
echo -n "Exit test - "
./maze testMaps/exitTest.txt < inputs/moveForward.txt > tmp
if grep -q "Found exit";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# testing map - if player presses m, should return the map matching original file
echo -n "Map test - "
./maze testFiles/correctFile.txt < inputs/openMap.txt > tmp
if grep -q testFiles/correctFile.txt;
then
    echo "PASS"
else    
    echo "FAIL"
fi