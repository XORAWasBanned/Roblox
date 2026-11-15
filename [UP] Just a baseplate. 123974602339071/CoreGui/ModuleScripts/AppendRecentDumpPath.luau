-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.AppendRecentDumpPath
return require(script.Parent.Parent.Action)(script.Name, function(p1)
	return {
		["dumpPath"] = p1
	}
end)