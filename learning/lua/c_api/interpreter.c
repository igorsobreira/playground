#include <stdio.h>
#include <string.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

void prompt();
int read_input(char *, size_t);
void handle_error(lua_State *L); 
int eval_lua_code(lua_State *L, char *buffer);

int main(void) {
    char buffer[256];
    int error;
    lua_State *L = luaL_newstate();

    luaL_openlibs(L);

    prompt();
    while ( read_input(buffer, sizeof(buffer)) ) {
        error = eval_lua_code(L, buffer);
        if (error) handle_error(L);
        prompt();
    }

    lua_close(L);
    return 0;
}

void prompt() {
    printf("> ");
}

int read_input(char *buffer, size_t len) {
    return fgets(buffer, len, stdin) != NULL;
}

void handle_error(lua_State *L) {
    fprintf(stderr, "%s\n", lua_tostring(L, -1));
    lua_pop(L, 1);
}

int eval_lua_code(lua_State *L, char *buffer) {
    return luaL_loadbuffer(L, buffer, strlen(buffer), "line") ||
           lua_pcall(L, 0, 0, 0);
}
