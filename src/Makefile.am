ACLOCAL_AMFLAGS = -I m4

VALAFLAGS = --vapidir . \
				--pkg gtk+-2.0 \
				--pkg gio-2.0 \
				--pkg gee-1.0 \
				--pkg geany \
				-H dbus-plugin.h --use-header

geanypluginsdir = $(libdir)/geany
geanyplugins_LTLIBRARIES = dbus.la

dbus_la_LDFLAGS = -module -avoid-version -shared
dbus_la_CPPFLAGS = @GTK_CFLAGS@ @GIO_CFLAGS@ @GEE_CFLAGS@ @GEANY_CFLAGS@
dbus_la_LIBADD = @GTK_LIBS@ @GIO_LIBS@ @GEE_LIBS@ @GEANY_LIBS@

dbus_la_SOURCES = 	plugin.vala \
					server.vala \
					app.vala \
					document.vala \
					iface-prefs.vala \
					indent-prefs.vala \
					project.vala \
					widgets.vala
