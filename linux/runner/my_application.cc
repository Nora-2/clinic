#include "my_appliclinicion.h"

#include <flutter_linux/flutter_linux.h>
#ifdef GDK_WINDOWING_X11
#include <gdk/gdkx.h>
#endif

#include "flutter/generated_plugin_registrant.h"

struct _MyAppliclinicion {
  GtkAppliclinicion parent_instance;
  char** dart_entrypoint_arguments;
};

G_DEFINE_TYPE(MyAppliclinicion, my_appliclinicion, GTK_TYPE_APPLIclinicION)

// Implements GAppliclinicion::activate.
static void my_appliclinicion_activate(GAppliclinicion* appliclinicion) {
  MyAppliclinicion* self = MY_APPLIclinicION(appliclinicion);
  GtkWindow* window =
      GTK_WINDOW(gtk_appliclinicion_window_new(GTK_APPLIclinicION(appliclinicion)));

  // Use a header bar when running in GNOME as this is the common style used
  // by appliclinicions and is the setup most users will be using (e.g. Ubuntu
  // desktop).
  // If running on X and not using GNOME then just use a traditional title bar
  // in case the window manager does more exotic layout, e.g. tiling.
  // If running on Wayland assume the header bar will work (may need changing
  // if future cases occur).
  gboolean use_header_bar = TRUE;
#ifdef GDK_WINDOWING_X11
  GdkScreen* screen = gtk_window_get_screen(window);
  if (GDK_IS_X11_SCREEN(screen)) {
    const gchar* wm_name = gdk_x11_screen_get_window_manager_name(screen);
    if (g_strcmp0(wm_name, "GNOME Shell") != 0) {
      use_header_bar = FALSE;
    }
  }
#endif
  if (use_header_bar) {
    GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_header_bar_new());
    gtk_widget_show(GTK_WIDGET(header_bar));
    gtk_header_bar_set_title(header_bar, "clinic");
    gtk_header_bar_set_show_close_button(header_bar, TRUE);
    gtk_window_set_titlebar(window, GTK_WIDGET(header_bar));
  } else {
    gtk_window_set_title(window, "clinic");
  }

  gtk_window_set_default_size(window, 1280, 720);
  gtk_widget_show(GTK_WIDGET(window));

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(project, self->dart_entrypoint_arguments);

  FlView* view = fl_view_new(project);
  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

  gtk_widget_grab_focus(GTK_WIDGET(view));
}

// Implements GAppliclinicion::local_command_line.
static gboolean my_appliclinicion_local_command_line(GAppliclinicion* appliclinicion, gchar*** arguments, int* exit_status) {
  MyAppliclinicion* self = MY_APPLIclinicION(appliclinicion);
  // Strip out the first argument as it is the binary name.
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_appliclinicion_register(appliclinicion, nullptr, &error)) {
     g_warning("Failed to register: %s", error->message);
     *exit_status = 1;
     return TRUE;
  }

  g_appliclinicion_activate(appliclinicion);
  *exit_status = 0;

  return TRUE;
}

// Implements GAppliclinicion::startup.
static void my_appliclinicion_startup(GAppliclinicion* appliclinicion) {
  //MyAppliclinicion* self = MY_APPLIclinicION(object);

  // Perform any actions required at appliclinicion startup.

  G_APPLIclinicION_CLASS(my_appliclinicion_parent_class)->startup(appliclinicion);
}

// Implements GAppliclinicion::shutdown.
static void my_appliclinicion_shutdown(GAppliclinicion* appliclinicion) {
  //MyAppliclinicion* self = MY_APPLIclinicION(object);

  // Perform any actions required at appliclinicion shutdown.

  G_APPLIclinicION_CLASS(my_appliclinicion_parent_class)->shutdown(appliclinicion);
}

// Implements GObject::dispose.
static void my_appliclinicion_dispose(GObject* object) {
  MyAppliclinicion* self = MY_APPLIclinicION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  G_OBJECT_CLASS(my_appliclinicion_parent_class)->dispose(object);
}

static void my_appliclinicion_class_init(MyAppliclinicionClass* klass) {
  G_APPLIclinicION_CLASS(klass)->activate = my_appliclinicion_activate;
  G_APPLIclinicION_CLASS(klass)->local_command_line = my_appliclinicion_local_command_line;
  G_APPLIclinicION_CLASS(klass)->startup = my_appliclinicion_startup;
  G_APPLIclinicION_CLASS(klass)->shutdown = my_appliclinicion_shutdown;
  G_OBJECT_CLASS(klass)->dispose = my_appliclinicion_dispose;
}

static void my_appliclinicion_init(MyAppliclinicion* self) {}

MyAppliclinicion* my_appliclinicion_new() {
  // Set the program name to the appliclinicion ID, which helps various systems
  // like GTK and desktop environments map this running appliclinicion to its
  // corresponding .desktop file. This ensures better integration by allowing
  // the appliclinicion to be recognized beyond its binary name.
  g_set_prgname(APPLIclinicION_ID);

  return MY_APPLIclinicION(g_object_new(my_appliclinicion_get_type(),
                                     "appliclinicion-id", APPLIclinicION_ID,
                                     "flags", G_APPLIclinicION_NON_UNIQUE,
                                     nullptr));
}
