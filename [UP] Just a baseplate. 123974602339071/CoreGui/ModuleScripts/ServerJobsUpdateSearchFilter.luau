-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.ServerJobsUpdateSearchFilter
return require(script.Parent.Parent.Action)("ServerJobsUpdateSearchFilter", function(p1, p2)
	return {
		["searchTerm"] = p1,
		["filterTypes"] = p2
	}
end)