using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	/* Provides an interface to GeanyProject structure */
		
	[DBus(name="org.geany.DBus.Widgets")]
	public class Widgets: GLib.Object
	{
		private unowned Geany.MainWidgets widgets;
		
		public Widgets(Geany.MainWidgets widgets) {
			this.widgets = widgets;
		}
	}
}
