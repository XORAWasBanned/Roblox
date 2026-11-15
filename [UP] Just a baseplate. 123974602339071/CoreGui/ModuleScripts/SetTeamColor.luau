-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.SetTeamColor
return require(script.Parent.Parent.ActionCreator)("SetTeamColor", function(p1, p2)
	return {
		["isTeamAction"] = true,
		["team"] = nil,
		["teamColor"] = nil,
		["team"] = p1,
		["teamColor"] = p2
	}
end)