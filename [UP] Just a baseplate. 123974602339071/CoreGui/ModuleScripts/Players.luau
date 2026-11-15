-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.Players
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.AddPlayer)
local v6 = require(v4.RemovePlayer)
return v2.createReducer({}, {
	[v5.name] = function(p7, p8)
		-- upvalues: (copy) v_u_3
		return v_u_3.List.join(p7, { p8.player })
	end,
	[v6.name] = function(p9, p_u_10)
		-- upvalues: (copy) v_u_3
		return v_u_3.List.filter(p9, function(p11)
			-- upvalues: (copy) p_u_10
			return p11 ~= p_u_10.player
		end)
	end
})