/* indent-prefs.c generated by valac 0.10.0, the Vala compiler
 * generated from indent-prefs.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include "dbus-plugin.h"
#include <geanyplugin.h>
#include <gio/gio.h>


struct _GeanyDBusIndentPrefsPrivate {
	GeanyIndentPrefs* prefs;
};


static gpointer geany_dbus_indent_prefs_parent_class = NULL;

#define GEANY_DBUS_INDENT_PREFS_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), GEANY_DBUS_TYPE_INDENT_PREFS, GeanyDBusIndentPrefsPrivate))
enum  {
	GEANY_DBUS_INDENT_PREFS_DUMMY_PROPERTY
};
static void geany_dbus_indent_prefs_finalize (GObject* obj);
static void geany_dbus_indent_prefs_dbus_interface_method_call (GDBusConnection* connection, const gchar* sender, const gchar* object_path, const gchar* interface_name, const gchar* method_name, GVariant* parameters, GDBusMethodInvocation* invocation, gpointer user_data);
static void _dbus_geany_dbus_indent_prefs_get_width (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_set_width (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_get_indent_type (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_set_indent_type (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_get_hard_tab_width (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_set_hard_tab_width (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_get_auto_indent_mode (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_set_auto_indent_mode (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_get_detect_type (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static void _dbus_geany_dbus_indent_prefs_set_detect_type (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation);
static GVariant* geany_dbus_indent_prefs_dbus_interface_get_property (GDBusConnection* connection, const gchar* sender, const gchar* object_path, const gchar* interface_name, const gchar* property_name, GError** error, gpointer user_data);
static gboolean geany_dbus_indent_prefs_dbus_interface_set_property (GDBusConnection* connection, const gchar* sender, const gchar* object_path, const gchar* interface_name, const gchar* property_name, GVariant* value, GError** error, gpointer user_data);
static void _geany_dbus_indent_prefs_unregister_object (gpointer user_data);

static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_get_width_result = {-1, "result", "i"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_width_in[] = {NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_width_out[] = {&_geany_dbus_indent_prefs_dbus_arg_info_get_width_result, NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_get_width = {-1, "GetWidth", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_width_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_width_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_set_width_val = {-1, "val", "i"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_width_in[] = {&_geany_dbus_indent_prefs_dbus_arg_info_set_width_val, NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_width_out[] = {NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_set_width = {-1, "SetWidth", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_width_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_width_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_get_indent_type_result = {-1, "result", "i"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_indent_type_in[] = {NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_indent_type_out[] = {&_geany_dbus_indent_prefs_dbus_arg_info_get_indent_type_result, NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_get_indent_type = {-1, "GetIndentType", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_indent_type_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_indent_type_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_set_indent_type_val = {-1, "val", "i"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_indent_type_in[] = {&_geany_dbus_indent_prefs_dbus_arg_info_set_indent_type_val, NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_indent_type_out[] = {NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_set_indent_type = {-1, "SetIndentType", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_indent_type_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_indent_type_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_get_hard_tab_width_result = {-1, "result", "i"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_hard_tab_width_in[] = {NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_hard_tab_width_out[] = {&_geany_dbus_indent_prefs_dbus_arg_info_get_hard_tab_width_result, NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_get_hard_tab_width = {-1, "GetHardTabWidth", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_hard_tab_width_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_hard_tab_width_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_set_hard_tab_width_val = {-1, "val", "i"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_hard_tab_width_in[] = {&_geany_dbus_indent_prefs_dbus_arg_info_set_hard_tab_width_val, NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_hard_tab_width_out[] = {NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_set_hard_tab_width = {-1, "SetHardTabWidth", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_hard_tab_width_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_hard_tab_width_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_get_auto_indent_mode_result = {-1, "result", "i"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_auto_indent_mode_in[] = {NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_auto_indent_mode_out[] = {&_geany_dbus_indent_prefs_dbus_arg_info_get_auto_indent_mode_result, NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_get_auto_indent_mode = {-1, "GetAutoIndentMode", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_auto_indent_mode_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_auto_indent_mode_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_set_auto_indent_mode_val = {-1, "val", "i"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_auto_indent_mode_in[] = {&_geany_dbus_indent_prefs_dbus_arg_info_set_auto_indent_mode_val, NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_auto_indent_mode_out[] = {NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_set_auto_indent_mode = {-1, "SetAutoIndentMode", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_auto_indent_mode_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_auto_indent_mode_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_get_detect_type_result = {-1, "result", "b"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_detect_type_in[] = {NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_get_detect_type_out[] = {&_geany_dbus_indent_prefs_dbus_arg_info_get_detect_type_result, NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_get_detect_type = {-1, "GetDetectType", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_detect_type_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_get_detect_type_out)};
static const GDBusArgInfo _geany_dbus_indent_prefs_dbus_arg_info_set_detect_type_val = {-1, "val", "b"};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_detect_type_in[] = {&_geany_dbus_indent_prefs_dbus_arg_info_set_detect_type_val, NULL};
static const GDBusArgInfo * const _geany_dbus_indent_prefs_dbus_arg_info_set_detect_type_out[] = {NULL};
static const GDBusMethodInfo _geany_dbus_indent_prefs_dbus_method_info_set_detect_type = {-1, "SetDetectType", (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_detect_type_in), (GDBusArgInfo **) (&_geany_dbus_indent_prefs_dbus_arg_info_set_detect_type_out)};
static const GDBusMethodInfo * const _geany_dbus_indent_prefs_dbus_method_info[] = {&_geany_dbus_indent_prefs_dbus_method_info_get_width, &_geany_dbus_indent_prefs_dbus_method_info_set_width, &_geany_dbus_indent_prefs_dbus_method_info_get_indent_type, &_geany_dbus_indent_prefs_dbus_method_info_set_indent_type, &_geany_dbus_indent_prefs_dbus_method_info_get_hard_tab_width, &_geany_dbus_indent_prefs_dbus_method_info_set_hard_tab_width, &_geany_dbus_indent_prefs_dbus_method_info_get_auto_indent_mode, &_geany_dbus_indent_prefs_dbus_method_info_set_auto_indent_mode, &_geany_dbus_indent_prefs_dbus_method_info_get_detect_type, &_geany_dbus_indent_prefs_dbus_method_info_set_detect_type, NULL};
static const GDBusSignalInfo * const _geany_dbus_indent_prefs_dbus_signal_info[] = {NULL};
static const GDBusPropertyInfo * const _geany_dbus_indent_prefs_dbus_property_info[] = {NULL};
static const GDBusInterfaceInfo _geany_dbus_indent_prefs_dbus_interface_info = {-1, "org.geany.DBus.IndentPrefs", (GDBusMethodInfo **) (&_geany_dbus_indent_prefs_dbus_method_info), (GDBusSignalInfo **) (&_geany_dbus_indent_prefs_dbus_signal_info), (GDBusPropertyInfo **) (&_geany_dbus_indent_prefs_dbus_property_info)};
static const GDBusInterfaceVTable _geany_dbus_indent_prefs_dbus_interface_vtable = {geany_dbus_indent_prefs_dbus_interface_method_call, geany_dbus_indent_prefs_dbus_interface_get_property, geany_dbus_indent_prefs_dbus_interface_set_property};


GeanyDBusIndentPrefs* geany_dbus_indent_prefs_construct (GType object_type, GeanyIndentPrefs* prefs) {
	GeanyDBusIndentPrefs * self;
	self = (GeanyDBusIndentPrefs*) g_object_new (object_type, NULL);
	self->priv->prefs = prefs;
	return self;
}


GeanyDBusIndentPrefs* geany_dbus_indent_prefs_new (GeanyIndentPrefs* prefs) {
	return geany_dbus_indent_prefs_construct (GEANY_DBUS_TYPE_INDENT_PREFS, prefs);
}


gint geany_dbus_indent_prefs_get_width (GeanyDBusIndentPrefs* self) {
	gint result = 0;
	g_return_val_if_fail (self != NULL, 0);
	g_return_val_if_fail (self->priv->prefs != NULL, -1);
	result = (*self->priv->prefs).width;
	return result;
}


void geany_dbus_indent_prefs_set_width (GeanyDBusIndentPrefs* self, gint val) {
	g_return_if_fail (self != NULL);
	g_return_if_fail (self->priv->prefs != NULL);
	(*self->priv->prefs).width = val;
}


GeanyIndentType geany_dbus_indent_prefs_get_indent_type (GeanyDBusIndentPrefs* self) {
	GeanyIndentType result = 0;
	g_return_val_if_fail (self != NULL, 0);
	result = (*self->priv->prefs).type;
	return result;
}


void geany_dbus_indent_prefs_set_indent_type (GeanyDBusIndentPrefs* self, GeanyIndentType val) {
	g_return_if_fail (self != NULL);
	g_return_if_fail (self->priv->prefs != NULL);
	(*self->priv->prefs).type = val;
}


gint geany_dbus_indent_prefs_get_hard_tab_width (GeanyDBusIndentPrefs* self) {
	gint result = 0;
	g_return_val_if_fail (self != NULL, 0);
	g_return_val_if_fail (self->priv->prefs != NULL, -1);
	result = (*self->priv->prefs).hard_tab_width;
	return result;
}


void geany_dbus_indent_prefs_set_hard_tab_width (GeanyDBusIndentPrefs* self, gint val) {
	g_return_if_fail (self != NULL);
	g_return_if_fail (self->priv->prefs != NULL);
	(*self->priv->prefs).hard_tab_width = val;
}


GeanyAutoIndent geany_dbus_indent_prefs_get_auto_indent_mode (GeanyDBusIndentPrefs* self) {
	GeanyAutoIndent result = 0;
	g_return_val_if_fail (self != NULL, 0);
	result = (*self->priv->prefs).auto_indent_mode;
	return result;
}


void geany_dbus_indent_prefs_set_auto_indent_mode (GeanyDBusIndentPrefs* self, GeanyAutoIndent val) {
	g_return_if_fail (self != NULL);
	g_return_if_fail (self->priv->prefs != NULL);
	(*self->priv->prefs).auto_indent_mode = val;
}


gboolean geany_dbus_indent_prefs_get_detect_type (GeanyDBusIndentPrefs* self) {
	gboolean result = FALSE;
	g_return_val_if_fail (self != NULL, FALSE);
	g_return_val_if_fail (self->priv->prefs != NULL, FALSE);
	result = (*self->priv->prefs).detect_type;
	return result;
}


void geany_dbus_indent_prefs_set_detect_type (GeanyDBusIndentPrefs* self, gboolean val) {
	g_return_if_fail (self != NULL);
	g_return_if_fail (self->priv->prefs != NULL);
	(*self->priv->prefs).detect_type = val;
}


static void geany_dbus_indent_prefs_class_init (GeanyDBusIndentPrefsClass * klass) {
	geany_dbus_indent_prefs_parent_class = g_type_class_peek_parent (klass);
	g_type_class_add_private (klass, sizeof (GeanyDBusIndentPrefsPrivate));
	G_OBJECT_CLASS (klass)->finalize = geany_dbus_indent_prefs_finalize;
}


static void geany_dbus_indent_prefs_instance_init (GeanyDBusIndentPrefs * self) {
	self->priv = GEANY_DBUS_INDENT_PREFS_GET_PRIVATE (self);
}


static void geany_dbus_indent_prefs_finalize (GObject* obj) {
	GeanyDBusIndentPrefs * self;
	self = GEANY_DBUS_INDENT_PREFS (obj);
	G_OBJECT_CLASS (geany_dbus_indent_prefs_parent_class)->finalize (obj);
}


GType geany_dbus_indent_prefs_get_type (void) {
	static volatile gsize geany_dbus_indent_prefs_type_id__volatile = 0;
	if (g_once_init_enter (&geany_dbus_indent_prefs_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (GeanyDBusIndentPrefsClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) geany_dbus_indent_prefs_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (GeanyDBusIndentPrefs), 0, (GInstanceInitFunc) geany_dbus_indent_prefs_instance_init, NULL };
		GType geany_dbus_indent_prefs_type_id;
		geany_dbus_indent_prefs_type_id = g_type_register_static (G_TYPE_OBJECT, "GeanyDBusIndentPrefs", &g_define_type_info, 0);
		g_once_init_leave (&geany_dbus_indent_prefs_type_id__volatile, geany_dbus_indent_prefs_type_id);
	}
	return geany_dbus_indent_prefs_type_id__volatile;
}


static void _dbus_geany_dbus_indent_prefs_get_width (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	gint result;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	result = geany_dbus_indent_prefs_get_width (self);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	g_variant_builder_add_value (&_reply_builder, g_variant_new_int32 (result));
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_set_width (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	gint val = 0;
	GVariant* _tmp27_;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	_tmp27_ = g_variant_iter_next_value (&_arguments_iter);
	val = g_variant_get_int32 (_tmp27_);
	g_variant_unref (_tmp27_);
	geany_dbus_indent_prefs_set_width (self, val);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_get_indent_type (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	GeanyIndentType result;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	result = geany_dbus_indent_prefs_get_indent_type (self);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	g_variant_builder_add_value (&_reply_builder, g_variant_new_int32 (result));
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_set_indent_type (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	GeanyIndentType val = 0;
	GVariant* _tmp28_;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	_tmp28_ = g_variant_iter_next_value (&_arguments_iter);
	val = g_variant_get_int32 (_tmp28_);
	g_variant_unref (_tmp28_);
	geany_dbus_indent_prefs_set_indent_type (self, val);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_get_hard_tab_width (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	gint result;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	result = geany_dbus_indent_prefs_get_hard_tab_width (self);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	g_variant_builder_add_value (&_reply_builder, g_variant_new_int32 (result));
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_set_hard_tab_width (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	gint val = 0;
	GVariant* _tmp29_;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	_tmp29_ = g_variant_iter_next_value (&_arguments_iter);
	val = g_variant_get_int32 (_tmp29_);
	g_variant_unref (_tmp29_);
	geany_dbus_indent_prefs_set_hard_tab_width (self, val);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_get_auto_indent_mode (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	GeanyAutoIndent result;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	result = geany_dbus_indent_prefs_get_auto_indent_mode (self);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	g_variant_builder_add_value (&_reply_builder, g_variant_new_int32 (result));
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_set_auto_indent_mode (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	GeanyAutoIndent val = 0;
	GVariant* _tmp30_;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	_tmp30_ = g_variant_iter_next_value (&_arguments_iter);
	val = g_variant_get_int32 (_tmp30_);
	g_variant_unref (_tmp30_);
	geany_dbus_indent_prefs_set_auto_indent_mode (self, val);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_get_detect_type (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	gboolean result;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	result = geany_dbus_indent_prefs_get_detect_type (self);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	g_variant_builder_add_value (&_reply_builder, g_variant_new_boolean (result));
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void _dbus_geany_dbus_indent_prefs_set_detect_type (GeanyDBusIndentPrefs* self, GVariant* parameters, GDBusMethodInvocation* invocation) {
	GError* error;
	gboolean val = FALSE;
	GVariant* _tmp31_;
	GVariantIter _arguments_iter;
	GVariant* _reply;
	GVariantBuilder _reply_builder;
	error = NULL;
	g_variant_iter_init (&_arguments_iter, parameters);
	_tmp31_ = g_variant_iter_next_value (&_arguments_iter);
	val = g_variant_get_boolean (_tmp31_);
	g_variant_unref (_tmp31_);
	geany_dbus_indent_prefs_set_detect_type (self, val);
	g_variant_builder_init (&_reply_builder, G_VARIANT_TYPE_TUPLE);
	_reply = g_variant_builder_end (&_reply_builder);
	g_dbus_method_invocation_return_value (invocation, _reply);
}


static void geany_dbus_indent_prefs_dbus_interface_method_call (GDBusConnection* connection, const gchar* sender, const gchar* object_path, const gchar* interface_name, const gchar* method_name, GVariant* parameters, GDBusMethodInvocation* invocation, gpointer user_data) {
	gpointer* data;
	gpointer object;
	data = user_data;
	object = data[0];
	if (strcmp (method_name, "GetWidth") == 0) {
		_dbus_geany_dbus_indent_prefs_get_width (object, parameters, invocation);
	} else if (strcmp (method_name, "SetWidth") == 0) {
		_dbus_geany_dbus_indent_prefs_set_width (object, parameters, invocation);
	} else if (strcmp (method_name, "GetIndentType") == 0) {
		_dbus_geany_dbus_indent_prefs_get_indent_type (object, parameters, invocation);
	} else if (strcmp (method_name, "SetIndentType") == 0) {
		_dbus_geany_dbus_indent_prefs_set_indent_type (object, parameters, invocation);
	} else if (strcmp (method_name, "GetHardTabWidth") == 0) {
		_dbus_geany_dbus_indent_prefs_get_hard_tab_width (object, parameters, invocation);
	} else if (strcmp (method_name, "SetHardTabWidth") == 0) {
		_dbus_geany_dbus_indent_prefs_set_hard_tab_width (object, parameters, invocation);
	} else if (strcmp (method_name, "GetAutoIndentMode") == 0) {
		_dbus_geany_dbus_indent_prefs_get_auto_indent_mode (object, parameters, invocation);
	} else if (strcmp (method_name, "SetAutoIndentMode") == 0) {
		_dbus_geany_dbus_indent_prefs_set_auto_indent_mode (object, parameters, invocation);
	} else if (strcmp (method_name, "GetDetectType") == 0) {
		_dbus_geany_dbus_indent_prefs_get_detect_type (object, parameters, invocation);
	} else if (strcmp (method_name, "SetDetectType") == 0) {
		_dbus_geany_dbus_indent_prefs_set_detect_type (object, parameters, invocation);
	}
}


static GVariant* geany_dbus_indent_prefs_dbus_interface_get_property (GDBusConnection* connection, const gchar* sender, const gchar* object_path, const gchar* interface_name, const gchar* property_name, GError** error, gpointer user_data) {
	gpointer* data;
	gpointer object;
	data = user_data;
	object = data[0];
	return NULL;
}


static gboolean geany_dbus_indent_prefs_dbus_interface_set_property (GDBusConnection* connection, const gchar* sender, const gchar* object_path, const gchar* interface_name, const gchar* property_name, GVariant* value, GError** error, gpointer user_data) {
	gpointer* data;
	gpointer object;
	data = user_data;
	object = data[0];
	return FALSE;
}


guint geany_dbus_indent_prefs_register_object (gpointer object, GDBusConnection* connection, const gchar* path, GError** error) {
	guint result;
	gpointer *data;
	data = g_new (gpointer, 3);
	data[0] = g_object_ref (object);
	data[1] = g_object_ref (connection);
	data[2] = g_strdup (path);
	result = g_dbus_connection_register_object (connection, path, &_geany_dbus_indent_prefs_dbus_interface_info, &_geany_dbus_indent_prefs_dbus_interface_vtable, data, _geany_dbus_indent_prefs_unregister_object, error);
	if (!result) {
		return 0;
	}
	return result;
}


static void _geany_dbus_indent_prefs_unregister_object (gpointer user_data) {
	gpointer* data;
	data = user_data;
	g_object_unref (data[0]);
	g_object_unref (data[1]);
	g_free (data[2]);
	g_free (data);
}




