-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Actions.SetGuiInset
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["guiInset"] = p2
	}
end)