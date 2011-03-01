/*
 * plugin.vala
 * 
 * Copyright 2011 Matthew Brush <mbrush@leftclick.ca>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 */
 
using Gtk;
using Gdk;
using Geany;

public Plugin				geany_plugin;
public Data					geany_data;
public Functions			geany_functions;

private static string config_dir;
private static string config_filename;

private static GeanyDBus.Server dbus_server;

public static void plugin_set_info (Plugin.Info info) 
{
	info.set(
		"DBus Interface", 
		"Interact with Geany using the DBus.",
		"0.1",
		"Matthew Brush <mbrush@leftclick.ca>");
}

public static int plugin_version_check (int abi_version) 
{
	return Plugin.version_check (abi_version, 185);
}

public static void plugin_init (Geany.Data data)
{	
	geany_plugin.module_make_resident();
	
	config_dir = Path.build_path (Path.DIR_SEPARATOR_S, 
								  geany_data.app.configdir,
								  "plugins",
								  "dbus");
								  
	config_filename = Path.build_path (Path.DIR_SEPARATOR_S,
									   config_dir, 
									   "dbus.conf");

	dbus_server = new GeanyDBus.Server (geany_plugin, 
										geany_data, 
										geany_functions);
	
	
}

public static void plugin_cleanup ()
{
	return;
}


