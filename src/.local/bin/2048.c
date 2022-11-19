// Name: 2048.c
// Simple cli version of the game 2048 by gabrielecirulli (https://github.com/gabrielecirulli/2048).
// This is greatly inspired by mevdschee's version of 2048.c (https://github.com/mevdschee/2048.c/).
// I've just removed the stuf I don't use.
//
// Compiling: gcc -o 2048 2048.c
// Usage: 2048
//
// How to play:
// To navigate the game u can use the arrow keys, but also w,a,s,d and h,j,k,l.
// Press q to quit and r to restart the game.
// To terminate the game you can do ctrl-c.
// Have fun!

#define _XOPEN_SOURCE 500
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <termios.h>
#include <stdbool.h>
#include <stdint.h>
#include <time.h>
#include <signal.h>

#define SIZE 4
uint32_t score=0;
uint8_t scheme=0;

void getColor(uint8_t value, char *color, size_t length) {
    uint8_t original[] = {8,255,1,255,2,255,3,255,4,255,5,255,6,255,7,255,9,0,10,0,11,0,12,0,13,0,14,0,255,0,255,0};
    uint8_t *schemes[] = {original};
    uint8_t *background = schemes[scheme]+0;
    uint8_t *foreground = schemes[scheme]+1;
    if (value > 0) while (value--) {
        if (background+2<schemes[scheme]+sizeof(original)) {
            background+=2;
            foreground+=2;
        }
    }
    snprintf(color,length,"\033[38;5;%d;48;5;%dm",*foreground,*background);
}

void drawBoard(uint8_t board[SIZE][SIZE]) {
    uint8_t x,y;
    char color[40], reset[] = "\033[m";
    printf("\033[H");

    printf("2048.c %17d pts\n\n",score);

    for (y=0;y<SIZE;y++) {
        for (x=0;x<SIZE;x++) {
            getColor(board[x][y],color,40);
            printf("%s",color);
            printf("         ");
            printf("%s",reset);
        }
        printf("\n");
        for (x=0;x<SIZE;x++) {
            getColor(board[x][y],color,40);
            printf("%s",color);
            if (board[x][y]!=0) {
                char s[8];
                snprintf(s,8,"%u",(uint32_t)1<<board[x][y]);
                uint8_t t = 7-strlen(s);
                printf("%*s%s%*s",t-t/2,"",s,t/2,"");
            } else {
                printf("    ·    ");
            }
            printf("%s",reset);
        }
        printf("\n");
        for (x=0;x<SIZE;x++) {
            getColor(board[x][y],color,40);
            printf("%s",color);
            printf("         ");
            printf("%s",reset);
        }
        printf("\n");
    }
    printf("\n");
    printf("          ←,↑,→,↓ or q          \n");
    printf("\033[A"); // One line up.
}

uint8_t findTarget(uint8_t array[SIZE],uint8_t x,uint8_t stop) {
    uint8_t t;
    // If the position is already on the first, don't evaluate.
    if (x==0) {
        return x;
    }
    for(t=x-1;;t--) {
        if (array[t]!=0) {
            if (array[t]!=array[x]) {
                // Merge is not possible, take next position.
                return t+1;
            }
            return t;
        } else {
            // We should not slide further, return this one.
            if (t==stop) {
                return t;
            }
        }
    }
    // We did not find a.
    return x;
}

bool slideArray(uint8_t array[SIZE]) {
    bool success = false;
    uint8_t x,t,stop=0;

    for (x=0;x<SIZE;x++) {
        if (array[x]!=0) {
            t = findTarget(array,x,stop);
            // If target is not original position, then move or merge.
            if (t!=x) {
                // If target is zero, this is a move.
                if (array[t]==0) {
                    array[t]=array[x];
                } else if (array[t]==array[x]) {
                    // Merge (increase power of two).
                    array[t]++;
                    // Increase score.
                    score+=(uint32_t)1<<array[t];
                    // Set stop to avoid double merge.
                    stop = t+1;
                }
                array[x]=0;
                success = true;
            }
        }
    }
    return success;
}

void rotateBoard(uint8_t board[SIZE][SIZE]) {
    uint8_t i,j,n=SIZE;
    uint8_t tmp;
    for (i=0; i<n/2; i++) {
        for (j=i; j<n-i-1; j++) {
            tmp = board[i][j];
            board[i][j] = board[j][n-i-1];
            board[j][n-i-1] = board[n-i-1][n-j-1];
            board[n-i-1][n-j-1] = board[n-j-1][i];
            board[n-j-1][i] = tmp;
        }
    }
}

bool moveUp(uint8_t board[SIZE][SIZE]) {
    bool success = false;
    uint8_t x;
    for (x=0;x<SIZE;x++) {
        success |= slideArray(board[x]);
    }
    return success;
}

bool moveLeft(uint8_t board[SIZE][SIZE]) {
    bool success;
    rotateBoard(board);
    success = moveUp(board);
    rotateBoard(board);
    rotateBoard(board);
    rotateBoard(board);
    return success;
}

