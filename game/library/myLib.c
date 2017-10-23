#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set a pixel on the screen in Mode 3
void setPixel3(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int row, int col, int height, int width, volatile unsigned short color) {

	for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
	}
}


// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {

	DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int row, int col, int height, int width, const unsigned short *image) {

    // TODO 6.0: Write this function using DMA
    for (int i = 0; i < height; i++)  {
    	DMANow(3, &image[OFFSET(i, 0, width)], &videoBuffer[OFFSET(row + i, col, 240)], width);
    }

}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, 38400);
}

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // TODO 4.0: Complete this function
    // First, turn this channel of DMA off (cnt = 0)
    dma[channel].cnt = 0;
    // Second, set the source and destination registers of this DMA channel to the given parameters
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Finally, set the control to the given parameter, and bitwise-or DMA_ON to the end to turn it on
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}