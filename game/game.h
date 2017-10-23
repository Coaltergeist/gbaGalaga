// Player Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int bulletTimer;
	int cDirection; // So the bullet knows which cdel to take
} PLAYER;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
} BULLET;

// Ball Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int height;
	int width;
	int active;
} STAR;

typedef struct {
	int row;
	int col;
	int rdel;
	int height;
	int width;
	int active;
} ASTEROID;

typedef struct {
	int row;
	int col;
	int rdel;
	int height;
	int width;
	int active;
} ENEMY;

// Constants
#define BULLETCOUNT 5
#define STARCOUNT 30
#define ASTEROIDCOUNT 6
#define ENEMYCOUNT 10

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern STAR stars[STARCOUNT];
extern ASTEROID asteroids[ASTEROIDCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern int enemiesRemaining;
extern int scoreNumber;
extern int activeStars;
extern int livesRemaining;
extern int isHit;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initStars();
void initStar();
void updateStar(STAR *);
void drawStar(STAR *);
void initAsteroids();
void updateAsteroid(ASTEROID* a);
void drawAsteroid(ASTEROID* a);
void initEnemies();
void updateEnemy(ENEMY* e);
void drawEnemy(ENEMY* e);