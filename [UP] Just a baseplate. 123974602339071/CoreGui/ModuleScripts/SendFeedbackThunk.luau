-- Path: CoreGui.RobloxGui.Modules.Feedback.Thunks.SendFeedbackThunk
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.InGameMenuDependencies).Promise
local v_u_3 = require(v1.Workspace.Packages.Http).PerformFetch
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Network.PostFeedback)
local v_u_6 = require(v4.Actions.IncrementFeedbackSubmissionAttempts)
return function(p_u_7, p_u_8, p_u_9, p_u_10, p_u_11, p_u_12, p_u_13, p_u_14)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2
	return v_u_3.Single("PostFeedbackRequest", function(p_u_15)
		-- upvalues: (ref) v_u_5, (copy) p_u_7, (copy) p_u_8, (copy) p_u_9, (copy) p_u_10, (copy) p_u_11, (copy) p_u_12, (copy) p_u_13, (ref) v_u_6, (copy) p_u_14, (ref) v_u_2
		return v_u_5(p_u_7, p_u_8, p_u_9, p_u_10, p_u_11, p_u_12, p_u_13):andThen(function(p16)
			-- upvalues: (copy) p_u_15, (ref) v_u_6, (ref) p_u_14, (ref) v_u_2
			p_u_15:dispatch(v_u_6(p_u_14))
			return v_u_2.resolve(p16)
		end, function(p17)
			-- upvalues: (ref) v_u_2
			return v_u_2.reject(p17)
		end)
	end)
end