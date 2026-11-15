-- Path: CoreGui.RobloxGui.Modules.InGameMenu.reducer.gameInfo
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Cryo
local v4 = v2.Rodux
local v5 = script.Parent.Parent
local v6 = require(v5.Actions.SetGameNameAndDescription)
return v4.createReducer({
	["name"] = "Game",
	["description"] = ""
}, {
	[v6.name] = function(p7, p8)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p7, {
			["name"] = p8.gameName,
			["description"] = p8.gameDescription
		})
	end
})