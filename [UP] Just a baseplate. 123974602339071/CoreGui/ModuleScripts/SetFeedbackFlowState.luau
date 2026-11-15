-- Path: CoreGui.RobloxGui.Modules.Feedback.Actions.SetFeedbackFlowState
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["feedbackFlowState"] = p2
	}
end)