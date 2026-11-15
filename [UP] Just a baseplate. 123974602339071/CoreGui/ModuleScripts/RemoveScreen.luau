-- Path: CoreGui.RobloxGui.Modules.Shell.Actions.RemoveScreen
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("RemoveScreen", function(p2)
	return {
		["item"] = p2
	}
end)