-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Players.MethodOfAbuseModalMenuConfig
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CoreGui")
require(v1.Components.Types)
local v3 = game:GetService("CorePackages")
local v_u_4 = require(v1.Components.Constants)
local v_u_5 = require(v1.Utility.getAvailableMethodsOfAbuse)
local v_u_6 = require(v1.IXP.TnSIXPWrapper)
local v7 = v2.RobloxGui
local v_u_8 = require(v7.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_9 = require(v3.Packages.Cryo)
return {
	["componentType"] = "modalSelector",
	["getIsVisible"] = nil,
	["getMenuItems"] = nil,
	["getSelectedValue"] = nil,
	["onUpdateSelectedOption"] = nil,
	["fieldLabel"] = "MethodOfAbuse",
	["componentName"] = "MethodOfAbuse",
	["getIsVisible"] = function(p10) -- name: getIsVisible
		-- upvalues: (copy) v_u_6
		return p10.isVoiceEnabled or v_u_6.getReportAnythingAvatarEnabled()
	end,
	["getMenuItems"] = function(p11) -- name: getMenuItems
		-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6
		local v12 = p11.isVoiceEnabled
		if v12 then
			v12 = not v_u_9.isEmpty(v_u_8:getRecentUsersInteractionData())
		end
		return v_u_5(v12, v_u_6.getReportAnythingAvatarEnabled())
	end,
	["getSelectedValue"] = function(p13) -- name: getSelectedValue
		return p13.methodOfAbuse
	end,
	["onUpdateSelectedOption"] = function(p14, p15, p16, p17) -- name: onUpdateSelectedOption
		-- upvalues: (copy) v_u_4
		p16({
			["type"] = v_u_4.PlayerMenuActions.UpdateMethodOfAbuse,
			["methodOfAbuse"] = p14.identifier
		})
		if p14.identifier ~= p15.methodOfAbuse then
			p17.reportAnythingDispatch({
				["type"] = v_u_4.ReportAnythingActions.ClearAnnotationFlowProperties
			})
			p17.analyticsDispatch({
				["type"] = v_u_4.AnalyticsActions.IncrementTypeofabuseChanged
			})
			p17.analyticsDispatch({
				["type"] = v_u_4.AnalyticsActions.SetTypeOfAbuseSelection,
				["selection"] = p14.identifier
			})
		end
	end
}