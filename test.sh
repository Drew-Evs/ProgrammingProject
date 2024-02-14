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

# testing movement - W/A/S/D should move the character the correct way
echo -e "\n\n~~ Movement Tests ~~"

# should return an error if the player moves into a wall
./maze testMaps/wallTest.txt < inputs/moveForward > tmp
if grep -q "Can't move into wall";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# check if player hits the exit
./maze testMaps/exitTest.txt < inputs/moveForward > tmp
if grep -q "Found exit";
then 
    echo "PASS"
else
    echo "FAIL"
fi

# testing map - if player presses m, should return the map matching original file
./maze testFiles/correctFile.txt < inputs/openMap > tmp
if grep -q testFiles/correctFile.txt;
then
    echo "PASS"
else    
    echo "FAIL"
fi