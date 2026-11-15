-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.FeedbackSubmissionToast
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.t)
local v_u_6 = v4.App.Dialog.Toast
local v_u_7 = v4.App.ImageSet.Images
local v_u_8 = require(v1.Workspace.Packages.Localization).withLocalization
local v9 = v_u_2.PureComponent:extend("FeedbackSubmissionToast")
v9.validateProps = v5.strictInterface({
	["numFeedbackSubmissionAttempts"] = v5.optional(v5.number)
})
function v9.render(p_u_10) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7
	if p_u_10.props.numFeedbackSubmissionAttempts == nil then
		return nil
	else
		return v_u_2.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["ZIndex"] = 100,
			["Size"] = UDim2.fromScale(1, 1)
		}, {
			["Toast"] = v_u_8({
				["toastTitle"] = "CoreScripts.Feedback.SubmissionToastHeader",
				["toastSubtitle"] = "CoreScripts.Feedback.SubmissionToastBody"
			})(function(p11)
				-- upvalues: (copy) p_u_10, (ref) v_u_2, (ref) v_u_6, (ref) v_u_7
				local v12 = p11.toastTitle
				local v13 = p11.toastSubtitle
				if p_u_10.props.numFeedbackSubmissionAttempts % 2 == 0 then
					v12 = p11.toastTitle .. " "
					v13 = p11.toastSubtitle .. " "
				end
				return v_u_2.createElement(v_u_6, {
					["duration"] = 3,
					["toastContent"] = nil,
					["toastContent"] = {
						["iconImage"] = v_u_7["icons/status/success"],
						["toastTitle"] = v12,
						["toastSubtitle"] = v13
					}
				})
			end)
		})
	end
end
return v3.connect(function(p14)
	return {
		["numFeedbackSubmissionAttempts"] = p14.common.numFeedbackSubmissionAttempts
	}
end, nil)(v9)