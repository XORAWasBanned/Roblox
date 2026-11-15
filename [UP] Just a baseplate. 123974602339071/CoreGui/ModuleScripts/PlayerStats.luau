-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.PlayerStats
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.AddPlayer)
local v6 = require(v4.RemovePlayer)
local v7 = require(v4.SetPlayerLeaderstat)
return v2.createReducer({}, {
	[v5.name] = function(p8, p9)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p8, {
			[p9.userId] = {}
		})
	end,
	[v6.name] = function(p10, p11)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p10, {
			[p11.userId] = v_u_3.None
		})
	end,
	[v7.name] = function(p12, p13)
		-- upvalues: (copy) v_u_3
		if p12[p13.userId] == nil then
			return p12
		end
		local v14 = v_u_3.Dictionary.join
		local v15 = {
			[p13.userId] = v_u_3.Dictionary.join(p12[p13.userId], {
				[p13.leaderstat] = p13.value
			})
		}
		return v14(p12, v15)
	end
})