-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Colors
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.AppCommonLib).Color
local v3 = {
	["Obsidian"] = v2.Color3FromHex(1579291),
	["Carbon"] = v2.Color3FromHex(2040099),
	["Slate"] = v2.Color3FromHex(2303271),
	["Flint"] = v2.Color3FromHex(3750717),
	["Graphite"] = v2.Color3FromHex(6645352),
	["Pumice"] = v2.Color3FromHex(12435134),
	["Black"] = Color3.fromRGB(0, 0, 0),
	["White"] = Color3.fromRGB(255, 255, 255),
	["Gray1"] = v2.Color3FromHex(1644825),
	["Gray2"] = v2.Color3FromHex(7697781),
	["Gray4"] = v2.Color3FromHex(14935011),
	["GrayBackground"] = v2.Color3FromHex(14211288),
	["Green"] = v2.Color3FromHex(45167),
	["DisabledGreen"] = v2.Color3FromHex(10273956)
}
setmetatable(v3, {
	["__newindex"] = function(_, _, _) -- name: __newindex end,
	["__index"] = function(_, p4) -- name: __index
		error("Colors table has no value: " .. tostring(p4))
	end
})
return v3