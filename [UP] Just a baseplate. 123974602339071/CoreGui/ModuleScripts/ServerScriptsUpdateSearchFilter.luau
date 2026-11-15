-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.ServerScriptsUpdateSearchFilter
return require(script.Parent.Parent.Action)("ServerScriptsUpdateSearchFilter", function(p1, p2)
	return {
		["searchTerm"] = p1,
		["filterTypes"] = p2
	}
end)