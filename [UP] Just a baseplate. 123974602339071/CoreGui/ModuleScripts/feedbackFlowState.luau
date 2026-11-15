-- Path: CoreGui.RobloxGui.Modules.Feedback.Reducers.feedbackFlowState
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v5 = require(v4.Resources.Constants)
local v6 = require(v4.Actions.SetFeedbackFlowState)
local v7 = require(v4.Actions.SetFeedbackReason)
return v3.createReducer({
	["feedbackFlowState"] = nil,
	["feedbackReason"] = 0,
	["feedbackFlowState"] = v5.State.Default
}, {
	[v6.name] = function(p8, p9)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p8, {
			["feedbackFlowState"] = p9.feedbackFlowState
		})
	end,
	[v7.name] = function(p10, p11)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p10, {
			["feedbackReason"] = p11.feedbackReason
		})
	end
})