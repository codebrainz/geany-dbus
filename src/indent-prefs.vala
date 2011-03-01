using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	/* Provides an interface to IndentPrefs structure */
		
	[DBus(name="org.geany.DBus.IndentPrefs")]
	public class IndentPrefs: GLib.Object
	{
		private unowned Geany.IndentPrefs? prefs;
		
		public IndentPrefs(Geany.IndentPrefs? prefs) {
			this.prefs = prefs;
		}
		
		public int get_width() {
			return_val_if_fail(prefs != null, -1);
			return prefs.width;
		}
		public void set_width(int val) {
			return_if_fail(prefs != null);
			prefs.width = val;
		}
		public IndentType get_indent_type() {
			return prefs.type;
		}
		public void set_indent_type(IndentType val) {
			return_if_fail(prefs != null);
			prefs.type = val;
		}
		public int get_hard_tab_width() {
			return_val_if_fail(prefs != null, -1);
			return prefs.hard_tab_width;
		}
		public void set_hard_tab_width(int val) {
			return_if_fail(prefs != null);
			prefs.hard_tab_width = val;
		}
		public AutoIndent get_auto_indent_mode() {
			return prefs.auto_indent_mode;
		}
		public void set_auto_indent_mode(AutoIndent val) {
			return_if_fail(prefs != null);
			prefs.auto_indent_mode = val;
		}
		public bool get_detect_type() {
			return_val_if_fail(prefs != null, false);
			return prefs.detect_type;
		}
		public void set_detect_type(bool val) {
			return_if_fail(prefs != null);
			prefs.detect_type = val;
		}
	}
}
