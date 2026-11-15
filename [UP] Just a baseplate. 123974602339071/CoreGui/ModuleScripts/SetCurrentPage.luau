-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetCurrentPage
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_CURRENT_PAGE", function(p2)
	return {
		["newPage"] = p2
	}
end)