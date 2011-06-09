#include <stdio.h>
#include <stdlib.h>
#include "blist.h"

/*
 * BList: a list with boundaries
 *
 * Implementation of a list with max size, to be used as keys list
 * to LRU cache algorithm.
 *
 * Every new item added goes to head (becomes Most Recently Used) 
 * and if the list size goes up to overcomes the max size, the 
 * last element (LRU) is removed.
 */


/*
 * Creates a new empty list
 */
list_t *list_new(int max) 
{
    list_t *list = malloc(sizeof(*list));

    list->max = max;
    list->len = 0;
    list->head = NULL;

    return list;
}

void list_del_tail(list_t *list)
{
    node_t *tmp = list->head;
    while (tmp->next->next != NULL) {
        tmp = tmp->next;
    }
    tmp->next = NULL;
    list->len--;
}

/*
 * Add new item to the head of the list and removes
 * LRU if reached max size
 */
node_t *list_add(list_t *list, char data) 
{
    if (list->max == 0) 
        return NULL;

    node_t *node = malloc(sizeof(*node));
    
    node->data = data;
    node->next = list->head;
    list->head = node;
    list->len++;

    if (list->len > list->max) {
        list_del_tail(list);
    }
    
    return node;
}

/*
 * Moves item to head of the list (make it MRU)
 */
void list_bump(list_t *list, char data)
{
    node_t *node = list->head;
    node_t *prev;

    while (node != NULL) {
        if (node->data == data) {
            prev->next = node->next;
            node->next = list->head;
            list->head = node;
            break;
        } else {
            prev = node;
            node = node->next;
        }
    }
}

/*
 * Removes item from list
 */
void list_del(list_t *list, char data)
{
    node_t *node = list->head;
    node_t *prev = NULL;
    
    while (node != NULL) {
        if (node->data == data) {
            // found `data` in list head
            if (prev == NULL) {
                prev = list->head;
                list->head = list->head->next;
                free(prev);
            } else {
                prev->next = node->next;
                free(node);
                free(prev);
            }
            break;
        } else {
            prev = node;
            node = node->next;
        }
    }
}

int main(int argc, const char *argv[])
{

    return 0;
}
