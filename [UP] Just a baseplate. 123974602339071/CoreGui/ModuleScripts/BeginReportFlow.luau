-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Actions.BeginReportFlow
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["reportType"] = p2,
		["targetPlayer"] = p3
	}
end)