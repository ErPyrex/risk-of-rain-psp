TARGET = game_port
OBJS = ../src/main.o psp_main.o

INCDIR = ../include
CFLAGS = -O2 -G0 -Wall -D__PSP__
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

LIBDIR =
LDFLAGS =
LIBS = -lpspgu -lpspge -lpspdisplay -lpsppower -lpspaudio

EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_TITLE = Game Port for PSP
# PSP_EBOOT_ICON = ICON0.PNG
# PSP_EBOOT_PIC1 = PIC1.PNG

PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak
