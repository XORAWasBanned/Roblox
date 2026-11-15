-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Actions.SetVoiceReportingFlow
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["enable"] = p2
	}
end)