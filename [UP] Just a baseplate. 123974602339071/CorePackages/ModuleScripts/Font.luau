-- Path: CorePackages.Packages._Index.BuilderIcons.BuilderIcons.Font
local v1 = script.Parent
local v2 = ("rbxassetid://%*"):format((require(v1.BuilderIconsFallback)))
local v3 = {
	["Regular"] = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Regular),
	["Filled"] = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Bold),
	["Fallback"] = {
		["Regular"] = Font.new(v2, Enum.FontWeight.Regular),
		["Filled"] = Font.new(v2, Enum.FontWeight.Bold)
	}
}
return v3