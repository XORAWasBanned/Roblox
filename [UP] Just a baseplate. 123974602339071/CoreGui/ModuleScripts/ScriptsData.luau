-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.ScriptsData
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.ClientScriptsUpdateSearchFilter)
local v_u_3 = require(script.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter)
return function(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	if not p4 then
		p4 = {
			["clientSearchTerm"] = "",
			["clientTypeFilters"] = nil,
			["serverSearchTerm"] = "",
			["serverTypeFilters"] = nil,
			["clientTypeFilters"] = {},
			["serverTypeFilters"] = {}
		}
	end
	if p5.type == v_u_2.name then
		local v6 = {
			["clientSearchTerm"] = p5.searchTerm,
			["clientTypeFilters"] = v_u_1.JoinDictionaries(p4.clientTypeFilters, p5.filterTypes)
		}
		return v_u_1.JoinDictionaries(p4, v6)
	end
	if p5.type ~= v_u_3.name then
		return p4
	end
	local v7 = {
		["serverSearchTerm"] = p5.searchTerm,
		["serverTypeFilters"] = v_u_1.JoinDictionaries(p4.serverTypeFilters, p5.filterTypes)
	}
	return v_u_1.JoinDictionaries(p4, v7)
end