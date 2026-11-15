-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Actions.EquippedEmotesChanged
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["equippedEmotes"] = p2
	}
end)