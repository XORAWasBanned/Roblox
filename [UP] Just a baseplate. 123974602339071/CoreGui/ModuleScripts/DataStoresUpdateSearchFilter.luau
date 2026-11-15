-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.DataStoresUpdateSearchFilter
return require(script.Parent.Parent.Action)("DataStoresUpdateSearchFilter", function(p1, p2)
	return {
		["searchTerm"] = p1,
		["filterTypes"] = p2
	}
end)