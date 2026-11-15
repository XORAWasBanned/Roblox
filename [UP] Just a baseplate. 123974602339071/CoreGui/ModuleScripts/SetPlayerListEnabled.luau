-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.SetPlayerListEnabled
return require(script.Parent.Parent.ActionCreator)("SetPlayerListEnabled", function(p1)
	return {
		["isEnabled"] = p1
	}
end)