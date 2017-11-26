#include "LuaProcess.h"

int LUAPROCESS_API luaopen_LuaProcess(lua_State * L)
{
	luaL_newlib(L, LuaProcessLib);
	return 0;
}
