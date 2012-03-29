#include "stdlib.h"

/**
 * File: vector.h
 * ---------------
 * Defines the interface for the vector.
 *
 * The vector allows the client to store any number of elements of any desired
 * primitive type and is appropriate for a wide variety of storage problems.  It
 * supports efficient element access and appending/inserting/deleting elements
 * as well as optional sorting and searching.  In all cases, the vector imposes
 * no upper bound on the number of elements and deals with all its own memory
 * management. The client specifies the size (in bytes) of the elements that
 * will be stored in the vector when it is created.  Thereafter the client and
 * the vector can refer to elements via (void *) ptrs.
 */

#ifndef _VECTOR
#define _VECTOR

/**
 * Type: vector_cmp_func
 * ---------------------
 * vect_cmp_func is a pointer to a client-supplied function which the
 * vector uses to sort or search for elements.  The comparator takes two
 * (const void *) pointers (these will point to elements) and returns an int.
 * The comparator should indicate the ordering of the two elements
 * using the same convention as the strcmp library function:
 *
 *   If elemAddr1 is less than elemAddr2, return a negative number.
 *   If elemAddr2 is greater than elemAddr2, return a positive number.
 *   If the two elements are equal, return 0.
 */
typedef int (*vect_cmp_func)(const void *elem_ptr1, const void *elem_ptr2);


/**
 * Type: vector_map_func
 * -----------------------
 * vector_map_func defines the space of functions that can be used to map over
 * the elements in a vector.  A map function is called with a pointer to
 * the element and a client data pointer passed in from the original
 * caller.
 */
typedef void (*vector_map_func)(void *elem_ptr, void *aux_data);


/**
 * Type: vector_free_func
 * ---------------------------------
 * vector_free_func defines the space of functions that can be used as the
 * clean-up function for each element as it is deleted from the vector
 * or when the entire vector is destroyed.  The cleanup function is
 * called with a pointer to an element about to be deleted.
 */

typedef void (*vector_free_func)(void *elem_ptr);


/**
 * Type: vector
 * ------------
 * Defines the concrete representation of the vector. Even though everything is
 * exposed, the client should respect the the privacy of the representation 
 * and initialize, dispose of, and otherwise interact with a
 * vector using those functions defined in this file.
 */
typedef struct {
  size_t elem_size;
  int step;
  vector_free_func free_func;
} vector;


/**
 * Function: vector_new
 * Usage: vector my_friends;
 *        vector_new(&my_friends, sizeof(char *), string_free, 10);
 * -------------------
 * Constructs a raw or previously destroyed vector to be the
 * empty vector.
 *
 * The elem_size parameter specifies the number of bytes that a single
 * element of the vector should take up.  For example, if you want to store
 * elements of type char *, you would pass sizeof(char *) as this parameter.
 * An assert is raised if the size is not greater than zero.
 *
 * The vector_free_func is the function that will be called on an element that
 * is about to be deleted (using vector_delete) or on each element in the
 * vector when the entire vector is being freed (using vector_dispose). This function
 * is your chance to do any deallocation/cleanup required for the element
 * (such as freeing/deleting any pointers contained in the element). The client can pass
 * NULL for the vector_free_func if the elements don't require any special handling.
 *
 * The ``initial`` parameter specifies the initial allocated length of the
 * vector, as well as the dynamic reallocation increment for those times when the
 * vector needs to grow. Rather than growing the vector one element at a time as
 * elements are added (inefficient), you will grow the vector
 * in chunks of ``initial`` size.  The allocated length is the number
 * of elements for which space has been allocated: the logical length
 * is the number of those slots currently being used.
 *
 * A new vector pre-allocates space for ``initial`` elements, but the
 * logical length is zero. As elements are added, those allocated slots fill
 * up, and when the initial allocation is all used, grow the vector by another
 * ``initial`` elements. You will continue growing the vector in chunks
 * like this as needed. Thus the allocated length will always be a multiple
 * of ``initial``. Don't worry about using realloc to shrink the vector's
 * allocation if a bunch of elements get deleted.  It turns out that
 * many implementations of realloc don't even pay attention to such a request,
 * so there is little point in asking.  Just leave the vector over-allocated and no
 * one will care.
 *
 * The ``initial`` is the client's opportunity to tune the resizing
 * behavior for his/her particular needs. Clients who expect their vectors to
 * become large should probably choose a large initial allocation size, whereas
 * clients who expect the vector to be relatively small should choose a smaller
 * ``initial`` size. You want to minimize the number of reallocations, but
 * you don't want to pre-allocate all that much memory if you don't expect to use very
 * much of it. If the client passes 0 for initialAllocation, the implementation
 * will use the default value of its own choosing.  As assert is raised is
 * the ``initial`` value is less than 0.
 */

void vector_new(vector *v, size_t elem_size, vector_free_func free_func, int initial);

#endif
