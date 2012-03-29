
#include "vector.h"
#include "stdio.h"

void
vector_new(vector *v, size_t elem_size, vector_free_func free_func, int initial)
{
  v->elem_size = elem_size;
  v->step = initial;
  v->free_func = free_func;
}
