
CC=gcc
CFLAGS=-Wall -fpic -c

OBJS_DIR=objs

OBJS=objs/src/vector.o

TEST_LIBS=-lcheck
TEST_OBJS=$(OBJS_DIR)/tests/check_vector.o

clean:
	@rm -rf test $(OBJS_DIR)

$(OBJS_DIR):
	-@mkdir -p $(OBJS_DIR)/src $(OBJS_DIR)/tests

$(OBJS_DIR)/%.o: %.c $(OBJS_DIR)
	@$(CC) -o $@ $< $(CFLAGS)

test: clean $(TEST_OBJS) $(OBJS)
	@$(CC) -o $@ $(TEST_OBJS) $(OBJS) $(TEST_LIBS)
	@./$@


.PHONY: clean
