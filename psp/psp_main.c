#include <pspkernel.h>
#include <pspdebug.h>
#include <pspdisplay.h>
#include "../include/types.h"

PSP_MODULE_INFO("GamePort", 0, 1, 0);
PSP_MAIN_THREAD_ATTR(THREAD_ATTR_USER | THREAD_ATTR_VFPU);

static int running = 1;

/* Callback de salida para el botón HOME de la PSP */
int exit_callback(int arg1, int arg2, void *common) {
    running = 0;
    sceKernelExitGame();
    return 0;
}

int callback_thread(SceSize args, void *argp) {
    int cbid = sceKernelCreateCallback("Exit Callback", exit_callback, NULL);
    sceKernelRegisterExitCallback(cbid);
    sceKernelSleepThreadCB();
    return 0;
}

int setup_callbacks(void) {
    int thid = sceKernelCreateThread("update_thread", callback_thread, 0x11, 0xFA0, 0, 0);
    if (thid >= 0) {
        sceKernelStartThread(thid, 0, 0);
    }
    return thid;
}

int is_running(void) {
    return running;
}
