-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Actions.SelectReportListing
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3, p4)
	return {
		["reportType"] = p2,
		["targetPlayer"] = p3,
		["sortedUserIds"] = p4
	}
end)