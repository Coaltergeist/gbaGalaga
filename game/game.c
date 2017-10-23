#include <stdlib.h>
#include "library/myLib.h"
#include "game.h"
#include "pictures/ship.h"
#include "pictures/bullet.h"
#include "pictures/asteroid.h"
#include "pictures/enemy.h"

// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
STAR stars[STARCOUNT];
ASTEROID asteroids[ASTEROIDCOUNT];
ENEMY enemies[ENEMYCOUNT];
int scoreNumber;
int enemiesRemaining;
int activeStars;
int livesRemaining;
int isHit;

// Initialize the game
void initGame() {

	initPlayer();
    initBullets();
    initStars();
    initAsteroids();
    initEnemies();

    for (int i = 0; i < ENEMYCOUNT; i++) {
    	if (enemies[i].active == 0) {
    		enemies[i].active = 1;
    		break;
    	}
    }


    // Initialize the score
	enemiesRemaining = ENEMYCOUNT;
	activeStars = 0;
	livesRemaining = 4;
	isHit = 0;

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

	for (int i = 0; i < ASTEROIDCOUNT; i++)
		updateAsteroid(&asteroids[i]);

	for (int i = 0; i < ENEMYCOUNT; i++)
		updateEnemy(&enemies[i]);

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

	for (int i = 0; i < ASTEROIDCOUNT; i++)
		drawAsteroid(&asteroids[i]);

	for (int i = 0; i < ENEMYCOUNT; i++)
		drawEnemy(&enemies[i]);
}

// Initialize the player
void initPlayer() {

	player.row = 130;
	player.col = 111;
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
	stars[i].rdel = rand() % 6 + 2;
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

		// Moves star to bottom of screen
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


		// Move the star
		b->row += b->rdel;
	}
}

// Draw a ball
void drawStar(STAR* b) {

	if(b->active) {
        drawRect3(b->row, b->col, b->height, b->width, WHITE);
	}
}

void initAsteroids() {
	for (int i = 0; i < ASTEROIDCOUNT; i++) {
		asteroids[i].height = 12;
		asteroids[i].width = 12;
		asteroids[i].row = rand() % 160;
		asteroids[i].col = rand() % 240;
		asteroids[i].rdel = 1;
		asteroids[i].active = 1;
	}
}

void drawAsteroid(ASTEROID* a) {
	if (a->active) {
		drawImage3(a->row, a->col, a->height, a->width, asteroidBitmap);
	}
}

void updateAsteroid(ASTEROID* a) {
	if (a->active) {
		if (a->row >= 159) {
			a->row = 0;
			a->col = rand() % 240;
		} else {
			a->row += a->rdel;
		}

		if (collision(a->row, a->col, a->height, a->width, player.row, player.col, player.height, player.width)) {
			a->row = 0;
			a->col = rand() % 240;
			isHit = 1;
		}
	}
}

void initEnemies() {
	for (int i = 0; i < ASTEROIDCOUNT; i++) {
		enemies[i].height = 12;
		enemies[i].width = 12;
		enemies[i].row = 0;
		enemies[i].col = rand() % 240;
		enemies[i].rdel = rand() % 3 + 1;
		enemies[i].active = 0;
	}
}

void drawEnemy(ENEMY* e) {
	if (e->active) {
		drawImage3(e->row, e->col, e->height, e->width, enemyBitmap);
	}
}

void updateEnemy(ENEMY* e) {
	if (e->active) {
		if (e->row >= 159) {
			e->row = 0;
			e->col = rand() % 240;
		} else if (collision(player.row, player.col, player.height, player.width, e->row, e->col, e->height, e->width)) {
			e->row = 0;
			e->col = rand() % 240;
			e->active = 0;
			enemiesRemaining--;
			scoreNumber += 10;
			for (int i = 0; i < ENEMYCOUNT; i++) {
		    	if (enemies[i].active == 0) {
		    		enemies[i].active = 1;
		    		break;
		    	}
    		}
			isHit = 1;
		}
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (collision(bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width, e->row, e->col, e->height, e->width)) {
				e->row = 0;
				e->col = rand() % 240;
				e->active = 0;
				enemiesRemaining--;
				scoreNumber += 10;
				for (int i = 0; i < ENEMYCOUNT; i++) {
			    	if (enemies[i].active == 0) {
			    		enemies[i].active = 1;
			    		break;
			    	}
    			}
			}
		}
		e->row += e->rdel;
	}
}