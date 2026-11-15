-- Path: CoreGui.RobloxGui.Modules.Shell.Actions.InsertScreen
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("InsertScreen", function(p2)
	return {
		["item"] = p2
	}
end)