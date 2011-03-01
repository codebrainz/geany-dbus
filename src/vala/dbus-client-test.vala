[DBus(name="org.geany.InterfacePrefs")]
interface InterfacePrefs : Object 
{
	public abstract string get_editor_font() throws IOError;
}


void main() {
	try
	{
		InterfacePrefs prefs = Bus.get_proxy_sync(BusType.SESSION,
			"org.geany.InterfacePrefs", "/org/geany");
		
		string fnt = prefs.get_editor_font();
		stdout.printf("Got font name: %s\n", fnt);
		
	}
	catch (IOError e) {
		stderr.printf("%s\n", e.message);
	}
}
