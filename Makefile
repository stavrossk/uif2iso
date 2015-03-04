#   Copyright (C) 2007,2008,2009 Luigi Auriemma
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   http://www.gnu.org/licenses/gpl.txt

EXE			= uif2iso
CFLAGS		+= -O2 -s

DESTDIR		=
prefix		= /usr/local
exec_prefix	= $(prefix)
bindir		= $(exec_prefix)/bin
BINDIR		= $(DESTDIR)$(bindir)

SRC			= $(EXE).c
LIBS		= -lz des.c LzmaDec.c Bra86.c
LIBSNEW		= 3way.c blowfish.c dunno.c gost.c idea.c loki91.c rc5.c seal.c

all:
#	$(CC) $(SRC) $(CFLAGS) -o $(EXE) $(LIBS)
	$(CC) $(SRC) $(CFLAGS) -o $(EXE) $(LIBS) $(LIBSNEW) -DMAGICISO_IS_SHIT

install:
	install -m 755 -d $(BINDIR)
	install -m 755 $(EXE) $(BINDIR)

clean:
	rm -f *.o *.exe $(EXE)

.PHONY: clean install

# End of file
