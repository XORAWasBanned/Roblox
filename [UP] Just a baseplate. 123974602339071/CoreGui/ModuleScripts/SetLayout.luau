-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Actions.SetLayout
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["layout"] = p2
	}
end)