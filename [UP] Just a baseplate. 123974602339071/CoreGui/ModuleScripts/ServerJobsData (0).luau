-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.ServerJobsData
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.ServerJobsUpdateSearchFilter)
return function(p3, p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v5 = p3 or {
		["jobsSearchTerm"] = ""
	}
	if p4.type == v_u_2.name then
		return v_u_1.Set(v5, "jobsSearchTerm", p4.searchTerm)
	else
		return v5
	end
end