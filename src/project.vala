/*
 * project.vala - Geany project interface for DBus plugin
 * 
 * Copyright 2011 Matthew Brush <mbrush@leftclick.ca>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 */

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
		
