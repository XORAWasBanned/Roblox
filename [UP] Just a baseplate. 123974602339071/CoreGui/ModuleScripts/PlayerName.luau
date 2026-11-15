-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.PlayerName
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetPlayerName)
return v2.createReducer("", {
	[v4.name] = function(_, p5)
		return p5.playerName
	end
})