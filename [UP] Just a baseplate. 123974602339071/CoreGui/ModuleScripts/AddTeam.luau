-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.AddTeam
return require(script.Parent.Parent.ActionCreator)("AddTeam", function(p1)
	return {
		["team"] = p1
	}
end)