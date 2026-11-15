-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.SetDevConsoleVisibility
return require(script.Parent.Parent.Action)("SetDevConsoleVisibility", function(p1)
	return {
		["isVisible"] = p1
	}
end)