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

// Constants
#define BULLETCOUNT 5
#define STARCOUNT 100

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern STAR stars[STARCOUNT];
extern int enemiesRemaining;
extern int scoreNumber;
extern int activeStars;

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