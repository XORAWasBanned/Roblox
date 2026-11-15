-- Path: CoreGui.RobloxGui.Modules.Feedback.Reducers.common
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.IncrementFeedbackSubmissionAttempts)
local v6 = require(v4.Actions.ShowHelpModal)
local v7 = require(v4.Actions.ShowOnboardingModal)
local v8 = require(v4.Actions.SetSourceLanguageName)
return v3.createReducer({
	["numFeedbackSubmissionAttempts"] = nil,
	["showHelpModal"] = false,
	["showOnboardingModal"] = true,
	["sourceLanguageName"] = ""
}, {
	[v5.name] = function(p9, p10)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p9, {
			["numFeedbackSubmissionAttempts"] = p10.numFeedbackSubmissionAttempts
		})
	end,
	[v6.name] = function(p11, p12)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p11, {
			["showHelpModal"] = p12.helpModalVisible
		})
	end,
	[v7.name] = function(p13, p14)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p13, {
			["showOnboardingModal"] = p14.onboardingModalVisible
		})
	end,
	[v8.name] = function(p15, p16)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p15, {
			["sourceLanguageName"] = p16.sourceLanguageName
		})
	end
})