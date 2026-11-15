-- Path: CoreGui.RobloxGui.Modules.Feedback.Actions.ShowOnboardingModal
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["onboardingModalVisible"] = p2
	}
end)