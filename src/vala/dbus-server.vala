using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	
	unowned Geany.Plugin plugin;
	unowned Geany.Data data;
	unowned Geany.Functions functions;
	
	[DBus(name="org.geany.Application")]
	public class Application: GLib.Object
	{
		private unowned Geany.Application? app;
		
		public Application(Geany.Application? app) {
			this.app = app;
		}
		
		public bool get_debug_mode() {
			return_val_if_fail(app != null, false);
			return app.debug_mode;
		}
		public void set_debug_mode(bool val) {
			return_if_fail(app != null);
			data.app.debug_mode = val;
		}
		public unowned string get_configdir() {
			return_val_if_fail(data.app != null, "");
			return data.app.configdir;
		}
		public void set_configdir(string val) {
			return_if_fail(data.app != null);
			data.app.configdir = val;
		}
		public unowned string get_datadir() {
			return_val_if_fail(data.app != null, "");
			return data.app.datadir;
		}
		public void set_datadir(string val) {
			return_if_fail(data.app != null);
			data.app.datadir = val;
		}
		public unowned string get_docdir() {
			return_val_if_fail(data.app != null, "");
			return data.app.docdir;
		}
		public void set_docdir(string val) {
			return_if_fail(data.app != null);
			data.app.docdir = val;
		}	
	}	
	
	[DBus(name="org.geany.Application.InterfacePrefs")]
	public class InterfacePrefs: GLib.Object
	{		
		public bool get_sidebar_symbol_visible() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.sidebar_symbol_visible;
		}
		public void set_sidebar_symbol_visible(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.sidebar_symbol_visible = val;
		}
		public bool get_sidebar_openfiles_visible() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.sidebar_openfiles_visible;
		}
		public void set_sidebar_openfiles_visible(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.sidebar_openfiles_visible = val;
		}
		public unowned string get_editor_font() {
			return_val_if_fail(data.interface_prefs != null, "");
			return data.interface_prefs.editor_font;
		}
		public void set_editor_font(string val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.editor_font = val;
		}
		public unowned string get_tagbar_font() {
			return_val_if_fail(data.interface_prefs != null, "");
			return data.interface_prefs.tagbar_font;
		}
		public void set_tagbar_font(string val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.tagbar_font = val;
		}
		public unowned string get_msgwin_font() {
			return_val_if_fail(data.interface_prefs != null, "");
			return data.interface_prefs.msgwin_font;
		}
		public void set_msgwin_font(string val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.msgwin_font = val;
		}
		public bool get_show_notebook_tabs() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.show_notebook_tabs;
		}
		public void set_show_notebook_tabs(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.show_notebook_tabs = val;
		}
		public int get_tab_pos_editor() {
			return_val_if_fail(data.interface_prefs != null, -1);
			return data.interface_prefs.tab_pos_editor;
		}
		public void set_tab_pos_editor(int val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.tab_pos_editor = val;
		}
		public int get_tab_pos_msgwin() {
			return_val_if_fail(data.interface_prefs != null, -1);
			return data.interface_prefs.tab_pos_msgwin;
		}
		public void set_tab_pos_msgwin(int val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.tab_pos_msgwin = val;
		}
		public int get_tab_pos_sidebar() {
			return_val_if_fail(data.interface_prefs != null, -1);
			return data.interface_prefs.tab_pos_sidebar;
		}
		public void set_tab_pos_sidebar(int val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.tab_pos_sidebar = val;
		}
		public bool get_statusbar_visible() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.statusbar_visible;
		}
		public void set_statusbar_visible(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.statusbar_visible = val;
		}
		public bool get_show_symbol_list_expanders() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.show_symbol_list_expanders;
		}
		public void set_show_symbol_list_expanders(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.show_symbol_list_expanders = val;
		}
		public bool get_notebook_double_click_hides_widgets() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.notebook_double_click_hides_widgets;
		}
		public void set_notebook_double_click_hides_widgets(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.notebook_double_click_hides_widgets = val;
		}
		public bool get_highlighting_invert_all() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.highlighting_invert_all;
		}
		public void set_highlighting_invert_all(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.highlighting_invert_all = val;
		}
		public int get_sidebar_pos() {
			return_val_if_fail(data.interface_prefs != null, -1);
			return data.interface_prefs.sidebar_pos;
		}
		public void set_sidebar_pos(int val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.sidebar_pos = val;
		}
		public bool get_msgwin_status_visible() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.msgwin_status_visible;
		}
		public void set_msgwin_status_visible(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.msgwin_status_visible = val;
		}
		public bool get_msgwin_compiler_visible() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.msgwin_compiler_visible;
		}
		public void set_msgwin_compiler_visible(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.msgwin_compiler_visible = val;
		}
		public bool get_msgwin_messages_visible() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.msgwin_messages_visible;
		}
		public void set_msgwin_messages_visible(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.msgwin_messages_visible = val;
		}
		public bool get_msgwin_scribble_visible() {
			return_val_if_fail(data.interface_prefs != null, false);
			return data.interface_prefs.msgwin_scribble_visible;
		}
		public void set_msgwin_scribble_visible(bool val) {
			return_if_fail(data.interface_prefs != null);
			data.interface_prefs.msgwin_scribble_visible = val;
		}

	}
	
	[DBus(name="org.geany.Application.Project")]
	public class Project: GLib.Object
	{
		public unowned string get_name() {
			return_val_if_fail(data.app.project != null, "");
			return data.app.project.name;
		}
		public void set_name(string val) {
			return_if_fail(data.app.project != null);
			data.app.project.name = val;
		}
		public unowned string get_description() {
			return_val_if_fail(data.app.project != null, "");
			return data.app.project.description;
		}
		public void set_description(string val) {
			return_if_fail(data.app.project != null);
			data.app.project.description = val;
		}
		public unowned string get_file_name() {
			return_val_if_fail(data.app.project != null, "");
			return data.app.project.file_name;
		}
		public void set_file_name(string val) {
			return_if_fail(data.app.project != null);
			data.app.project.file_name = val;
		}
		public unowned string get_base_path() {
			return_val_if_fail(data.app.project != null, "");
			return data.app.project.base_path;
		}
		public void set_base_path(string val) {
			return_if_fail(data.app.project != null);
			data.app.project.base_path = val;
		}
		public int get_project_type() {
			return_val_if_fail(data.app.project != null, -1);
			return data.app.project.type;
		}
		public void set_project_type(int val) {
			return_if_fail(data.app.project != null);
			data.app.project.type = val;
		}

	}
	
	[DBus(name="org.geany.Documents")]
	public class Documents: GLib.Object
	{
		public bool get_documents() { return false; }
	}
	
	void on_bus_aquired(DBusConnection conn)
	{
		try
		{
			conn.register_object("/org/geany", new GeanyDBus.Application());
			conn.register_object("/org/geany", new GeanyDBus.InterfacePrefs());
			conn.register_object("/org/geany", new GeanyDBus.Project());
			conn.register_object("/org/geany", new GeanyDBus.Documents());
		}
		catch (IOError e)
		{
			stderr.printf("Could not register services\n");
		}
	}
	
	public void init_server(Geany.Plugin plugin, Geany.Data data, Geany.Functions funcs)
	{
		GeanyDBus.plugin = plugin;
		GeanyDBus.data = data;
		GeanyDBus.functions = funcs;
		
		Bus.own_name(BusType.SESSION, "org.geany", 
			BusNameOwnerFlags.NONE, on_bus_aquired, () => {}, 
			() => stderr.printf("Could not aquire name\n"));
	}
}
