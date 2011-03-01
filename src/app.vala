using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	/* Provides an interface to GeanyApp structure */
		
	[DBus(name="org.geany.DBus.Application")]
	public class Application: GLib.Object
	{
		private unowned Geany.App? app;
		
		public Application(Geany.App? app) {
			this.app = app;
		}
		
		public bool get_debug_mode() {
			return_val_if_fail(app != null, false);
			return app.debug_mode;
		}
		public void set_debug_mode(bool val) {
			return_if_fail(app != null);
			app.debug_mode = val;
		}
		public unowned string get_configdir() {
			return_val_if_fail(app != null, "");
			return app.configdir;
		}
		public void set_configdir(string val) {
			return_if_fail(app != null);
			app.configdir = val;
		}
		public unowned string get_datadir() {
			return_val_if_fail(app != null, "");
			return app.datadir;
		}
		public void set_datadir(string val) {
			return_if_fail(app != null);
			app.datadir = val;
		}
		public unowned string get_docdir() {
			return_val_if_fail(app != null, "");
			return app.docdir;
		}
		public void set_docdir(string val) {
			return_if_fail(app != null);
			app.docdir = val;
		}	
	}	

}
