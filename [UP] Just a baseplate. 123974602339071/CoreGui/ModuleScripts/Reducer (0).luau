-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.Reducer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = require(script.Parent.DisplayOptions)
local v4 = require(script.Parent.ScreenSize)
local v5 = require(script.Parent.Settings)
local v6 = require(script.Parent.GameStats)
local v7 = require(script.Parent.Teams)
local v8 = require(script.Parent.TeamNames)
local v9 = require(script.Parent.TeamColors)
local v10 = require(script.Parent.Players)
local v11 = require(script.Parent.PlayerStats)
local v12 = require(script.Parent.PlayerTeam)
local v13 = require(script.Parent.PlayerIconInfo)
local v14 = require(script.Parent.PlayerRelationship)
local v15 = require(script.Parent.PlayerDropDown)
local v_u_16 = require(script.Parent.PlayerKeys)
local v_u_17 = v2.combineReducers({
	["displayOptions"] = v3,
	["screenSize"] = v4,
	["settings"] = v5,
	["gameStats"] = v6,
	["teams"] = v7,
	["teamNames"] = v8,
	["teamColors"] = v9,
	["players"] = v10,
	["playerStats"] = v11,
	["playerTeam"] = v12,
	["playerIconInfo"] = v13,
	["playerRelationship"] = v14,
	["playerDropDown"] = v15
})
return function(p18, p19)
	-- upvalues: (copy) v_u_17, (copy) v_u_16
	local v20 = v_u_17(p18, p19)
	v20.playerKeys = v_u_16(p18 and p18.playerKeys or nil, p19, v20)
	return v20
end