-- Path: CoreGui.RobloxGui.Modules.TopBar.Reducer.MoreMenu
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent
if require(v4.Flags.FFlagTopBarDeprecateMoreMenuRodux) then
	return nil
end
local v5 = script.Parent.Parent.Actions
local v6 = require(v5.SetMoreMenuOpen)
local v7 = require(v5.SetBackpackOpen)
local v8 = require(v5.SetEmotesOpen)
local v9 = require(v5.SetLeaderboardOpen)
local v10 = require(v5.SetEmotesEnabled)
return v2.createReducer({
	["open"] = false,
	["backpackOpen"] = false,
	["leaderboardOpen"] = false,
	["emotesOpen"] = false,
	["emotesEnabled"] = true
}, {
	[v6.name] = function(p11, p12)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p11, {
			["open"] = p12.open
		})
	end,
	[v7.name] = function(p13, p14)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p13, {
			["open"] = false,
			["backpackOpen"] = nil,
			["backpackOpen"] = p14.open
		})
	end,
	[v8.name] = function(p15, p16)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p15, {
			["open"] = false,
			["emotesOpen"] = nil,
			["emotesOpen"] = p16.open
		})
	end,
	[v10.name] = function(p17, p18)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p17, {
			["emotesEnabled"] = p18.enabled
		})
	end,
	[v9.name] = function(p19, p20)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p19, {
			["open"] = false,
			["leaderboardOpen"] = nil,
			["leaderboardOpen"] = p20.open
		})
	end
})