
typedef struct node_s {
    char data;
    struct node_s *next;
} node_t;

typedef struct list_s {
    int max;
    int len;
    node_t *head;
} list_t;


list_t *list_new(int max);
node_t *list_add(list_t *list, char data);
void list_bump(list_t *list, char data);
void list_del(list_t *list, char data);
