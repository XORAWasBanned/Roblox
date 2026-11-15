-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.UpdateAveragePing
return require(script.Parent.Parent.Action)("UpdateAveragePing", function(p1)
	return {
		["AveragePing"] = p1
	}
end)