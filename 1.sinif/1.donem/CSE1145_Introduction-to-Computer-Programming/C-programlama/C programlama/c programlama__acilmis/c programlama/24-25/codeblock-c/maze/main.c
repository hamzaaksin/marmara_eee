#include <stdio.h>
#include <stdlib.h>

#define MAX 10

int maze[MAX][MAX];
int solution[MAX][MAX];
int rows, cols;

typedef int bool;
#define true 1
#define false 0

bool solvemaze(int x, int y) {
    if (x == rows - 1 && y == cols - 1) { //
        solution[x][y] = 1;
        return true;
    }

    if (x >= 0 && x < rows && y >= 0 && y < cols && maze[x][y] == 0 && solution[x][y] == 0) {
        solution[x][y] = 1;

        if (solvemaze(x + 1, y)) return true;
        if (solvemaze(x, y + 1)) return true;
        if (solvemaze(x - 1, y)) return true;
        if (solvemaze(x, y - 1)) return true;

        solution[x][y] = 0; // hücrelere geri döndürmez
    }

    return false;
}

void printmaze(int matrix[MAX][MAX], int rows, int cols, int is_solution) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            if (is_solution) {
                if (solution[i][j] == 1) {
                    printf("* ");
                } else if (matrix[i][j] == 1) {
                    printf("1 ");
                } else {
                    printf("0 ");
                }
            } else if (matrix[i][j] == 1) {
                printf("1 ");
            } else {
                printf("0 ");
            }
        }
        printf("\n");
    }
}

int main() {
    printf("Enter the dimensions of the maze (rows and columns): ");
    scanf("%d %d", &rows, &cols);
    printf("%d %d\n", rows, cols);

    printf("Enter the maze (row by row, with 0 for open and 1 for wall):\n");
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            scanf("%d", &maze[i][j]);
            solution[i][j] = 0;
        }
    }

    printf("\nInput Maze:\n");
    printmaze(maze, rows, cols, 0);

    if (solvemaze(0, 0)) {
        printf("\nSolution Path:\n");
        printmaze(maze, rows, cols, 1);
    } else {
        printf("\nNo path exists.\n");
    }

    return 0;
}
