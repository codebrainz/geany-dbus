
import dbus
from xml.etree import ElementTree

GEANY_DBUS_NAME = "org.geany.DBus"

bus = dbus.SessionBus()

class PropertyDescriptor(object):
	
	def __init__(self, prop_name, remote_object, main_interface):
		self.prop_name = prop_name
		self.remote_object = remote_object
		self.main_interface = main_interface
		
		self.prop_iface = dbus.Interface(self.remote_object,
							dbus_interface="org.freedesktop.DBus.Properties")
		self._getter = self.prop_iface.get_dbus_method("Get")
		self._setter = self.prop_iface.get_dbus_method("Set")
	
	def __get__(self, obj, objtype):
		print "get called"
		return self._getter(self.main_interface, self.prop_name)
		
	def __set__(self, obj, value):
		print "set called"
		self._setter(self.main_interface, self.prop_name, value)
	
	def __str__(self):
		return "printing"

class Document(object):
	main_interface = "org.geany.DBus.Document"
	def __init__(self, object_path):
		
		self.object_path = object_path
		self._remote_object = bus.get_object(GEANY_DBUS_NAME, object_path)
		
		iface = dbus.Interface(self._remote_object,
					dbus_interface="org.freedesktop.DBus.Introspectable")
		
		self.introspection_data = iface.Introspect()
		
		self.prop_iface = dbus.Interface(self._remote_object,
							dbus_interface="org.freedesktop.DBus.Properties")
		self._getter = self.prop_iface.get_dbus_method("Get")
		self._setter = self.prop_iface.get_dbus_method("Set")
		
		self._create_properties()
	
	def _create_properties(self):
		root = ElementTree.XML(self.introspection_data)
		self._properties = []
		for iface in root.findall("interface"):
			if iface.get("name", "") == self.main_interface:
				for prop in iface.findall("property"):
					prop_name = prop.get("name", None)
					prop_type = prop.get("type", None)
					prop_access = prop.get("access", None)
					self._properties.append( (prop_name, prop_type, prop_access) )
					setattr(self, prop_name, PropertyDescriptor(
						prop_name, self._remote_object, self.main_interface))

	def __getattr__(self, name):
		print "Tried to access %s" % name
		return "foo"
		self._getter(self.main_interface,
		
d = Document("/org/geany/DBus/Documents/0")

print d.FileName
