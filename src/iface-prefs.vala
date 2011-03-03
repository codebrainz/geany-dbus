using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	/* Provides an interface to GeanyInterfacePrefs structure */
		
	[DBus(name="org.geany.DBus.Interfaces.InterfacePreferences")]
	public class InterfacePreferences: GLib.Object
	{		
		private unowned Geany.InterfacePrefs prefs;
		
		public InterfacePreferences(Geany.InterfacePrefs prefs) {
			this.prefs = prefs;
		}
		
		public bool sidebar_symbol_visible {
			get { return prefs.sidebar_symbol_visible; }
			set { prefs.sidebar_symbol_visible = value; }
				
		}
		public bool sidebar_openfiles_visible {
			get { return prefs.sidebar_openfiles_visible; }
			set { prefs.sidebar_openfiles_visible = value; }
		}
		public unowned string editor_font {
			get { return prefs.editor_font; }
			set { prefs.editor_font = value; }
		}
		public unowned string tagbar_font {
			get { return prefs.tagbar_font; }
			set { prefs.tagbar_font = value; }
		}
		public unowned string msgwin_font {
			get {return prefs.msgwin_font; }
			set { prefs.msgwin_font = value; }
		}
		public bool show_notebook_tabs {
			get { return prefs.show_notebook_tabs; }
			set { prefs.show_notebook_tabs = value; }
		}
		public int tab_pos_editor {
			get { return prefs.tab_pos_editor; }
			set { prefs.tab_pos_editor = value; }
		}
		public int tab_pos_msgwin {
			get { return prefs.tab_pos_msgwin; }
			set { prefs.tab_pos_msgwin = value; }
		}
		public int tab_pos_sidebar {
			get { return prefs.tab_pos_sidebar; }
			set { prefs.tab_pos_sidebar = value; }
		}
		public bool statusbar_visible {
			get { return prefs.statusbar_visible; }
			set { prefs.statusbar_visible = value; }
		}
		public bool show_symbol_list_expanders {
			get { return prefs.show_symbol_list_expanders; }
			set { prefs.show_symbol_list_expanders = value; }
		}
		public bool notebook_double_click_hides_widgets {
			get { return prefs.notebook_double_click_hides_widgets; }
			set { prefs.notebook_double_click_hides_widgets = value; }
		}
		public bool highlighting_invert_all {
			get { return prefs.highlighting_invert_all; }
			set { prefs.highlighting_invert_all = value; }
		}
		public int sidebar_pos {
			get { return prefs.sidebar_pos; }
			set { prefs.sidebar_pos = value; }
		}
		public bool msgwin_status_visible {
			get { return prefs.msgwin_status_visible; }
			set { prefs.msgwin_status_visible = value; }
		}
		public bool msgwin_compiler_visible {
			get { return prefs.msgwin_compiler_visible; }
			set { prefs.msgwin_compiler_visible = value; }
		}
		public bool msgwin_messages_visible {
			get { return prefs.msgwin_messages_visible; }
			set { prefs.msgwin_messages_visible = value; }
		}
		public bool msgwin_scribble_visible {
			get { return prefs.msgwin_scribble_visible; }
			set { prefs.msgwin_scribble_visible = value; }
		}

	}
}
