-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Actions.SetPlaceInfo
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["name"] = p2,
		["description"] = p3
	}
end)