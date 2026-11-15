-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.PlayerDropDown
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = require(v1.Workspace.Packages.PlayerList)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.OpenPlayerDropDown)
local v6 = require(v4.ClosePlayerDropDown)
local v7 = require(v4.RemovePlayer)
local v8 = require(v4.SetPlayerListVisibility)
local v_u_9 = v3.Flags.FFlagAddNewPlayerListMobileFocusNav
return v2.createReducer({
	["isVisible"] = false,
	["selectedPlayer"] = nil
}, {
	[v8.name] = function(p10, p11)
		-- upvalues: (copy) v_u_9
		if p11.isVisible then
			return p10
		end
		local v12 = {
			["isVisible"] = false,
			["selectedPlayer"] = nil
		}
		local v13
		if v_u_9 then
			v13 = nil
		else
			v13 = p10.selectedPlayer
		end
		v12.selectedPlayer = v13
		return v12
	end,
	[v5.name] = function(_, p14)
		return {
			["isVisible"] = true,
			["selectedPlayer"] = nil,
			["selectedPlayer"] = p14.selectedPlayer
		}
	end,
	[v6.name] = function(p15, _)
		return {
			["isVisible"] = false,
			["selectedPlayer"] = nil,
			["selectedPlayer"] = p15.selectedPlayer
		}
	end,
	[v7.name] = function(p16, p17)
		return p17.player == p16.selectedPlayer and {
			["isVisible"] = false,
			["selectedPlayer"] = nil
		} or p16
	end
})