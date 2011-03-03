/*
 * document.vala - Geany document interface for DBus plugin
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
 
 /* todo: use { owned get {} } in properties */
 
using Gtk;
using Geany;

namespace GeanyDBus
{

	[DBus(name="org.geany.DBus.Interfaces.Document")]
	public class Document : GLib.Object {
		
		private unowned Geany.Document doc;	
			
		public Document(Geany.Document doc) {
			this.doc = doc;
		}
		
		/* signals */
		public signal void shown ();
		public signal void before_close ();
		public signal void before_save ();
		public signal void saved ();
		public signal void file_type_set ();
		public signal void update_editor_menu ();		
		
		/* properties */
		internal uint dbus_index { get; set; }
		
		public bool has_changed {
			get { return doc.has_changed; }
			set { doc.has_changed = value; }
		}
		
		public unowned string encoding {
			get { return doc.encoding; }
			set { doc.encoding = value; }
		}		
		
		public unowned string file_name {
			get { return doc.safe_file_name; }
		}

		/* todo: anything else from Geany.Filetype that might be needed */
		public unowned string file_type {
			get { return doc.file_type.title; }
		}
		
		public bool has_bom { get { return doc.has_bom; } }
		
		public bool has_tags { get { return doc.has_tags; } }		
		
		public int index {
			get { return doc.index; }
		}
		
		public bool is_valid { 
			get { return doc.is_valid; }
		}
		
		public bool is_read_only {
			get { return doc.is_read_only; }
		}
		
		public unowned string real_path { 
			get { 
				if (doc.real_path != null)
					return doc.real_path;
				else
					return "";
			} 
		}
		
		public int notebook_page { get { return doc.notebook_page; } }
		
		public string status_color {
			owned get {
				if (doc.status_color != null) {
					/* todo: check this */
					uchar r = (uchar)(doc.status_color.red / 256);
					uchar g = (uchar)(doc.status_color.green / 256);
					uchar b = (uchar)(doc.status_color.blue / 256);
					return "#%02X%02X%02X".printf(r,g,b);
				}
				else
					return "";
			}
		}
		
		/* todo: tm_file */
		
		/* note: DBus won't accept default arguments apparently, so 
		 * default is used.  Could add length argument to this.*/
		public string get_display_name () {
			return doc.get_display_basename(-1);
		}
		
		/* open_files() is at GeanyDBus.Application.open_documents() */
		
		public bool reload () {
			return doc.reload (null);
		}
		
		/* use save_as() instead */
		//public void rename (string new_filename) {
		//	return doc.rename (new_filename);
		//}
		
		public bool save () {
			return doc.save (false);
		}
		
		public bool save_as (string new_filename) {
			return save_as (new_filename);
		}
		
		public bool close () {
			return doc.close();
		}
		
	}

}



















