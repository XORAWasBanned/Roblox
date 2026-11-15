-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.SetSettings
return require(script.Parent.Parent.ActionCreator)("SetSettings", function(p1)
	return {
		["preferredTransparency"] = p1.preferredTransparency,
		["reducedMotion"] = p1.reducedMotion
	}
end)