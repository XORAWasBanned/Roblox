-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.TeamColors
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.AddTeam)
local v6 = require(v4.RemoveTeam)
local v7 = require(v4.SetTeamColor)
return v2.createReducer({}, {
	[v5.name] = function(p8, p9)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p8, {
			[p9.team] = p9.team.TeamColor
		})
	end,
	[v6.name] = function(p10, p11)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p10, {
			[p11.team] = v_u_3.None
		})
	end,
	[v7.name] = function(p12, p13)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p12, {
			[p13.team] = p13.teamColor
		})
	end
})