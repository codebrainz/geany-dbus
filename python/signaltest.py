#!/usr/bin/env python

import dbus
from dbus.mainloop.glib import DBusGMainLoop
import gobject
gobject.threads_init()

def build_starting_handler(sender=None):
	print "Build started signal received"

DBusGMainLoop(set_as_default=True)

bus = dbus.SessionBus()

sig_obj = bus.get_object("org.geany.DBus", "/org/geany/DBus/Signals")

sig_iface = dbus.Interface(sig_obj, dbus_interface="org.geany.DBus.Signals")

sig_iface.connect_to_signal("BuildStarting", build_starting_handler, sender_keyword="sender")

loop = gobject.MainLoop()
loop.run()