bool moveDown(uint8_t board[SIZE][SIZE]) {
    bool success;
    rotateBoard(board);
    rotateBoard(board);
    success = moveUp(board);
    rotateBoard(board);
    rotateBoard(board);
    return success;
}

bool moveRight(uint8_t board[SIZE][SIZE]) {
    bool success;
    rotateBoard(board);
    rotateBoard(board);
    rotateBoard(board);
    success = moveUp(board);
    rotateBoard(board);
    return success;
}

bool findPairDown(uint8_t board[SIZE][SIZE]) {
    bool success = false;
    uint8_t x,y;
    for (x=0;x<SIZE;x++) {
        for (y=0;y<SIZE-1;y++) {
            if (board[x][y]==board[x][y+1]) return true;
        }
    }
    return success;
}

uint8_t countEmpty(uint8_t board[SIZE][SIZE]) {
    uint8_t x,y;
    uint8_t count=0;
    for (x=0;x<SIZE;x++) {
        for (y=0;y<SIZE;y++) {
            if (board[x][y]==0) {
                count++;
            }
        }
    }
    return count;
}

bool gameEnded(uint8_t board[SIZE][SIZE]) {
    bool ended = true;
    if (countEmpty(board)>0) return false;
    if (findPairDown(board)) return false;
    rotateBoard(board);
    if (findPairDown(board)) ended = false;
    rotateBoard(board);
    rotateBoard(board);
    rotateBoard(board);
    return ended;
}

void addRandom(uint8_t board[SIZE][SIZE]) {
    static bool initialized = false;
    uint8_t x,y;
    uint8_t r,len=0;
    uint8_t n,list[SIZE*SIZE][2];

    if (!initialized) {
        srand(time(NULL));
        initialized = true;
    }

    for (x=0;x<SIZE;x++) {
        for (y=0;y<SIZE;y++) {
            if (board[x][y]==0) {
                list[len][0]=x;
                list[len][1]=y;
                len++;
            }
        }
    }

    if (len>0) {
        r = rand()%len;
        x = list[r][0];
        y = list[r][1];
        n = (rand()%10)/9+1;
        board[x][y]=n;
    }
}

void initBoard(uint8_t board[SIZE][SIZE]) {
    uint8_t x,y;
    for (x=0;x<SIZE;x++) {
        for (y=0;y<SIZE;y++) {
            board[x][y]=0;
        }
    }
    addRandom(board);
    addRandom(board);
    drawBoard(board);
    score = 0;
}

void setBufferedInput(bool enable) {
    static bool enabled = true;
    static struct termios old;
    struct termios new;

    if (enable && !enabled) {
        // Restore the former settings.
        tcsetattr(STDIN_FILENO,TCSANOW,&old);
        // set the new state
        enabled = true;
    } else if (!enable && enabled) {
        // Get the terminal settings for standard input.
        tcgetattr(STDIN_FILENO,&new);
        // We want to keep the old setting to restore them at the end.
        old = new;
        // Disable canonical mode (buffered i/o) and local echo.
        new.c_lflag &=(~ICANON & ~ECHO);
        // Set the new settings immediately.
        tcsetattr(STDIN_FILENO,TCSANOW,&new);
        // Set the new state.
        enabled = false;
    }
}

void signal_callback_handler(int signum) {
    printf("            TERMINATED            \n");
    setBufferedInput(true);
    printf("\033[?25h\033[m");
    exit(signum);
}

int main(int argc, char *argv[]) {
    uint8_t board[SIZE][SIZE];
    char c;
    bool success;

    printf("\033[?25l\033[2J");

    // Register signal handler for when ctrl-c is pressed.
    signal(SIGINT, signal_callback_handler);

    initBoard(board);
    setBufferedInput(false);
    while (true) {
        c=getchar();
        if (c == -1){
            puts("\nError! Cannot read keyboard input!");
            break;
        }
        switch(c) {
            case 97: // 'a' key
            case 104:    // 'h' key
            case 68: // left arrow
                success = moveLeft(board);  break;
            case 100:    // 'd' key
            case 108:    // 'l' key
            case 67: // right arrow
                success = moveRight(board); break;
            case 119:    // 'w' key
            case 107:    // 'k' key
            case 65: // up arrow
                success = moveUp(board);     break;
            case 115:    // 's' key
            case 106:    // 'j' key
            case 66: // down arrow
                success = moveDown(board);  break;
            default: success = false;
        }
        if (success) {
            drawBoard(board);
            usleep(150000);
            addRandom(board);
            drawBoard(board);
            if (gameEnded(board)) {
                printf("            GAME OVER             \n");
                break;
            }
        }
        if (c=='q') {
            printf("          QUIT? (y/n)            \n");
            c=getchar();
            if (c=='y' || c=='Y') {
                break;
            }
            drawBoard(board);
        }
        if (c=='r') {
            printf("         RESTART? (y/n)         \n");
            c=getchar();
            if (c=='y' || c=='Y') {
                initBoard(board);
            }
            drawBoard(board);
        }
    }
    setBufferedInput(true);

    printf("\033[?25h\033[m");

    return EXIT_SUCCESS;
}
