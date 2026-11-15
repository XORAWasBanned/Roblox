-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Players.AbuseReasonModalSelectorMenuConfig
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Components.Constants)
require(v1.Components.Types)
local v_u_4 = require(v2.Packages.Cryo)
return {
	["componentType"] = "modalSelector",
	["getIsVisible"] = nil,
	["getMenuItems"] = nil,
	["getSelectedValue"] = nil,
	["onUpdateSelectedOption"] = nil,
	["fieldLabel"] = "ReasonForAbuse",
	["componentName"] = "AbuseReason",
	["getIsVisible"] = function(_) -- name: getIsVisible
		return true
	end,
	["getMenuItems"] = function(p5, p_u_6) -- name: getMenuItems
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		local v7
		if p5.methodOfAbuse == v_u_3.AbuseMethods.VoiceChat then
			v7 = v_u_3.PlayerVoiceAbuseTypes
		else
			v7 = v_u_3.PlayerAbuseTypes
		end
		local v8 = v_u_4.Dictionary.values(v7)
		return v_u_4.List.map(v8, function(p9)
			-- upvalues: (copy) p_u_6
			return {
				["label"] = p_u_6[p9],
				["identifier"] = p9
			}
		end)
	end,
	["getSelectedValue"] = function(p10) -- name: getSelectedValue
		return p10.abuseReason
	end,
	["onUpdateSelectedOption"] = function(p11, _, p12, p13) -- name: onUpdateSelectedOption
		-- upvalues: (copy) v_u_3
		p13.analyticsDispatch({
			["type"] = v_u_3.AnalyticsActions.IncrementReasonChanged
		})
		p13.analyticsDispatch({
			["type"] = v_u_3.AnalyticsActions.SetReasonSelection,
			["selection"] = p11.identifier
		})
		p12({
			["type"] = v_u_3.PlayerMenuActions.UpdateAbuseReason,
			["abuseReason"] = p11.identifier
		})
	end
}