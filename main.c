#include <stdlib.h>
#include <stdio.h>
#include "game/library/myLib.h"
#include "game/font/text.h"
#include "game/game.h"
#include "game/pictures/ship.h"
#include "game/pictures/explosion1.h"
#include "game/pictures/explosion2.h"

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
void goToHit();
void hit();

// States
enum {START, GAME, PAUSE, WIN, LOSE, HIT};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

//counts frame by frame to flash image
int frameCount;

// Text Buffer
char buffer[41];
char buffer2[41];

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
            case HIT:
                hit();
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

    fillScreen3(BLACK);
    drawImage3(130, 111, 16, 18, shipBitmap);
    drawString3(76, 86, "Press Start", WHITE);

    //TODO 2.1: Wait for vertical blank and flip the page (you don't need to reload the palette)
    waitForVBlank();

    state = START;

    // Begin the seed randomization
    seed = 0;
    frameCount = 1;
}

// Runs every frame of the start state
void start() {

    seed++;
    if (frameCount > 0) {
        frameCount++;
        if (frameCount > 120) {
            drawRect3(76, 86, 8, 100, BLACK);
            frameCount = -1;
        }
    } else {
        frameCount--;
        if (frameCount < -120) {
            drawString3(76, 86, "Press Start", WHITE);
            frameCount = 1;
        }
    }

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

    sprintf(buffer2, "Lives: %d", livesRemaining - 1);
    drawString3(145, 184, buffer2, WHITE);

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    else if (livesRemaining == 0)
        goToLose();
    else if (enemiesRemaining == 0)
        goToWin();
    else if (isHit)
        goToHit();
}

// Sets up the pause state
void goToPause() {

    drawRect3(80 - 3, 120 - 15, 8, 30, BLACK);
    drawString3(80-3, 120-15, "Pause", WHITE);

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

// Sets up the hit state
void goToHit() {
    waitForVBlank();
    state = HIT;
    frameCount = 0;
    livesRemaining--;
    drawRect3(player.row, player.col, 16, 18, BLACK);
    drawImage3(player.row, player.col, 16, 18, explosion1Bitmap);

}

// Runs every frame of the hit state
void hit() {

    frameCount++;
    waitForVBlank();
    if (frameCount % 60 == 0) {
        drawRect3(player.row, player.col, 16, 18, BLACK);
        drawImage3(player.row, player.col, 16, 18, explosion2Bitmap);
    } else if (frameCount % 120 == 0) {
        drawRect3(player.row, player.col, 16, 18, BLACK);
        drawImage3(player.row, player.col, 16, 18, explosion1Bitmap);
    }

    if (frameCount > 180) {
        if (livesRemaining == 0) {
            goToLose();
        } else {
            isHit = 0;
            goToGame();
        }
    }

}