-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.OpenOverlay
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["overlay"] = p2,
		["overlayProps"] = p3
	}
end)