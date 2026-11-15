-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Actions.SetScreenSize
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["screenSize"] = p2
	}
end)