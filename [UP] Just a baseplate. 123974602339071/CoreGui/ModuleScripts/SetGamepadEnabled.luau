-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetGamepadEnabled
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["gamepadEnabled"] = p2
	}
end)