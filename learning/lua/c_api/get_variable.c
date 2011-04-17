#include <stdio.h>
#include <stdlib.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

void load_file(lua_State *L) {
    if ( luaL_loadfile(L, "conf.lua") || lua_pcall(L, 0, 0, 0) ) {
        printf("cannot load conf.lua file: %s\n", lua_tostring(L, -1));
        exit(1);
    }
}

void get_dimensions(lua_State *L, int *width, int *height) {
    lua_getglobal(L, "width");
    lua_getglobal(L, "height");
    
    if ( !lua_isnumber(L, -2) ) {
        printf("width should be a number\n");
        exit(1);
    }

    if ( !lua_isnumber(L, -1) ) {
        printf("height should be a number\n");
        exit(1);
    }

    *width = lua_tointeger(L, -2);
    *height = lua_tointeger(L, -1);

    lua_pop(L, 2);
}

int get_field_from_colors(lua_State *L, char *key) {
    int value;

    lua_pushstring(L, key);
    lua_gettable(L, -2);    /* background[key] */

    if ( !lua_isnumber(L, -1) ) {
        printf("value for key '%s' in 'background' should be number\n", key);
        exit(1);
    }

    value = lua_tointeger(L, -1);
    lua_pop(L, 1);

    return value;
}

void get_colors(lua_State *L, int *r, int *g, int *b) {
    lua_getglobal(L, "background");

    if ( !lua_istable(L, -1) ) {
        printf("background should be a table\n");
        exit(1);
    }

    *r = get_field_from_colors(L, "r");
    *g = get_field_from_colors(L, "g");
    *b = get_field_from_colors(L, "b");

    lua_pop(L, 1);
}

int main(void) {
    int width;
    int height;
    int r, g, b;
    lua_State *L = luaL_newstate();    

    luaL_openlibs(L);

    load_file(L);
    get_dimensions(L, &width, &height);
    get_colors(L, &r, &g, &b);

    printf("Width: %d\nHeight: %d\n", width, height);
    printf("Colors:\n R: %d\n G: %d\n B: %d\n", r, g, b);

    lua_close(L);
    return 0;
}
