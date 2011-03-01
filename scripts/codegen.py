#!/usr/bin/env python

import re

_DEFAULTS = {
	"bool": "false",
	"string": '""',
	"int": "-1",
}

# change these each time
PREFIX = "prefs"
CODE = """
public int			width;
public IndentType	type;
public int			hard_tab_width;
public AutoIndent	auto_indent_mode;
public bool			detect_type;
"""

lines = CODE.split("\n")

def print_getter(name, type):
	print """\t\tpublic %s get_%s() {
			return_val_if_fail(%s != null, %s);
			return %s.%s;
		}""" % (type, name, PREFIX, _DEFAULTS.get(type, type), PREFIX, name)

def print_setter(name, type):
	print """\t\tpublic void set_%s(%s val) {
			return_if_fail(%s != null);
			%s.%s = val;
		}""" % (name, type, PREFIX, PREFIX, name)

for line in lines:
	m = re.match(r"public\s+(?P<type>.+?)\s+(?P<name>.+?);", line.strip())
	if m:
		print_getter(m.group('name'), m.group('type'))
		print_setter(m.group('name'), m.group('type'))
		
