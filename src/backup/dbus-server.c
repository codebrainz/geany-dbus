#include <geanyplugin.h>
#include <gio/gio.h>

static void
on_bus_acquired (GDBusConnection	*connection, 
				 const gchar 		*name, 
				 gpointer 			user_data)
{
	/* export objects on bus */
	g_debug("Bus acquired: %s", name);
}

static void
on_name_acquired (GDBusConnection	*connection,
				  const gchar 		*name,
				  gpointer 		user_data)
{
	g_debug("Acquired name %s on the session bus", name);
}

static void
on_name_lost (GDBusConnection	*connection,
			  const gchar		*name,
			  gpointer			user_data)
{
	g_debug("Lost name %s on the session bus", name);
}



guint geany_dbus_init_server (const gchar *name)
{
	guint owner_id;
	
	owner_id = g_bus_own_name (G_BUS_TYPE_SESSION, 
							   bus_name, 
							   G_BUS_NAME_OWNER_FLAGS_REPLACE,
							   on_bus_acquired,
							   on_name_acquired,
							   on_name_lost,
							   NULL,
							   NULL);
	
	if (owner_id == 0)
		g_warning("Bus owner id is invalid (0)");
	
	return owner_id;
}

void geany_dbus_deinit_server (guint owner_id)
{
	g_bus_unown_name (owner_id);
}
