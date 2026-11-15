-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.FeedbackApp
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v_u_4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.Foundation).Enums.ColorMode
local v6 = require(v1.Packages.t)
local v7 = script.Parent.Parent
local v_u_8 = v_u_4.Core.Style.withStyle
local v_u_9 = v_u_4.App.Style.AppStyleProvider
local v_u_10 = v5.Dark
local v_u_11 = require(v7.Actions.SetFeedbackFlowState)
local v_u_12 = require(v7.Actions.SetScreenSize)
local v_u_13 = require(v1.Workspace.Packages.Localization).withLocalization
local v_u_14 = require(v7.Resources.Assets)
local v_u_15 = require(v7.Components.FeedbackReportDialog)
local v_u_16 = require(v7.Components.RefinedFeedbackBar)
local v_u_17 = require(v7.Components.FeedbackSubmissionToast)
local v_u_18 = require(v7.Components.HelpModal)
local v_u_19 = require(v7.Components.OnboardingModal)
local v_u_20 = require(v1.Workspace.Packages.SharedFlags).FFlagInExperienceUseAppStyleProvider
local v21 = v_u_2.PureComponent:extend("FeedbackApp")
v21.validateProps = v6.strictInterface({
	["setScreenGuiSize"] = v6.callback
})
function v21.render(p22) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_20, (copy) v_u_9, (copy) v_u_4, (copy) v_u_10, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_15, (copy) v_u_13, (copy) v_u_8, (copy) v_u_16, (copy) v_u_14
	local v23 = v_u_2.createElement
	local v24
	if v_u_20 then
		v24 = v_u_9
	else
		v24 = v_u_4.Core.Style.Provider
	end
	return v23(v24, v_u_20 and {
		["style"] = {
			["themeName"] = v_u_10
		}
	} or {}, {
		["Gui"] = v_u_2.createElement("ScreenGui", {
			["AutoLocalize"] = false,
			["IgnoreGuiInset"] = true,
			["OnTopOfCoreBlur"] = true,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
			[v_u_2.Change.AbsoluteSize] = p22.props.setScreenGuiSize
		}, {
			["ScreenFrame"] = v_u_2.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["ZIndex"] = 10,
				["Size"] = UDim2.new(1, 0, 1, 0)
			}, {
				["FeedbackSubmissionToast"] = v_u_2.createElement(v_u_17),
				["HelpModal"] = v_u_2.createElement(v_u_18),
				["OnboardingModal"] = v_u_2.createElement(v_u_19),
				["FeedbackReportDialog"] = v_u_2.createElement(v_u_15)
			}),
			["RefinedFeedbackBar"] = v_u_13({
				["feedbackBarText"] = "CoreScripts.Feedback.FeedbackBar.MainLabel"
			})(function(p_u_25)
				-- upvalues: (ref) v_u_8, (ref) v_u_2, (ref) v_u_16, (ref) v_u_14
				return v_u_8(function(p26)
					-- upvalues: (ref) v_u_2, (ref) v_u_16, (copy) p_u_25, (ref) v_u_14
					local v27 = p26.Font
					local v28 = v_u_2.createElement
					local v29 = v_u_16
					local v30 = {
						["leftHint"] = {
							["text"] = nil,
							["hintTextSize"] = nil,
							["maxWidth"] = 200,
							["icon"] = nil,
							["text"] = p_u_25.feedbackBarText,
							["hintTextSize"] = v27.BaseSize * v27.Body.RelativeSize,
							["icon"] = v_u_14.Images.FeedbackBarHintIcon
						}
					}
					return v28(v29, v30, {})
				end)
			end)
		})
	})
end
return v3.connect(function() end, function(p_u_31)
	-- upvalues: (copy) v_u_12, (copy) v_u_11
	return {
		["setScreenGuiSize"] = function(p32) -- name: setScreenGuiSize
			-- upvalues: (copy) p_u_31, (ref) v_u_12
			p_u_31(v_u_12(p32.AbsoluteSize))
		end,
		["setFeedbackFlowState"] = function(p_u_33) -- name: setFeedbackFlowState
			-- upvalues: (copy) p_u_31, (ref) v_u_11
			p_u_31(function(p34)
				-- upvalues: (ref) v_u_11, (copy) p_u_33
				p34:dispatch(v_u_11(p_u_33))
			end)
		end
	}
end)(v21)