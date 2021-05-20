# Compilers

#?make solo compila la primer regla
#? en cambio si ponemos all: programa, ejecuta la regla que sellama programa
#si hay una regla que depende de otra, 
#quiero crear message.o cada vez que message.cpp message.h cambio
#para crearlo decimos que haga g++ -c message.cpp
#message.o: message.c

#	g++ -c message.cpp
#!target: dependencies
#!action
CC = gcc

# Flags
EXTRA_CFLAGS=
CFLAGS=-std=c11 -Wall -Wextra ${EXTRA_CFLAGS}
LDFLAGS = -lm
ISPC    = ispc
ISPCFLAGS  = -O$(OLEVEL) --pic
COMMONFLAGS = -g

# Binary file
TARGETS = tiny_mc

# Files

SOURCES = $(shell echo *.c)
OBJECTS = probando.o wtime.o tiny_mc.o

# Rules
all: $(TARGETS)
#queremos crear un probando.o cuando cambie probando.ispc, para eso hacemos la linea de abajo
probando.o: probando.ispc
	$(ISPC) $(ISPCFLAGS) -o $@ $< 
#el $@ se refiere a todo el nombre del target
# el $< se refiere a la lista de dependecias que fue matcheada por la regla
#en este caos creo que vendria a ser todos los punto c? 

#de vuelta, cuando cambie probaandol.ispc queremos que nos cree un probando_ispc
#.h
probando_ispc.h: probando.ispc
	$(ISPC) -h $@ $< 
tiny_mc: $(OBJECTS)
	$(CC) $(COMMONFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)
%.o: %.c
	$(CC) $(COMMONFLAGS) $(CFLAGS) $(WFLAGS) $(PARAMFLAGS)  -c $<
.depend_cc: $(SOURCES)
	$(CC) -MM -MG $^ > $@
-include .depend_cc
clean:
	rm -f $(TARGETS) *.o .depend* *_ispc.h
.PHONY: clean all