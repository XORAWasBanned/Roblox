-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.ChangeDevConsoleSize
return require(script.Parent.Parent.Action)("ChangeDevConsoleSize", function(p1)
	return {
		["newSize"] = p1
	}
end)