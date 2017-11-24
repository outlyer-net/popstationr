OUTPUT=popstationr
OBJS=main.o toc.o iniparser.o
CFLAGS=-Wall -Os -I.
LDFLAGS=-L.
LIBS = -lz -lm
DESTDIR=
PREFIX=/usr/local

all: $(OUTPUT)

clean:
	rm -f $(OUTPUT) *.o

install:
	install -D -m0755 $(OUTPUT) $(DESTDIR)$(PREFIX)/bin/$(OUTPUT)

$(OUTPUT): $(OBJS)
	$(LINK.c) $(LDFLAGS) -o $@ $^ $(LIBS)
