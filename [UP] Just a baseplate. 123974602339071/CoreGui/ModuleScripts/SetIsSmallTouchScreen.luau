-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Actions.SetIsSmallTouchScreen
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["isSmallTouchScreen"] = p2
	}
end)