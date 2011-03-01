using GLib;
using Gtk;
using Geany;

namespace GeanyDBus
{
/*
		public bool						valid;
		public int						idx;
		public bool						has_tags;
		public string					file_name;
		public string					encoding;
		public bool						has_bom;
		public Editor					editor;
		public Filetype					file_type;
		public TagManager.WorkObject	tm_file;
		public bool						readonly;
		public bool						changed;
		public string					real_path;
		
		[CCode (cname = "DOC_FILENAME")]
		public unowned string get_filename ();
		[CCode (cname = "DOC_VALID")]
		public bool is_valid ();
		
		public static unowned Document	new_file (string? utf8_filename = null, Filetype? ft = null, string? text = null);
		public static unowned Document?	get_current ();
		public static unowned Document?	get_from_page (uint page_num);
		public static unowned Document?	find_by_filename (string utf8_filename);
		public static unowned Document?	find_by_real_path (string realname);
		public bool						save_file (bool force);
		public static unowned Document	open_file (string locale_filename, bool readonly,
												   Filetype ft, string forced_enc);
		public static void				open_files (GLib.SList filenames, bool readonly,
													Filetype ft, string forced_enc);
		public static bool				remove_page (uint page_num);
		public bool						reload_file (string forced_enc);
		public void						set_encoding (string new_encoding);
		public void						set_text_changed (bool changed);
		public void						set_filetype (Filetype type);
		public bool						close ();
		public static unowned Document?	index (int idx);
		public bool						save_file_as (string utf8_fname);
		public void						rename_file (string new_filename);
		public Gdk.Color				get_status_color ();
		public string					get_basename_for_display (int length);
		public int						get_notebook_page ();
*/
	[DBus(name="org.geany.DBus.Document")]
	public class Document : GLib.Object {
		
		public signal void activate();
		public signal void before_close();
		public signal void before_save();
		public signal void save();
		public signal void filetype_set();
		
		
		public uint dbus_index { get; set; }
		
		public bool is_valid { 
			get { return doc.is_valid(); }
		}

		public int index {
			get { return doc.index; }
		}

		public unowned string file_name {
			get { return doc.get_filename(); }
		}
		
		private unowned Geany.Document doc;
		
		public Document(Geany.Document doc) {
			this.doc = doc;
		}
		
		public unowned string text {
			set {
				doc.editor.sci.set_text(value);
			}
		}
		
		public uint text_length {
			get {
				return doc.editor.sci.get_length();
			}
		}
		
	}

}
