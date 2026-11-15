-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.SetMinimized
return require(script.Parent.Parent.ActionCreator)("SetMinimized", function(p1)
	return {
		["isMinimized"] = p1
	}
end)