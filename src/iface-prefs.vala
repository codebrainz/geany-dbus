using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	/* Provides an interface to GeanyInterfacePrefs structure */
		
	[DBus(name="org.geany.DBus.InterfacePrefs")]
	public class InterfacePrefs: GLib.Object
	{		
		private unowned Geany.InterfacePrefs? prefs;
		
		public InterfacePrefs(Geany.InterfacePrefs? prefs) {
			this.prefs = prefs;
		}
		
		public bool get_sidebar_symbol_visible() {
			return_val_if_fail(prefs != null, false);
			return prefs.sidebar_symbol_visible;
		}
		public void set_sidebar_symbol_visible(bool val) {
			return_if_fail(prefs != null);
			prefs.sidebar_symbol_visible = val;
		}
		public bool get_sidebar_openfiles_visible() {
			return_val_if_fail(prefs != null, false);
			return prefs.sidebar_openfiles_visible;
		}
		public void set_sidebar_openfiles_visible(bool val) {
			return_if_fail(prefs != null);
			prefs.sidebar_openfiles_visible = val;
		}
		public unowned string get_editor_font() {
			return_val_if_fail(prefs != null, "");
			return prefs.editor_font;
		}
		public void set_editor_font(string val) {
			return_if_fail(prefs != null);
			prefs.editor_font = val;
		}
		public unowned string get_tagbar_font() {
			return_val_if_fail(prefs != null, "");
			return prefs.tagbar_font;
		}
		public void set_tagbar_font(string val) {
			return_if_fail(prefs != null);
			prefs.tagbar_font = val;
		}
		public unowned string get_msgwin_font() {
			return_val_if_fail(prefs != null, "");
			return prefs.msgwin_font;
		}
		public void set_msgwin_font(string val) {
			return_if_fail(prefs != null);
			prefs.msgwin_font = val;
		}
		public bool get_show_notebook_tabs() {
			return_val_if_fail(prefs != null, false);
			return prefs.show_notebook_tabs;
		}
		public void set_show_notebook_tabs(bool val) {
			return_if_fail(prefs != null);
			prefs.show_notebook_tabs = val;
		}
		public int get_tab_pos_editor() {
			return_val_if_fail(prefs != null, -1);
			return prefs.tab_pos_editor;
		}
		public void set_tab_pos_editor(int val) {
			return_if_fail(prefs != null);
			prefs.tab_pos_editor = val;
		}
		public int get_tab_pos_msgwin() {
			return_val_if_fail(prefs != null, -1);
			return prefs.tab_pos_msgwin;
		}
		public void set_tab_pos_msgwin(int val) {
			return_if_fail(prefs != null);
			prefs.tab_pos_msgwin = val;
		}
		public int get_tab_pos_sidebar() {
			return_val_if_fail(prefs != null, -1);
			return prefs.tab_pos_sidebar;
		}
		public void set_tab_pos_sidebar(int val) {
			return_if_fail(prefs != null);
			prefs.tab_pos_sidebar = val;
		}
		public bool get_statusbar_visible() {
			return_val_if_fail(prefs != null, false);
			return prefs.statusbar_visible;
		}
		public void set_statusbar_visible(bool val) {
			return_if_fail(prefs != null);
			prefs.statusbar_visible = val;
		}
		public bool get_show_symbol_list_expanders() {
			return_val_if_fail(prefs != null, false);
			return prefs.show_symbol_list_expanders;
		}
		public void set_show_symbol_list_expanders(bool val) {
			return_if_fail(prefs != null);
			prefs.show_symbol_list_expanders = val;
		}
		public bool get_notebook_double_click_hides_widgets() {
			return_val_if_fail(prefs != null, false);
			return prefs.notebook_double_click_hides_widgets;
		}
		public void set_notebook_double_click_hides_widgets(bool val) {
			return_if_fail(prefs != null);
			prefs.notebook_double_click_hides_widgets = val;
		}
		public bool get_highlighting_invert_all() {
			return_val_if_fail(prefs != null, false);
			return prefs.highlighting_invert_all;
		}
		public void set_highlighting_invert_all(bool val) {
			return_if_fail(prefs != null);
			prefs.highlighting_invert_all = val;
		}
		public int get_sidebar_pos() {
			return_val_if_fail(prefs != null, -1);
			return prefs.sidebar_pos;
		}
		public void set_sidebar_pos(int val) {
			return_if_fail(prefs != null);
			prefs.sidebar_pos = val;
		}
		public bool get_msgwin_status_visible() {
			return_val_if_fail(prefs != null, false);
			return prefs.msgwin_status_visible;
		}
		public void set_msgwin_status_visible(bool val) {
			return_if_fail(prefs != null);
			prefs.msgwin_status_visible = val;
		}
		public bool get_msgwin_compiler_visible() {
			return_val_if_fail(prefs != null, false);
			return prefs.msgwin_compiler_visible;
		}
		public void set_msgwin_compiler_visible(bool val) {
			return_if_fail(prefs != null);
			prefs.msgwin_compiler_visible = val;
		}
		public bool get_msgwin_messages_visible() {
			return_val_if_fail(prefs != null, false);
			return prefs.msgwin_messages_visible;
		}
		public void set_msgwin_messages_visible(bool val) {
			return_if_fail(prefs != null);
			prefs.msgwin_messages_visible = val;
		}
		public bool get_msgwin_scribble_visible() {
			return_val_if_fail(prefs != null, false);
			return prefs.msgwin_scribble_visible;
		}
		public void set_msgwin_scribble_visible(bool val) {
			return_if_fail(prefs != null);
			prefs.msgwin_scribble_visible = val;
		}

	}
}
