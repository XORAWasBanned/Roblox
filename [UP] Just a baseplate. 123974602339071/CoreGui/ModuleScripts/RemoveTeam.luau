-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.RemoveTeam
return require(script.Parent.Parent.ActionCreator)("RemoveTeam", function(p1)
	return {
		["team"] = p1
	}
end)