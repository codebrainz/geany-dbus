using GLib;
using Gee;
using Gtk;
using Geany;

/*
 * reminder to me:
 * G_DBUS_DEBUG=message ./your-program
 */

namespace GeanyDBus
{
	
	public class Server : GLib.Object {

		[CCode(cname="GEANY_DBUS_NAME")]
		public static const string bus_name = "org.geany.DBus";
		private unowned DBusConnection conn;
		
		private unowned Geany.Plugin plugin;
		private unowned Geany.Data data;
		private unowned Geany.Functions functions;
	
		public GeanyDBus.Application application { get; set; }
		public GeanyDBus.InterfacePrefs interface_prefs { get; set; }
		public GeanyDBus.Project project { get; set; }

		private uint bus_id = 0;
		private uint[] registered_objects;
		private Gee.ArrayList<GeanyDBus.Document> registered_documents;

		public Server (Geany.Plugin		plugin, 
					   Geany.Data 		data, 
					   Geany.Functions 	functions)
		{										 
			/* from Geany Plugin API */
			this.plugin = plugin;
			this.data = data;
			this.functions = functions;
			
			/* Plugin API wrappers */
			application = new GeanyDBus.Application (data.app);
			interface_prefs = new GeanyDBus.InterfacePrefs (data.interface_prefs);
			project = new GeanyDBus.Project (data.app.project);
			
			registered_objects = new uint[] {};
			registered_documents = new Gee.ArrayList<GeanyDBus.Document> ();

			bus_id = Bus.own_name (BusType.SESSION, bus_name, 
								   BusNameOwnerFlags.NONE, 
								   on_bus_acquired, 
								   on_bus_name_acquired, 
								   on_bus_name_lost);

			this.plugin.signal_connect (null, 
										"document-new", 
										true,
										(GLib.Callback)on_document_open_new,
										this);
										
			this.plugin.signal_connect (null, 
										"document-open", 
										true,
										(GLib.Callback)on_document_open_new,
										this);
										 
			this.plugin.signal_connect (null, 
										"document-close", 
										true,
										(GLib.Callback)on_document_close,
										this);
			
			this.plugin.signal_connect (null,
										"document-save",
										true,
										(GLib.Callback)on_document_save,
										this);
			
			this.plugin.signal_connect (null,
										"document-before-save",
										true,
										(GLib.Callback)on_document_before_save,
										this);
										
		}
		
		/* should be a destructor, but '~Server()' never gets called? */
		public void close ()
		{
			for (int i=0; i < registered_objects.length; i++) {
				if (!conn.unregister_object(registered_objects[i]))
					warning ("Failed to unregister object id %d", 
						     (int)registered_objects[i]);
			}
			registered_objects = new uint[] {};
			Bus.unown_name (bus_id);
			conn.close_sync ();
			Ui.set_statusbar (true, "DBus server stopped.");
		}
		
		/* DBus was acquired, register plugin objects 
		 * Probably after the first Geany document, which is kinda a bummer */
		void on_bus_acquired (DBusConnection conn)
		{
			this.conn = conn;
			try	{
				registered_objects += conn.register_object (
											"/org/geany/DBus/Application",
											this.application);	
				registered_objects += conn.register_object (
											"/org/geany/DBus/Project", 
											this.project);
				registered_objects += conn.register_object (
											"/org/geany/DBus/UI/Preferences", 
											this.interface_prefs);
			}
			catch (IOError e) {
				warning ("Could not register services: %s", e.message);
			}
		}
		
		void on_bus_name_acquired (DBusConnection conn, string name)
		{
			Geany.Ui.set_statusbar (true, 
									"DBus server started with bus name '%s'.",
									name);
		}
		
		/* should only get called if unable to own_name, since name is owned
		 * without allowing replacement */
		void on_bus_name_lost (DBusConnection conn, string name)
		{
			Geany.Ui.set_statusbar (true, 
									"DBus server started with bus name '%s'.",
									conn.unique_name);
		}

		/* register a new document */
		[CCode (instance_pos = -1)]
		public void on_document_open_new (GLib.Object object, Geany.Document doc)
		{
			GeanyDBus.Document dbus_doc = new GeanyDBus.Document (doc);

			try {
				string obj_path;
				obj_path = "/org/geany/DBus/Documents/%d".printf (doc.index);
				dbus_doc.dbus_index = conn.register_object (obj_path, dbus_doc);
				if (dbus_doc.dbus_index > 0) {
					registered_documents.add(dbus_doc);
					debug("Registered document\n");
				}
				else {
					warning ("Failed to register document index %d", 
							 dbus_doc.index);
				}
			}
			catch (IOError e) {
				warning ("Error registering object with DBus: %s", e.message);
			}

		}
		
		/* remove a registered document */
		[CCode (instance_pos = -1)]
		public void on_document_close (GLib.Object object, Geany.Document doc)
		{
			for (int i=0; i < registered_documents.size; i++) {
				GeanyDBus.Document dbus_doc = registered_documents[i];
				if (dbus_doc.index == doc.index) {
					dbus_doc.before_close();
					if (conn.unregister_object (dbus_doc.dbus_index)) {
						registered_documents.remove_at(i);
						debug("Unregistered document\n");
					}
					else
						warning ("Error unregistering doc id %d", 
								 dbus_doc.index);
				}
			}
		}
		
		/* dispatch the 'save' signal on the appropriate document */
		[CCode (instance_pos = -1)]
		public void on_document_save (GLib.Object object, Geany.Document doc)
		{
			for (int i=0; i < registered_documents.size; i++) {
				GeanyDBus.Document dbus_doc = registered_documents[i];
				if (dbus_doc.index == doc.index)
					dbus_doc.saved ();
			}
		}
		
		/* dispatch the 'before-save' signal on the appropriate document */
		[CCode (instance_pos = -1)]
		public void on_document_before_save (GLib.Object object, 
											 Geany.Document doc)
		{
			for (int i=0; i < registered_documents.size; i++) {
				GeanyDBus.Document dbus_doc = registered_documents[i];
				if (dbus_doc.index == doc.index)
					dbus_doc.before_save ();
			}
		}
		
	}
	
}






























































