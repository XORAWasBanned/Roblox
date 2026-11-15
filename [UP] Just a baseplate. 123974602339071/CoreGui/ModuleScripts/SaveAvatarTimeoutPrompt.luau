-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.SaveAvatarTimeoutPrompt
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.SignalsReact).useSignalState
local v_u_4 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_5 = require(v1.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local v6 = require(v1.Workspace.Packages.AvatarExperienceCommon)
local v_u_7 = v6.Components.AXPartialPageModal
local v_u_8 = v6.Stores.getTimeoutStatusStore
local v_u_9 = v6.Utils.formatTimeoutEndTime
local v_u_10 = v6.Constants.LabelAbuseTypeMapping
local v11 = require(v1.Packages.Foundation)
local v_u_12 = v11.View
local v_u_13 = v11.Text
local v_u_14 = v11.Enums.ButtonVariant
local v_u_15 = v11.Enums.InputSize
local v16 = script.Parent.Parent.Parent
local v_u_17 = require(v16.Thunks.CloseOpenPrompt)
return function() -- name: SaveAvatarTimeoutPrompt
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_3, (copy) v_u_2, (copy) v_u_17, (copy) v_u_10, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_14, (copy) v_u_15, (copy) v_u_12, (copy) v_u_13
	local v_u_18 = v_u_5()
	local v19 = v_u_3(v_u_8().getTimeoutDetails)
	local v20 = v_u_2.useCallback(function()
		-- upvalues: (copy) v_u_18, (ref) v_u_17
		v_u_18(v_u_17)
	end, { v_u_18 })
	local v21 = v_u_4
	local v22 = {
		["titleText"] = "Feature.Timeout.Prompt.SaveTitleText",
		["bodyText"] = nil,
		["closeText"] = "Feature.Timeout.Label.OK",
		["bodyText"] = {
			"Feature.Timeout.Prompt.BodyText",
			["rule"] = v_u_4({
				["rule"] = v19 and v_u_10 and (v_u_10[v19.labelTranslationKey] or "Feature.NotApproved.Label.AbuseType.Other") or "Feature.NotApproved.Label.AbuseType.Other"
			}).rule or "",
			["time"] = not v19 and "" or v_u_9(v19.endDate)
		}
	}
	local v23 = v21(v22)
	local v24 = v_u_2.createElement
	local v25 = v_u_7
	local v26 = {
		["onBackgroundPress"] = v20,
		["buttonStackProps"] = {
			["rowLayout"] = false,
			["buttons"] = nil,
			["buttons"] = {
				{
					["props"] = {
						["onActivated"] = v20,
						["text"] = v23.closeText,
						["variant"] = v_u_14.Standard,
						["size"] = v_u_15.Medium
					}
				}
			}
		}
	}
	return v24(v25, v26, {
		["ViewFrame"] = v_u_2.createElement(v_u_12, {
			["tag"] = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
		}, {
			["PromptBodyTitle"] = v_u_2.createElement(v_u_13, {
				["tag"] = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
				["Text"] = nil,
				["LayoutOrder"] = 2,
				["Text"] = v23.titleText
			}),
			["PromptBodyText"] = v_u_2.createElement(v_u_13, {
				["tag"] = "auto-xy text-align-x-left text-body-large text-wrap font-family-code",
				["Text"] = nil,
				["LayoutOrder"] = 3,
				["Text"] = v23.bodyText
			})
		})
	})
end