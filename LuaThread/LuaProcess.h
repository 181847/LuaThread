#pragma once
#include "LuaProcessStruct.h"

#pragma comment(lib, "Lua.lib")


#ifdef LUAPROCESS_EXPORTS
#define LUAPROCESS_API DLL_EXPORT_API
#elif LUAPROCESS_IMPORTS
#define LUAPROCESS_API DLL_IMPORT_API
#endif

#ifdef __cplusplus
extern "C"
{
#endif
	int LUAPROCESS_API luaopen_LuaProcess(lua_State * L);
#ifdef __cplusplus
}
#endif

static int lua_newThread(lua_State * L);

static int lua_resume(lua_State * L);

static const struct luaL_Reg LuaProcessLib[]=
{
	{ "newThread",		lua_newThread },
	{ "resume",			lua_resume },
	{ NULL,				NULL }
};

