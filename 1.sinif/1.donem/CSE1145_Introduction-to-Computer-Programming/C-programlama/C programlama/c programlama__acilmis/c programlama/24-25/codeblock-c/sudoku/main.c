#include <stdio.h>
#include <stdlib.h>

#define GRID_SIZE 9
#define MAX_MISTAKES 3


void displayGrid(int grid[GRID_SIZE][GRID_SIZE]) {
    for (int i = 0; i < GRID_SIZE; i++) {
        for (int j = 0; j < GRID_SIZE; j++) {
            if (grid[i][j] == 0)
                printf(". ");
            else
                printf("%d ", grid[i][j]);
        }
        printf("\n");
    }
}


void startGame(int puzzle[GRID_SIZE][GRID_SIZE], int solution[GRID_SIZE][GRID_SIZE]) {
    int mistakeCount = 0;
    int rowInput, colInput, numInput;

    while (mistakeCount < MAX_MISTAKES) {

        printf("\n");
        displayGrid(puzzle);


        scanf("%d %d %d", &numInput, &rowInput, &colInput);
        printf("Enter your move (number row column): %d %d %d\n", numInput, rowInput, colInput);

        if (numInput == -1) {
            printf("Exiting the game. Thanks for playing!\n");
            return;
        }


        if (puzzle[rowInput][colInput] != 0) {
            printf("Cell already filled. Try a different cell.\n");
            continue;
        }


        if (solution[rowInput][colInput] == numInput) {

            printf("Correct move!\n");
            puzzle[rowInput][colInput] = numInput;

        } else {

            mistakeCount++;
            printf("Incorrect move. You have %d guesses left.\n", MAX_MISTAKES - mistakeCount);
        }


        int gameComplete = 1;
        for (int i = 0; i < GRID_SIZE; i++) {
            for (int j = 0; j < GRID_SIZE; j++) {
                if (puzzle[i][j] == 0) {
                    gameComplete = 0;
                    break;
                }
            }
            if (!gameComplete) break;
        }

        if (gameComplete) {
            printf("\nCongratulations! You solved the Sudoku!\n");
            displayGrid(puzzle);
            return;
        }
    }

    printf("\nGame over! You exceeded the maximum number of incorrect guesses.\n");
}

int main() {

    int solution[GRID_SIZE][GRID_SIZE] = {
        {5, 3, 4, 6, 7, 8, 9, 1, 2},
        {6, 7, 2, 1, 9, 5, 3, 4, 8},
        {1, 9, 8, 3, 4, 2, 5, 6, 7},
        {8, 5, 9, 7, 6, 1, 4, 2, 3},
        {4, 2, 6, 8, 5, 3, 7, 9, 1},
        {7, 1, 3, 9, 2, 4, 8, 5, 6},
        {9, 6, 1, 5, 3, 7, 2, 8, 4},
        {2, 8, 7, 4, 1, 9, 6, 3, 5},
        {3, 4, 5, 2, 8, 6, 1, 7, 9}
    };


    int initialPuzzle[GRID_SIZE][GRID_SIZE] = {
        {5, 3, 4, 6, 7, 8, 9, 1, 2},
        {6, 7, 2, 1, 9, 5, 3, 4, 8},
        {1, 9, 8, 3, 4, 2, 5, 6, 7},
        {8, 5, 9, 7, 6, 1, 4, 2, 0},
        {4, 2, 6, 8, 0, 3, 7, 9, 1},
        {7, 1, 3, 9, 2, 4, 8, 0, 6},
        {9, 6, 0, 5, 3, 7, 2, 8, 4},
        {2, 8, 7, 4, 1, 9, 6, 3, 5},
        {3, 4, 5, 2, 8, 6, 1, 7, 0}
    };


    printf("Welcome to Sudoku! Fill in the grid step by step.\n");
    printf("Enter a number followed by row and column\n");
    printf("(e.g., 5 3 8 to place 5 at row 3, column 8).\n");
    printf("You have a maximum of 3 incorrect guesses. Type -1 to exit.\n");

    startGame(initialPuzzle, solution);

    return 0;
}
