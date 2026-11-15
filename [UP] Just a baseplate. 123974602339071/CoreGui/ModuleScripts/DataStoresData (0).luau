-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.DataStoresData
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.DataStoresUpdateSearchFilter)
return function(p3, p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v5 = p3 or {
		["storesSearchTerm"] = ""
	}
	if p4.type == v_u_2.name then
		return v_u_1.Set(v5, "storesSearchTerm", p4.searchTerm)
	else
		return v5
	end
end