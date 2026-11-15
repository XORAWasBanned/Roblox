-- Path: CorePackages.Packages._Index.LuaRoactPolicyProvider.LuaRoactPolicyProvider.Logger
local v1 = script.Parent.Parent
local v2 = require(v1.Lumberyak)
if game:DefineFastFlag("RoactPolicyLoggerName", false) then
	return v2.Logger.new(nil, "LuaRoactPolicyProvider")
else
	return v2.Logger.new()
end