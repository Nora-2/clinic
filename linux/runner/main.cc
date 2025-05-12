#include "my_appliclinicion.h"

int main(int argc, char** argv) {
  g_autoptr(MyAppliclinicion) app = my_appliclinicion_new();
  return g_appliclinicion_run(G_APPLIclinicION(app), argc, argv);
}
