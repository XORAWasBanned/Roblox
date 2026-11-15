-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.OpenPlayerDropDown
return require(script.Parent.Parent.ActionCreator)("OpenPlayerDropDown", function(p1)
	return {
		["selectedPlayer"] = p1
	}
end)