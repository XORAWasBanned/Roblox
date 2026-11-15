-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.MemoryData
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.ClientMemoryUpdateSearchFilter)
local v_u_3 = require(script.Parent.Parent.Actions.ServerMemoryUpdateSearchFilter)
return function(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v6 = p4 or {
		["clientSearchTerm"] = "",
		["serverSearchTerm"] = ""
	}
	if p5.type == v_u_2.name then
		return v_u_1.Set(v6, "clientSearchTerm", p5.searchTerm)
	elseif p5.type == v_u_3.name then
		return v_u_1.Set(v6, "serverSearchTerm", p5.searchTerm)
	else
		return v6
	end
end