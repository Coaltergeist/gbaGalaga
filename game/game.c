#include <stdlib.h>
#include "library/myLib.h"
#include "game.h"
#include "pictures/ship.h"
#include "pictures/bullet.h"

// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
STAR stars[STARCOUNT];
int scoreNumber;
int enemiesRemaining;
int activeStars;

// Initialize the game
void initGame() {

	initPlayer();
    initBullets();
    initStars();

    // Initialize the score
	enemiesRemaining = STARCOUNT;
	activeStars = 0;

}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet(&bullets[i]);

	// Update all the balls
	for (int i = 0; i < STARCOUNT; i++)
		updateStar(&stars[i]);
}

// Draws the game each frame
void drawGame() {

    waitForVBlank();

    fillScreen3(BLACK);

	drawPlayer();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet(&bullets[i]);

	// Draw all the balls
	for (int i = 0; i < STARCOUNT; i++)
		drawStar(&stars[i]);
}

// Initialize the player
void initPlayer() {

	player.row = 130;
	player.col = 102;
	player.cdel = 2;
	player.height = 16;
	player.width = 18;
	player.bulletTimer = 20;
}

// Handle every-frame actions of the player
void updatePlayer() {

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= player.cdel) {

		player.col -= player.cdel;
        player.cDirection = -1;

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

		player.col += player.cdel;
        player.cDirection = 1;

	} else {
        player.cDirection = 0;
    }

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 13) {

		fireBullet();
		player.bulletTimer = 0;
	}

	player.bulletTimer++;
}

// Draw the player
void drawPlayer() {

	drawImage3(player.row, player.col, player.height, player.width, shipBitmap);
}

// Initialize the pool of bullets
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {

		bullets[i].height = 4; // Varies size for testing drawRect
		bullets[i].width = 2;    // Varies size for testing drawRect
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].rdel = -2;
        bullets[i].cdel = 0;
		bullets[i].color = RED;
		bullets[i].active = 0;
	}
}

// Spawn a bullet
void fireBullet() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {

			// Position the new bullet
			bullets[i].row = player.row;
			bullets[i].col = player.col + player.width/2
				- bullets[i].width/2;

            // Slant it in the direction of player movement
            bullets[i].cdel = player.cDirection;

			// Take the bullet out of the pool
			bullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

	// If active, update; otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0
            && b->col + b->cdel < SCREENWIDTH-1) {

			b->row += b->rdel;
            b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {

	if(b->active) {
		drawImage3(b->row, b->col, b->height, b->width, bulletBitmap);
	}
}

// Initialize the balls
void initStars() {

	for (int i = 0; i < 20; i++) {
		initStar(i);
		stars[i].row = rand() % 160;

	}
}

void initStar(int i) {

	stars[i].height = 1;
	stars[i].width = 1;
	stars[i].row = 0;
	stars[i].col = rand() % 240;
	stars[i].rdel = rand() % 6 + 1;
	stars[i].active = 1;

	activeStars++;

}

// Handle every-frame actions of a ball
void updateStar(STAR* b) {

	if (activeStars < 20) {
		for (int k = 0; k < STARCOUNT; k++) {
			if (stars[k].active == 0) {
				initStar(k);
				break;
			}
		}
	}

	if (b->active) {

		// Moves ball to top of screen
		if (b->row + b->height-1 >= 159) {
			b->active = 0;

			activeStars--;

			for (int j = 0; j < STARCOUNT; j++) {
				if (stars[j].active == 0) {
					initStar(j);
					activeStars++;
					break;
				}
			}
		}


		// Move the ball
		b->row += b->rdel;
	}
}

// Draw a ball
void drawStar(STAR* b) {

	if(b->active) {
        drawRect3(b->row, b->col, b->height, b->width, WHITE);
	}
}