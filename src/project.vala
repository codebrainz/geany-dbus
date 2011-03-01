using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	/* Provides an interface to GeanyProject structure */
		
	[DBus(name="org.geany.DBus.Project")]
	public class Project: GLib.Object
	{
		private unowned Geany.Project? proj;
		
		public Project(Geany.Project? proj) {
			this.proj = proj;
		}

		public unowned string get_name() {
			return_val_if_fail(proj != null, "");
			return proj.name;
		}
		public void set_name(string val) {
			return_if_fail(proj != null);
			proj.name = val;
		}
		public unowned string get_description() {
			return_val_if_fail(proj != null, "");
			return proj.description;
		}
		public void set_description(string val) {
			return_if_fail(proj != null);
			proj.description = val;
		}
		public unowned string get_file_name() {
			return_val_if_fail(proj != null, "");
			return proj.file_name;
		}
		public void set_file_name(string val) {
			return_if_fail(proj != null);
			proj.file_name = val;
		}
		public unowned string get_base_path() {
			return_val_if_fail(proj != null, "");
			return proj.base_path;
		}
		public void set_base_path(string val) {
			return_if_fail(proj != null);
			proj.base_path = val;
		}
		public int get_project_type() {
			return_val_if_fail(proj != null, -1);
			return proj.type;
		}
		public void set_project_type(int val) {
			return_if_fail(proj != null);
			proj.type = val;
		}
	}
}
		
