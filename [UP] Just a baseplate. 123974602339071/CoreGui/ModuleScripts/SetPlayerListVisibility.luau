-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.SetPlayerListVisibility
return require(script.Parent.Parent.ActionCreator)("SetPlayerListVisibility", function(p1)
	return {
		["isVisible"] = p1
	}
end)