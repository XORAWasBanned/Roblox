-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetInputType
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_INPUT_TYPE", function(p2)
	return {
		["inputType"] = p2
	}
end)