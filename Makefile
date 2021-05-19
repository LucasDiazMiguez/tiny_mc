# Compilers
CC = gcc

# Flags
EXTRA_CFLAGS=
CFLAGS=-std=c11 -Wall -Wextra ${EXTRA_CFLAGS}
LDFLAGS = -lm
ISPC    = ispc
ISPCFLAGS  = -O$(OLEVEL) --pic
COMMONFLAGS = -g

# Binary file
TARGET = tiny_mc wtime.c

# Files

SOURCES	= $(shell echo *.c)
OBJECTS = probando.o wtime.o tiny_mc.o

# Rules
all: $(TARGETS)

probando.o: probando.ispc
	ispc -o probando.o -h  probando.h probando.ispc
tiny_mc: $(OBJECTS)  
	$(CC) $(COMMONFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)


%.o: %.c
	$(CC) $(COMMONFLAGS) $(CFLAGS) $(WFLAGS) $(PARAMFLAGS)  -c $<

.depend_cc: $(SOURCES)
	$(CC) -MM $^ > $@

-include .depend_cc



clean:
	rm -f $(TARGETS) *.o .depend* *_ispc.h

.PHONY: clean all
	



