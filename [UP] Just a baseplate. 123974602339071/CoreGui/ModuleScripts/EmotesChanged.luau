-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Actions.EmotesChanged
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["emotes"] = p2
	}
end)