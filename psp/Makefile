TARGET = ror_psp
OBJS = ../src/main.o ../src/player.o ../src/director.o ../src/item.o ../src/game.o psp_main.o

INCDIR = ../include
CFLAGS = -O2 -G0 -Wall -D__PSP__ -DPLATFORM_PSP
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

LIBDIR =
LDFLAGS =
LIBS = -lpspgu -lpspge -lpspdisplay -lpspctrl -lpsppower -lpspaudio -lm

EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_TITLE = Risk of Rain PSP

PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak
