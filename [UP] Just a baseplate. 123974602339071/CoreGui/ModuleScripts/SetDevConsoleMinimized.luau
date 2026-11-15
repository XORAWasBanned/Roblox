-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.SetDevConsoleMinimized
return require(script.Parent.Parent.Action)("SetDevConsoleMinimized", function(p1)
	return {
		["isMinimized"] = p1
	}
end)