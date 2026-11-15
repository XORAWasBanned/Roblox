-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Players.AbuseReasonMenuConfig
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Components.Constants)
require(v1.Components.Types)
local v_u_4 = require(v2.Packages.Cryo)
return {
	["componentType"] = "dropdown",
	["getIsVisible"] = nil,
	["getMenuItems"] = nil,
	["onUpdateSelectedOption"] = nil,
	["fieldLabel"] = "ReasonForAbuse",
	["componentName"] = "AbuseReason",
	["getIsVisible"] = function(_) -- name: getIsVisible
		return true
	end,
	["getMenuItems"] = function(p5) -- name: getMenuItems
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		local v6
		if p5.methodOfAbuse == "Voice Chat" then
			v6 = v_u_3.PlayerVoiceAbuseTypes
		else
			v6 = v_u_3.PlayerAbuseTypes
		end
		return v_u_4.Dictionary.values(v6)
	end,
	["onUpdateSelectedOption"] = function(p7, _, p8, p9) -- name: onUpdateSelectedOption
		-- upvalues: (copy) v_u_3
		p9.analyticsDispatch({
			["type"] = v_u_3.AnalyticsActions.IncrementReasonChanged
		})
		p9.analyticsDispatch({
			["type"] = v_u_3.AnalyticsActions.SetReasonSelection,
			["selection"] = p7
		})
		p8({
			["type"] = v_u_3.PlayerMenuActions.UpdateAbuseReason,
			["abuseReason"] = p7
		})
	end
}