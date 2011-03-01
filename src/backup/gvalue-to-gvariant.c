/*
 * Proof of concept GValue-to-GVariant converter
 *
 * Compile with: gcc -ggdb -O0 -o gvalue-to-gvariant \
 *  `pkg-config --cflags --libs dbus-glib-1 gio-2.0 telepathy-glib` \
 *  gvalue-to-gvariant.c 
 *
 * Authors: Danielle Madeley <danielle.madeley@collabora.co.uk>
 */

#include <gio/gio.h>
#include <dbus/dbus-glib.h>

static GVariant *g_value_to_g_variant (const GValue *value);

static void
_collection_iterator (const GValue *value,
    gpointer user_data)
{
  GPtrArray *children = user_data;

  g_ptr_array_add (children, g_value_to_g_variant (value));
}

static void
_map_iterator (const GValue *kvalue,
    const GValue *vvalue,
    gpointer user_data)
{
  GPtrArray *children = user_data;

  g_ptr_array_add (children,
      g_variant_new_dict_entry (
        g_value_to_g_variant (kvalue),
        g_value_to_g_variant (vvalue)));
}

static GVariant *
g_value_to_g_variant (const GValue *value)
{
  GType type;

  type = G_VALUE_TYPE (value);

  if (dbus_g_type_is_collection (type))
    {
      GVariant *variant;
      GPtrArray *children;

      children = g_ptr_array_new ();
      dbus_g_type_collection_value_iterate (value, _collection_iterator,
          children);

      variant = g_variant_new_array (NULL, (GVariant **) children->pdata,
          children->len);
      g_ptr_array_free (children, TRUE);

      return variant;
    }
  else if (dbus_g_type_is_map (type))
    {
      GVariant *variant;
      GPtrArray *children;

      children = g_ptr_array_new ();
      dbus_g_type_map_value_iterate (value, _map_iterator, children);

      variant = g_variant_new_array (NULL, (GVariant **) children->pdata,
          children->len);
      g_ptr_array_free (children, TRUE);

      return variant;
    }
  else if (dbus_g_type_is_struct (type))
    {
      GVariant *variant, **children;
      guint size, i;

      size = dbus_g_type_get_struct_size (type);
      children = g_new0 (GVariant *, size);

      for (i = 0; i < size; i++)
        {
          GValue cvalue = { 0, };

          g_value_init (&cvalue, dbus_g_type_get_struct_member_type (type, i));
          dbus_g_type_struct_get_member (value, i, &cvalue);

          children[i] = g_value_to_g_variant (&cvalue);
          g_value_unset (&cvalue);
        }

      variant = g_variant_new_tuple (children, size);
      g_free (children);

      return variant;
    }
  else if (type == G_TYPE_BOOLEAN)
    return g_variant_new_boolean (g_value_get_boolean (value));
  else if (type == G_TYPE_UCHAR)
    return g_variant_new_byte (g_value_get_uchar (value));
  else if (type == G_TYPE_INT)
    return g_variant_new_int32 (g_value_get_int (value));
  else if (type == G_TYPE_UINT)
    return g_variant_new_uint32 (g_value_get_uint (value));
  else if (type == G_TYPE_INT64)
    return g_variant_new_int64 (g_value_get_int64 (value));
  else if (type == G_TYPE_UINT64)
    return g_variant_new_uint64 (g_value_get_uint64 (value));
  else if (type == G_TYPE_DOUBLE)
    return g_variant_new_double (g_value_get_double (value));
  else if (type == G_TYPE_STRING)
    return g_variant_new_string (g_value_get_string (value));
  else if (type == G_TYPE_STRV)
    return g_variant_new_strv (g_value_get_boxed (value), -1);
  else if (type == DBUS_TYPE_G_OBJECT_PATH)
    return g_variant_new_object_path (g_value_get_boxed (value));
  else if (type == G_TYPE_VALUE)
    return g_variant_new_variant (
        g_value_to_g_variant (g_value_get_boxed (value)));
  else
    {
      g_error ("Unknown type: %s", g_type_name (type));
    }
}

/* include tp-glib for its registered GTypes and utility functions, so we
 * can test this thing works */
#include <telepathy-glib/telepathy-glib.h>

int
main (int argc,
    char **argv)
{
  char *str;
  GValue value = { 0, };
  GVariant *variant;

  g_type_init ();

  g_value_init (&value, TP_STRUCT_TYPE_SIMPLE_PRESENCE);
  g_value_take_boxed (&value,
      tp_value_array_build (3,
        G_TYPE_UINT, 1,
        G_TYPE_STRING, "available",
        G_TYPE_STRING, "message",
        G_TYPE_INVALID));

  variant = g_value_to_g_variant (&value);
  g_value_unset (&value);

  str = g_variant_print (variant, FALSE);
  g_print ("variant = %s\n", str);

  g_free (str);
  g_variant_unref (variant);

  g_value_init (&value, TP_HASH_TYPE_QUALIFIED_PROPERTY_VALUE_MAP);
  g_value_take_boxed (&value,
      tp_asv_new (
        "key",
        G_TYPE_STRING,
        "value",

        "one",
        G_TYPE_INT,
        1,

        NULL));

  variant = g_value_to_g_variant (&value);
  g_value_unset (&value);

  str = g_variant_print (variant, FALSE);
  g_print ("variant = %s\n", str);

  g_free (str);
  g_variant_unref (variant);

    {
      GPtrArray *array = g_ptr_array_new ();

      g_ptr_array_add (array, tp_value_array_build (2,
            G_TYPE_UINT, 0,
            G_TYPE_STRING, "Alias 0",
            G_TYPE_INVALID));
      g_ptr_array_add (array, tp_value_array_build (2,
            G_TYPE_UINT, 1,
            G_TYPE_STRING, "Alias 1",
            G_TYPE_INVALID));
      g_ptr_array_add (array, tp_value_array_build (2,
            G_TYPE_UINT, 1337,
            G_TYPE_STRING, "Alias the Jester",
            G_TYPE_INVALID));

      g_value_init (&value, TP_ARRAY_TYPE_ALIAS_PAIR_LIST);
      g_value_take_boxed (&value, array);

      variant = g_value_to_g_variant (&value);
      g_value_unset (&value);

      str = g_variant_print (variant, FALSE);
      g_print ("variant = %s\n", str);

      g_free (str);
      g_variant_unref (variant);
    }

    {
      GPtrArray *array = g_ptr_array_new ();
      const char *as[] = { "as1", "as2", "as3", NULL };

      g_ptr_array_add (array, tp_asv_new (
            "one", G_TYPE_UINT, 1,
            "two", G_TYPE_UINT, 2,
            NULL));
      g_ptr_array_add (array, tp_asv_new (
            "three", G_TYPE_UINT, 3,
            "four", G_TYPE_UINT, 4,
            NULL));

      g_value_init (&value, TP_STRUCT_TYPE_HANDLER_CAPABILITIES);
      g_value_take_boxed (&value, tp_value_array_build (3,
            G_TYPE_STRING, "Well.Known.Name",
            TP_ARRAY_TYPE_STRING_VARIANT_MAP_LIST, array,
            G_TYPE_STRV, as,
            G_TYPE_INVALID));

      g_ptr_array_free (array, TRUE);

      variant = g_value_to_g_variant (&value);
      g_value_unset (&value);

      str = g_variant_print (variant, FALSE);
      g_print ("variant = %s\n", str);

      g_free (str);
      g_variant_unref (variant);
    }
}
