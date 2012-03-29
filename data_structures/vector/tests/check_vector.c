#include <stdlib.h>
#include <check.h>
#include "../src/vector.h"

START_TEST (test_vector_new_should_fill_struct_with_defaults)
{
  vector v;

  vector_new(&v, sizeof(int), NULL, 10);

  fail_unless(v.elem_size == sizeof(int),
              ".elem_size field should be sizeof(int)");
  fail_unless(v.free_func == NULL,
              ".free_func field should be NULL");
  fail_unless(v.step == 10,
              ".step field should be 10");

}
END_TEST


Suite *
vector_suite(void) {
  Suite *s = suite_create("vector");

  TCase *tc_vector_new = tcase_create("vector_new");
  tcase_add_test(tc_vector_new, test_vector_new_should_fill_struct_with_defaults);
  suite_add_tcase(s, tc_vector_new);

  return s;
}

int main(void) {
  int nfailed;
  Suite *s = vector_suite();
  SRunner *sr = srunner_create(s);

  srunner_run_all(sr, CK_VERBOSE);
  nfailed = srunner_ntests_failed(sr);
  srunner_free(sr);

  return (nfailed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
