SYSCONF_LINK = g++
CPPFLAGS     =
LDFLAGS      =
LIBS         = -lm

DESTDIR = bin/
OBJDIR  = obj/
TARGET  = main

OBJECTS = $(addprefix $(OBJDIR), $(patsubst %.cpp,%.o,$(wildcard *.cpp)))

.PHONY: all clean

all: $(OBJDIR) $(DESTDIR) $(DESTDIR)$(TARGET)

$(OBJDIR):
	mkdir $(OBJDIR)

$(DESTDIR):
	mkdir $(DESTDIR)

# noob notes
# https://www.gnu.org/software/make/manual/make.html
#
# $@ expands to the name of the currently built target
# $< means 'first dependency'
# $^ expands all the dependencies
$(OBJDIR)%.o: %.cpp
	$(SYSCONF_LINK) -Wall $(CPPFLAGS) -c $(CFLAGS) $< -o $@

$(DESTDIR)$(TARGET): $(OBJECTS)
	$(SYSCONF_LINK) -Wall $(LDFLAGS) -o $@ $^ $(LIBS)


clean:
	-rm -rf $(OBJDIR)
	-rm -rf $(DESTDIR)
	-rm -f *.tga

