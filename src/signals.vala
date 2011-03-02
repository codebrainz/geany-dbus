using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	/* Forwards all of the Geany signals to the DBus */
		
	[DBus(name="org.geany.DBus.Signals")]
	public class Signals: GLib.Object
	{
		public virtual signal void build_starting () {
			debug("BuildStarting signal emitted");
		}
		public virtual signal void update_editor_menu () {
			debug("UpdateEditorMenu signal emitted");
		}
		
		public Signals() {
			geany_plugin.signal_connect (null, 
								   "build-start", 
								   true, 
								   (GLib.Callback)on_build_start,
								   this);
		}

		[CCode (instance_pos = -1)]
		private void on_build_start (GLib.Object obj) {
			build_starting ();
		}

		
		/* document specific */
		private void on_update_editor_menu (GLib.Object obj, string word, int pos, 
										   Geany.Document doc) {
											   
		}
		private void on_document_activate (GLib.Object obj, Geany.Document doc) {
			
		}
		private void on_document_before_save (GLib.Object obj, Geany.Document doc) {
			
		}
		private void on_document_close (GLib.Object obj, Geany.Document doc) {
			
		}
		private void on_document_filetype_set (GLib.Object obj, Geany.Document doc,
											  Geany.Filetype ft_old) {
		
		}
		private void on_document_save (GLib.Object obj, Geany.Document doc) {
			
		}
		
		/* general documents */
		private void on_document_new (GLib.Object obj, Geany.Document doc) {
			
		}
		private void on_document_open (GLib.Object obj, Geany.Document doc) {
			
		}

		/* project specific */
		private void on_project_close (GLib.Object obj) {
			
		}
		private void on_project_dialog_confirmed (GLib.Object obj, 
												 Gtk.Notebook notebook) {
													 
		}
		private void on_project_dialog_create (GLib.Object obj, 
											  Gtk.Widget notebook) {
												  
		}
		private void on_project_open (GLib.Object obj, KeyFile config) {
			
		}
		private void on_project_save (GLib.Object obj, KeyFile config) {
			
		}
		
		/* not useful/applicable for DBus clients, they should use the DBus
		 * to get notification of Geanys starting */
		//private void on_geany_startup_complete (GLib.Object obj);
			
		/* not in Vala binding, and probably too slow for DBus */
		//public bool on_editor_notify (GLib.Object obj, Geany.Editor *editor, 
		//							  Scintilla.Notification *nt);
	
	}
}
