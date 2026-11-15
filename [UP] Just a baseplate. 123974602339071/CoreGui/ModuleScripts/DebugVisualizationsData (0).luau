-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.DebugVisualizationsData
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.DebugVisualizationsUpdateSearchFilter)
return function(p3, p4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if not p3 then
		p3 = {
			["debugVisualizationsSearchTerm"] = "",
			["debugVisualizationsTypeFilters"] = nil,
			["debugVisualizationsTypeFilters"] = {}
		}
	end
	local v5
	if p4.filterTypes == nil then
		v5 = p3.debugVisualizationsTypeFilters
	else
		v5 = v_u_1.JoinDictionaries(p3.debugVisualizationsTypeFilters, p4.filterTypes)
	end
	if p4.type ~= v_u_2.name then
		return p3
	end
	local v6 = {
		["debugVisualizationsSearchTerm"] = p4.searchTerm,
		["debugVisualizationsTypeFilters"] = v5
	}
	return v_u_1.JoinDictionaries(p3, v6)
end