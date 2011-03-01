#
# Temporary makefile for geany-dbus until I get around to using autotools
#

COMMON_FLAGS = -g -Wall
# Why is gio-unix-2.0 needed?
PKG_CFLAGS = `pkg-config --cflags geany dbus-glib-1 gio-2.0 gio-unix-2.0 gee-1.0`
PKG_LIBS = `pkg-config --libs geany dbus-glib-1 gio-2.0 gio-unix-2.0 gee-1.0`
VALA_FLAGS = --use-header --vapidir . --pkg gtk+-2.0 --pkg gio-2.0 --pkg gee-1.0 --pkg geany
GIO_WORKAROUND = --include=gio/gio.h

all: dbus-plugin.so

dbus-plugin.so: dbus-plugin.o server.o app.o iface-prefs.o project.o indent-prefs.o document.o widgets.o
	gcc -shared $(COMMON_FLAGS) $(PKG_LIBS) -o $@ $^

dbus-plugin.o: dbus-plugin.c
	gcc -fPIC $(COMMON_FLAGS) $(PKG_CFLAGS) $(GIO_WORKAROUND) -c -o $@ $^
	
server.o: server.c
	gcc -fPIC $(COMMON_FLAGS) $(PKG_CFLAGS) $(GIO_WORKAROUND) -c -o $@ $^

app.o: app.c
	gcc -fPIC $(COMMON_FLAGS) $(PKG_CFLAGS) $(GIO_WORKAROUND) -c -o $@ $^

iface-prefs.o: iface-prefs.c
	gcc -fPIC $(COMMON_FLAGS) $(PKG_CFLAGS) $(GIO_WORKAROUND) -c -o $@ $^

project.o: project.c
	gcc -fPIC $(COMMON_FLAGS) $(PKG_CFLAGS) $(GIO_WORKAROUND) -c -o $@ $^

indent-prefs.o: indent-prefs.c
	gcc -fPIC $(COMMON_FLAGS) $(PKG_CFLAGS) $(GIO_WORKAROUND) -c -o $@ $^

document.o: document.c
	gcc -fPIC $(COMMON_FLAGS) $(PKG_CFLAGS) $(GIO_WORKAROUND) -c -o $@ $^

widgets.o: widgets.c
	gcc -fPIC $(COMMON_FLAGS) $(PKG_CFLAGS) $(GIO_WORKAROUND) -c -o $@ $^

dbus-plugin.c: dbus-plugin.vala server.vala app.vala iface-prefs.vala project.vala widgets.vala
	valac -cCH dbus-plugin.h $(VALA_FLAGS) \
	dbus-plugin.vala server.vala app.vala iface-prefs.vala project.vala \
	indent-prefs.vala document.vala widgets.vala
	
install:
	install -m 0644 dbus-plugin.so ~/.config/geany/plugins

uninstall:
	rm -f ~/.config/geany/plugins/dbus-plugin.so

clean:
	rm -f *.so *.o *.c dbus-plugin.h
