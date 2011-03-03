/*
 * app.vala - Geany application interface for DBus plugin
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

using Gtk;
using Geany;

namespace GeanyDBus
{
		
	[DBus(name="org.geany.DBus.Interfaces.Application")]
	public class Application: GLib.Object
	{

		private unowned Geany.App app;		
		
		public Application(Geany.App app) {
			this.app = app;
			
			geany_plugin.signal_connect (null, 
										 "build-start", 
										 true, 
										 (GLib.Callback)on_build_start,
										 this);
		}
		
		/* signals */
		public virtual signal void build_starting () {
			debug("Emitted BuildStarting signal");
		}

		/* properties */
		public bool debug_mode {
			get { return app.debug_mode; }
			set { app.debug_mode = value; }
		}
		
		public unowned string config_dir {
			get { return app.config_dir; }
			set { app.config_dir = value; }
		}
		
		public unowned string data_dir {
			get { return app.data_dir; }
			set { app.data_dir = value; }
		}
		
		public unowned string doc_dir {
			get { return app.doc_dir; }
			set { app.doc_dir = value; }
		}	
		
		/* methods */
		
		/* note: could add args for filename, read-only, initial text, etc */
		public bool new_document () {
			return (Geany.Document.new () != null) ? true : false;
		}
		
		public bool open_document (string filename) {
			return (Geany.Document.open (filename, false) != null) ? true : false;
		}
		
		/* note: could add the rest of args from Document.open_files() */
		public void open_documents (string[] filenames) {
			GLib.SList<string> fnames = new GLib.SList<string>();
			for (int i=0; i < filenames.length; i++)
				fnames.append(filenames[i]);
			Geany.Document.open_files(fnames);
		}
		
		public bool close_notebook_page (uint page_number) {
			return Geany.Document.close_notebook_page(page_number);
		}
				
		public string current_document {
			owned get {
				int current_id = Geany.Document.get_current ().index;
				return "/org/geany/DBus/Documents/%d".printf (current_id);
			}
		}
		
		/* signal forwarders */
		private void on_build_start (GLib.Object obj) {
			build_starting ();
		}
	}	

}

















