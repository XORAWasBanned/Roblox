-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.SetTeamName
return require(script.Parent.Parent.ActionCreator)("SetTeamName", function(p1, p2)
	return {
		["isTeamAction"] = true,
		["team"] = nil,
		["teamName"] = nil,
		["team"] = p1,
		["teamName"] = p2
	}
end)