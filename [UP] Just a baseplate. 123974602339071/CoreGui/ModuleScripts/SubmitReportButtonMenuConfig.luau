-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Experience.SubmitReportButtonMenuConfig
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v_u_2 = game:GetService("MarketplaceService")
local v_u_3 = game:GetService("Players")
require(v1.Components.Types)
local v_u_4 = require(v1.Components.Constants)
local v_u_5 = require(v1.IXP.TnSIXPWrapper)
local v_u_6 = require(v1.ReportAnything.Utility.AbuseReportBuilder)
local v_u_7 = require(v1.Analytics.ReportAbuseAnalytics)
local v_u_8 = require(v1.MenuConfigs.getToastMessageFromAbuseReason)
return {
	["componentType"] = "button",
	["getIsVisible"] = nil,
	["variant"] = "primary",
	["getIconSrc"] = nil,
	["getButtonLabel"] = nil,
	["onClick"] = nil,
	["fieldLabel"] = "",
	["componentName"] = "SubmitButton",
	["getIsVisible"] = function(_) -- name: getIsVisible
		return true
	end,
	["getIconSrc"] = function(_) -- name: getIconSrc
		return ""
	end,
	["getButtonLabel"] = function(_) -- name: getButtonLabel
		return "SubmitButton"
	end,
	["onClick"] = function(p_u_9, _, p10) -- name: onClick
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_2
		local v_u_11 = p_u_9.abuseReason
		if v_u_11 ~= nil and v_u_3.LocalPlayer ~= nil then
			if v_u_5.getReportAnythingExperienceEnabled() then
				local v12 = v_u_6.buildExperienceReportRequest({
					["localUserId"] = v_u_3.LocalPlayer.UserId,
					["placeId"] = game.PlaceId,
					["abuseComment"] = p_u_9.comment,
					["abuseReason"] = v_u_11,
					["menuEntryPoint"] = v_u_7:getAbuseReportSessionEntryPoint(),
					["variant"] = v_u_6.Constants.Variant.NM
				}, p10.reportAnythingState, p10.reportAnythingAnalytics.getAccumulatedParameters())
				v_u_3:ReportAbuseV3(v_u_3.LocalPlayer, v12)
				p10.analyticsDispatch({
					["type"] = v_u_4.AnalyticsActions.SetSubmissionCompleted
				})
				local v13 = v_u_8(v_u_11, true)
				p10.onReportComplete(v13)
				return
			end
			spawn(function()
				-- upvalues: (ref) v_u_2, (copy) p_u_9, (ref) v_u_3, (copy) v_u_11
				local v14 = game.PlaceId
				local v15 = tostring(v14)
				local v_u_16 = "N/A"
				local v_u_17 = "N/A"
				local function v19()
					-- upvalues: (ref) v_u_2, (ref) v_u_16, (ref) v_u_17
					local v18 = v_u_2:GetProductInfoAsync(game.PlaceId, Enum.InfoType.Asset)
					v_u_16 = v18.Name
					v_u_17 = v18.Description
				end
				pcall(v19)
				v_u_3:ReportAbuse(nil, v_u_11, (string.format("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", p_u_9.comment, v_u_16, v15, v_u_17)))
			end)
			p10.analyticsDispatch({
				["type"] = v_u_4.AnalyticsActions.SetSubmissionCompleted
			})
			local v20 = v_u_8(v_u_11)
			p10.onReportComplete(v20)
		end
	end
}