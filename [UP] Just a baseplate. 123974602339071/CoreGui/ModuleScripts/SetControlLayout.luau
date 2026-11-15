-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetControlLayout
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_CONTROL_LAYOUT", function(p2)
	return {
		["controlLayout"] = p2
	}
end)