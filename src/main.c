#include <stdio.h>
#include "types.h"

#ifdef PLATFORM_PSP
#include <pspkernel.h>
#include <pspdebug.h>
extern int setup_callbacks(void);
extern int is_running(void);
#endif

int main(int argc, char *argv[]) {
#ifdef PLATFORM_PSP
    setup_callbacks();
    pspDebugScreenInit();
    pspDebugScreenPrintf("=== PSP Game Port Initialized ===\n");
    pspDebugScreenPrintf("Ready for decompiled game logic.\n");

    while (is_running()) {
        sceDisplayWaitVblankStart();
    }

    sceKernelExitGame();
#else
    printf("=== Game Port (Host Build) ===\n");
    printf("Compilacion para pruebas en PC activa.\n");
#endif
    return 0;
}
