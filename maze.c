#include <stdio.h>

/* 
@brief:
Struct to hold the value of a text file in a 2D array
@vars:
row (char) - each row of the file 
length (int) - the number of rows */
struct MAZE {
    int length;
    char row[100];
} MAZE; 

/*
@brief:
Struct to hold the current position of the user in the mao
@vars:
x (int) - x position on map
y (int) - y position on map
*/
struct POS {
    int x;
    int y;
} POS;

/* 
@brief
Function to ensure a text file is valid
To be valid, lengths of columns and rows must be between 5-100
They must also be the same length
The file must be of type txt and only contain #/' '/E/S
The file must be opened for this to be tested
Returns a bool if valid and outputs the length of the file 
@param:
fileName (char) - used to connect to the file
MAZE.length (struct int) - holds the length of the file
@vars:
valid (int) - a bool value to return whether the files valid
@return:
valid
*/
int valid(char fileName) {

}

/* 
@brief:
Function to convert the maze file to the struct
Iterates through each line based on length of struct
Each row of the file is written to the row in the array struct
@param:
MAZE (struct) - passing in values to this 
@vars:
MAZE[i].row (char) - holds value of each row in the array
*/
void convert_struct(int* MAZE) {

}

/*
@brief:
Tests to see if the movement is valid
To be valid the move must not move into a wall
Uses the direction to check the 
@params:
POSITION (struct) - passed by value to test
direction (char) - tells which square needs to be tested
MAZE (struct) - a full struct with all the values needed 
@return:
valid (int) - used like a bool 1 for valid 0 for invalid 
*/
int valid_move(int POSITION, char direction, int MAZE) {

}

/*
@brief:
Finds the S in the maze and sets the POSITION struct to it
Uses a neseted loop to search through the MAZE struct
When it finds the S - updates the POSITION struct
@params: 
POSITION (struct) - passed by reference to be updated
MAZE (struct) - passed by val 
*/
int start_pos(int* POSITION, int MAZE) {

}

/*
@brief:
Checks if the POSITION struct in the MAZE = E, ending the maze
@params:
POSITION (struct) - passed by val
MAZE (struct) - passed by val 
@return:
finish (int) - acts as a bool
*/
int end_test(int POSITION, int MAZE){
    
}

int main(int argc, char *argv[]) {
    //initates structs for current position and maze

    //calls functions to check validity of file & convert to struct

    //gets user input then switch case to check movement
    //each switch case should check whether the move is valid i.e not running into wall
    //if invalid - return error message
    //if valid - update position
    //then checks for finish
}