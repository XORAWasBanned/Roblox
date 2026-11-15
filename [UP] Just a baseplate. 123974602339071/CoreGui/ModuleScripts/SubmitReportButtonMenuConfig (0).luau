-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Players.SubmitReportButtonMenuConfig
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("Players")
local v4 = game:GetService("CoreGui").RobloxGui
require(v1.Components.Types)
local v_u_5 = require(v1.MenuConfigs.getToastMessageFromAbuseReason)
local v_u_6 = require(v4.Modules.VoiceChat.createVoiceAbuseReportRequest)
local v_u_7 = require(v4.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_8 = require(v1.ReportAnything.Utility.AbuseReportBuilder)
local v_u_9 = require(v1.Analytics.ReportAbuseAnalytics)
local v_u_10 = require(v1.Components.Constants)
local v_u_11 = require(v1.IXP.TnSIXPWrapper)
local v_u_12 = require(v2.Packages.Cryo)
function isEligibleForVoiceSubmit(p13, p14) -- name: isEligibleForVoiceSubmit
	-- upvalues: (copy) v_u_3
	local v15
	if p13.allegedAbuser == nil or (p13.allegedAbuserId == nil or (p13.abuseReason == nil or (p13.methodOfAbuse == nil or p14.analyticsState.menuOpenedUnixTimestampMilliseconds == nil))) then
		v15 = false
	else
		v15 = v_u_3.LocalPlayer ~= nil
	end
	return v15
end
function isEligibleForRAOtherSubmit(p16) -- name: isEligibleForRAOtherSubmit
	-- upvalues: (copy) v_u_3
	local v17
	if p16.allegedAbuser == nil or (p16.allegedAbuserId == nil or p16.abuseReason == nil) then
		v17 = false
	else
		v17 = v_u_3.LocalPlayer ~= nil
	end
	return v17
end
function isEligibleForTextSubmit(p18) -- name: isEligibleForTextSubmit
	local v19
	if p18.allegedAbuser == nil then
		v19 = false
	else
		v19 = p18.abuseReason ~= nil
	end
	return v19
end
return {
	["componentType"] = "button",
	["getIsVisible"] = nil,
	["variant"] = "primary",
	["getIconSrc"] = nil,
	["getButtonLabel"] = nil,
	["getIsDisabled"] = nil,
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
	["getIsDisabled"] = function(p20, p21) -- name: getIsDisabled
		-- upvalues: (copy) v_u_10, (copy) v_u_11
		local v22 = p20.methodOfAbuse
		if v22 == v_u_10.AbuseMethods.VoiceChat then
			return not isEligibleForVoiceSubmit(p20, p21)
		elseif v22 == v_u_10.AbuseMethods.TextChat or (v22 == nil or v22 == v_u_10.AbuseMethods.Other and not v_u_11.getReportAnythingAvatarEnabled()) then
			return not isEligibleForTextSubmit(p20)
		elseif v22 == v_u_10.AbuseMethods.Other or v22 == v_u_10.AbuseMethods.Avatar then
			return not isEligibleForRAOtherSubmit(p20)
		else
			return false
		end
	end,
	["onClick"] = function(p_u_23, _, p_u_24) -- name: onClick
		-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_3, (copy) v_u_7, (copy) v_u_12, (copy) v_u_11, (copy) v_u_5, (copy) v_u_8, (copy) v_u_9
		local v_u_25 = p_u_23.allegedAbuser
		local v_u_26 = p_u_23.allegedAbuserId
		local v_u_27 = p_u_23.abuseReason
		local v_u_28 = p_u_23.methodOfAbuse
		local v_u_29 = p_u_24.analyticsState.menuOpenedUnixTimestampMilliseconds
		if v_u_28 == v_u_10.AbuseMethods.VoiceChat then
			if isEligibleForVoiceSubmit(p_u_23, p_u_24) then
				local function v32()
					-- upvalues: (ref) v_u_6, (ref) v_u_3, (ref) v_u_7, (copy) v_u_26, (copy) p_u_23, (copy) v_u_27, (copy) v_u_29, (ref) v_u_12, (ref) v_u_10, (copy) p_u_24, (copy) v_u_25
					task.spawn(function()
						-- upvalues: (ref) v_u_6, (ref) v_u_3, (ref) v_u_7, (ref) v_u_26, (ref) p_u_23, (ref) v_u_27, (ref) v_u_29, (ref) v_u_12, (ref) v_u_10, (ref) p_u_24, (ref) v_u_25
						local v31 = v_u_6(v_u_3, v_u_7, {
							["localUserId"] = v_u_3.LocalPlayer.UserId,
							["abuserUserId"] = v_u_26,
							["abuseComment"] = p_u_23.comment,
							["abuseReason"] = v_u_27,
							["inExpMenuOpenedUnixMilli"] = v_u_29,
							["sortedPlayerListUserIds"] = v_u_12.List.map(p_u_23.playerObjects, function(p30)
								return p30.UserId
							end),
							["abuseVector"] = v_u_10.AbuseVector.Voice
						})
						v_u_3:ReportAbuseV3(v_u_3.LocalPlayer, v31)
						p_u_24.analyticsDispatch({
							["type"] = v_u_10.AnalyticsActions.SetSubmissionCompleted
						})
						p_u_24.showReportSentPage(v_u_25)
					end)
				end
				pcall(v32)
				return
			end
		elseif v_u_28 == v_u_10.AbuseMethods.TextChat or v_u_28 == v_u_10.AbuseMethods.Other and not v_u_11.getReportAnythingAvatarEnabled() or v_u_28 == nil then
			if isEligibleForTextSubmit(p_u_23) then
				spawn(function()
					-- upvalues: (ref) v_u_3, (copy) v_u_25, (copy) v_u_27, (copy) p_u_23
					v_u_3:ReportAbuse(v_u_25, v_u_27, p_u_23.comment)
				end)
				p_u_24.analyticsDispatch({
					["type"] = v_u_10.AnalyticsActions.SetSubmissionCompleted
				})
				local v33 = v_u_5(v_u_27)
				p_u_24.onReportComplete(v33)
				return
			end
		elseif (v_u_28 == v_u_10.AbuseMethods.Other or v_u_28 == v_u_10.AbuseMethods.Avatar) and isEligibleForRAOtherSubmit(p_u_23) then
			local function v36()
				-- upvalues: (ref) v_u_8, (ref) v_u_3, (copy) v_u_26, (copy) p_u_23, (copy) v_u_27, (ref) v_u_9, (copy) p_u_24, (copy) v_u_28, (ref) v_u_10, (ref) v_u_5
				task.spawn(function()
					-- upvalues: (ref) v_u_8, (ref) v_u_3, (ref) v_u_26, (ref) p_u_23, (ref) v_u_27, (ref) v_u_9, (ref) p_u_24, (ref) v_u_28, (ref) v_u_10, (ref) v_u_5
					local v34 = v_u_8.buildOtherReportRequest({
						["localUserId"] = v_u_3.LocalPlayer.UserId,
						["formSelectedAbuserUserId"] = v_u_26,
						["abuseComment"] = p_u_23.comment,
						["abuseReason"] = v_u_27,
						["menuEntryPoint"] = v_u_9:getAbuseReportSessionEntryPoint(),
						["variant"] = v_u_8.Constants.Variant.NM
					}, p_u_24.reportAnythingState, p_u_24.reportAnythingAnalytics.getAccumulatedParameters())
					if game:GetEngineFeature("WHAM2165") and v_u_28 == v_u_10.AbuseMethods.Avatar then
						v_u_3:ReportAvatarAbuse(v_u_26, v34)
					else
						v_u_3:ReportAbuseV3(v_u_3.LocalPlayer, v34)
					end
					p_u_24.analyticsDispatch({
						["type"] = v_u_10.AnalyticsActions.SetSubmissionCompleted
					})
					local v35 = v_u_5(v_u_27, true)
					p_u_24.onReportComplete(v35)
				end)
			end
			pcall(v36)
		end
	end
}