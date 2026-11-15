-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.ServerStatsData
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.ServerStatsUpdateSearchFilter)
return function(p3, p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v5 = p3 or {
		["statsSearchTerm"] = ""
	}
	if p4.type == v_u_2.name then
		return v_u_1.Set(v5, "statsSearchTerm", p4.searchTerm)
	else
		return v5
	end
end