#include <geanyplugin.h>
#include "dbus-plugin.h"


GeanyPlugin     *geany_plugin;
GeanyData       *geany_data;
GeanyFunctions  *geany_functions;

static gchar *config_filename;
static GeanyDBusServer *dbus_server;

PLUGIN_VERSION_CHECK(202)

PLUGIN_SET_INFO("DBus IPC", "Communicate with Geany using the DBus.",
                "1.0", "Matthew Brush <mbrush@leftclick.ca>");

void plugin_init(GeanyData *data)
{
	plugin_module_make_resident(geany_plugin);
	
	config_filename = g_build_path(G_DIR_SEPARATOR_S, data->app->configdir,
									"plugins", "dbus", "dbus.conf", NULL);
									
	dbus_server = geany_dbus_server_new(geany_plugin, geany_data, geany_functions);
	
	/* should be inside server.vala */
	plugin_signal_connect (geany_plugin, NULL, "document-new", TRUE,
		G_CALLBACK(geany_dbus_server_on_document_open_new), NULL);
	plugin_signal_connect (geany_plugin, NULL, "document-open", TRUE,
		G_CALLBACK(geany_dbus_server_on_document_open_new), NULL);
	plugin_signal_connect (geany_plugin, NULL, "document-close", TRUE,
		G_CALLBACK(geany_dbus_server_on_document_open_new), NULL);
}

void plugin_cleanup(void)
{	
	return;
}
