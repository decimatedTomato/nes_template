/* Hello world */

#include "defines.h"

#include "lib/neslib.h"
#include "lib/nesdoug.h"

#define BLACK 0x0f
#define DARK_GRAY 0x00
#define LIGHT_GRAY 0x10
#define WHITE 0x30

// Speeds it up
#pragma bss-name(push, "ZEROPAGE")

var i;

const var text[] = "Hello World!";

const var palette[] = {
    BLACK, DARK_GRAY, LIGHT_GRAY, WHITE,
    0,0,0,0,
    0,0,0,0,
    0,0,0,0,
};

void main(void)
{
    ppu_off();  // Screen off
    pal_bg(palette);    // Load the BG palette
    vram_adr(NTADR_A(10, 14));  // Move cursor
    vram_write(text, sizeof(text));
    ppu_on_all();   // turn on screen
    while (1) {}
}