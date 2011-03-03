using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
	/* Provides an interface to GeanyProject structure */
		
	[DBus(name="org.geany.DBus.Interfaces.Project")]
	public class Project: GLib.Object
	{
		private unowned Geany.Project proj;
		
		public Project(Geany.Project proj) {
			this.proj = proj;
		}

		public unowned string name {
			get { return proj.name; }
			set { proj.name = value; }
		}
		
		public unowned string description {
			get { return proj.description; }
			set { proj.description = value; }
		}
		
		public unowned string file_name {
			get { return proj.file_name; }
			set { proj.file_name = value; }
		}
		public unowned string base_path {
			get { return proj.base_path; }
			set { proj.base_path = value; }
		}
		
		public int project_type {
			get { return proj.type; }
			set { proj.type = value; }
		}
	}
}
		
