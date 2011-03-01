#include <geanyplugin.h>
#include <gio/gio.h>

guint geany_dbus_init_server(gchar *name);
void geany_dbus_deinit_server(guint owner_id);
