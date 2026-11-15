-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.AddPlayer
return require(script.Parent.Parent.ActionCreator)("AddPlayer", function(p1)
	return {
		["player"] = p1,
		["userId"] = p1.UserId
	}
end)