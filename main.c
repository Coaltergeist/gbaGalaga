#include <stdlib.h>
#include <stdio.h>
#include "game/library/myLib.h"
#include "game/font/text.h"
#include "game/game.h"
#include "game/pictures/Bill.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Text Buffer
char buffer[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE | DISP_BACKBUFFER;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {

    drawFullscreenImage3(BillBitmap);

    //TODO 2.1: Wait for vertical blank and flip the page (you don't need to reload the palette)
    waitForVBlank();



    state = START;

    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    // Update the score
    sprintf(buffer, "Score: %d", scoreNumber);
    drawString3(145, 5, buffer, WHITE);

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    else if (enemiesRemaining == 0)
        goToWin();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();
}

// Sets up the pause state
void goToPause() {

    fillScreen3(GRAY);
    drawString3(80-3, 120-15, "Pause", BLACK);

    //TODO 2.2: Wait for vertical blank and flip the page
    waitForVBlank();



    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    fillScreen3(GREEN);
    drawString3(80-3, 120-9, "Win", BLACK);

    //TODO 2.3: Wait for vertical blank and flip the page
    waitForVBlank();



    state = WIN;
}

// Runs every frame of the win state
void win() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    fillScreen3(RED);
    drawString3(80-3, 120-12, "Lose", BLACK);

    //TODO 2.4: Wait for vertical blank and flip the page
    waitForVBlank();

    

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
     
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToStart();
}