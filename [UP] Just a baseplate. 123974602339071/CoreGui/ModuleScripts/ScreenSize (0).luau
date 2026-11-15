-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.ScreenSize
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent.Actions
local v4 = require(v3.SetScreenSize)
return v2.createReducer({
	["X"] = 1000,
	["Y"] = 1000
}, {
	[v4.name] = function(_, p5)
		return {
			["X"] = p5.sizeX,
			["Y"] = p5.sizeY
		}
	end
})