// LuaApplication.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include "../Library/Lua/LuaInterpreter/LuaInterpreter.h"
#include <thread>

#pragma comment(lib, "LuaInterpreter.lib")

int main()
{
	/*
	auto luaInter1 = std::make_unique<LuaInterpreter>();

	luaInter1->DoFile("MainThread.lua");

	auto luaInter2 = std::make_unique<LuaInterpreter>(lua_newthread(luaInter1->m_L));

	auto thread1 = std::thread([&luaInter1]() {luaInter1->DoFile("thread1.lua"); });
	auto thread2 = std::thread([&luaInter2]() {luaInter2->DoFile("thread2.lua"); });

	thread1.join();
	thread2.join();

	printf("two thread completed\n");
	*/





	auto luaInter1 = std::make_unique<LuaInterpreter>();

	luaInter1->DoFile("Init.lua");
	luaInter1->Run();

	getchar();

    return 0;
}

