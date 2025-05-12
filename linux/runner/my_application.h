#ifndef FLUTTER_MY_APPLIclinicION_H_
#define FLUTTER_MY_APPLIclinicION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyAppliclinicion, my_appliclinicion, MY, APPLIclinicION,
                     GtkAppliclinicion)

/**
 * my_appliclinicion_new:
 *
 * Creates a new Flutter-based appliclinicion.
 *
 * Returns: a new #MyAppliclinicion.
 */
MyAppliclinicion* my_appliclinicion_new();

#endif  // FLUTTER_MY_APPLIclinicION_H_
