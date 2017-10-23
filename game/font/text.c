#include "myLib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location in Mode 3
void drawChar3(int row, int col, char ch, unsigned short color) {

    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[48*ch + OFFSET(r, c, 6)]) {
                setPixel3(row+r, col+c, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString3(int row, int col, char *str, unsigned short color) {

    // Until the null character appears
    while(*str != '\0') {

        drawChar3(row, col, *str, color);
        col += 6;

        // Point to the next character
        str++;
    }
}