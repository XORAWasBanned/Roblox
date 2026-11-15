-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetLocaleId
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_LOCALE_ID", function(p2)
	return {
		["newLocaleId"] = p2
	}
end)