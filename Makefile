SOURCE    = janus_textroom

COMPILER  = gcc
CFLAGS    = -g -MMD -MP -Wall -Wextra -Winit-self -Wno-missing-field-initializers
SRCDIR    = ./src
LIBS      = -L/usr/local/lib/x86_64-linux-gnu -lconfig -lnice -lgio-2.0 -lgobject-2.0 -lglib-2.0 -ljansson -lssl -lcrypto -lz -lm -ldl -lusrsctp -pthread -DHAVE_SCTP -lsrtp2 -lcrypto -lcurl
INCLUDE	  = -I/opt/janus/include/janus/plugins -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/opt/janus/include/janus/
OBJECTS   =  $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))

plugin:	$(SRCDIR)/${SOURCE}.c
	$(COMPILER) -fPIC -shared $(CGLAG) $(INCLUDE) $(LIBS) -o lib$(SOURCE).so $<


all: clean plugin
default: plugin

