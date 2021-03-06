--[[
This script is used to config the interpretoer,
such as adding the search patch.
--]]
print("Start Initialization")

function DebugLogger(message, ...)
    print('----- DEBUG:', message, ...)
end

-- AddPath to add a path to the search for loading file
local function AddPath(path)
    package.path = package.path..";"..path
end

local function AddCPath(path)
    package.cpath = package.cpath..";"..path
end

-- print the key, value in a table
function PrintTable(t)
    for k, v in pairs(t) do print(k, v) end
end

AddPath("D:\\GitHub\\Lua\\LoadAssets\\?.lua")
-- AddPath("D:\\GitHub\\Lua\\LoadAssets\\?.dll")
AddPath(".\\luaScript\\?.lua")

-- store the original 'loadfile', replace it with loadfileInPath
old_loadfile = loadfile

-- modify the loadfile function,
-- enable the function the ability to search through the package.path, 
-- not just in current folder.
-- notice that if the fileName end with ".lua", 
-- ".lua" will be removed.
loadfile = function(filePath)
    -- remove the ".lua" in the end.
    fileName = string.match(filePath, "(%w-).lua$") or filePath
    
    -- use the searchpath to find the actual path for the file
    fileName = package.searchpath(fileName, package.path)
    
    if fileName then
        return old_loadfile(fileName)
    else
        error("no such file:\n\t"..filePath)
    end
end


func1 = loadfile("thread1.lua")
func2 = loadfile("thread2.lua")
main = loadfile("MainThread.lua")
lp = require("LuaProcess")


print("Initialization Completed")

t = {a = 0, b = 0}
mu = lp.newMutex()

nt1 = lp.newThread(func1);
nt2 = lp.newThread(func2);
success, msg, code = nt1.SysThread:resume()
assert(success, msg)
success, msg, code = nt2.SysThread:resume()
assert(success, msg)
