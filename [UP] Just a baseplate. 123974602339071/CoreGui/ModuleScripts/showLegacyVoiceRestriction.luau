-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Helpers.showLegacyVoiceRestriction
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("LocalizationService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(script.Parent.buildLegacyVoiceRestrictionDetail)
require(v1.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local v_u_5 = require(script.Parent.getRestrictionType)
local v6 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_7 = require(v1.Workspace.Packages.UniversalFeatureRestrictions)
local v_u_8 = require(v1.Workspace.Packages.VoiceChat)
local v_u_9 = v6.new(v2.RobloxLocaleId)
local function v_u_12(p10, p11) -- name: format
	-- upvalues: (copy) v_u_9
	return v_u_9:Format(p10, p11)
end
return function(p13) -- name: showLegacyVoiceRestriction
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_12, (copy) v_u_8, (copy) v_u_7
	local v14 = v_u_3.LocalPlayer
	if v14 then
		local v_u_15 = v14.UserId
		local v_u_16 = p13.manager
		local v17 = p13.settings
		local v_u_18 = p13.trigger
		local v_u_19 = p13.isCurrent
		local v_u_20 = not v_u_16.service and "" or v_u_16.previousSessionId
		local v_u_21 = v_u_16.Analytics
		local v_u_22 = v_u_5(v17)
		local v_u_23
		if v17 then
			v_u_23 = v17.banReason
		else
			v_u_23 = nil
		end
		local v_u_24, v_u_25
		if v17 then
			v_u_24 = nil
			v_u_25 = nil
		else
			v_u_24, v_u_25 = v_u_16:GetNudgeAnalyticsData()
		end
		local v26 = v_u_4({
			["settings"] = v17,
			["userId"] = v_u_15,
			["now"] = DateTime.now().UnixTimestamp,
			["format"] = v_u_12
		})
		local v_u_27 = false
		local v_u_28 = false
		local v_u_29 = false
		local function v30() -- name: onShown
			-- upvalues: (ref) v_u_29, (copy) v_u_22, (copy) v_u_21, (copy) v_u_23, (copy) v_u_15, (copy) v_u_20
			if not v_u_29 then
				v_u_29 = true
				if v_u_22 ~= "Nudge" then
					v_u_21:reportBanMessageEvent("Shown")
					v_u_21:reportBanMessageEventV2("Shown", v_u_23, v_u_15, v_u_20)
				end
			end
		end
		local function v31() -- name: onAppeal
			-- upvalues: (ref) v_u_28, (copy) v_u_22, (copy) v_u_21, (ref) v_u_24, (ref) v_u_25, (copy) v_u_23, (copy) v_u_15, (copy) v_u_20
			v_u_28 = true
			if v_u_22 == "Nudge" then
				v_u_21:reportDeniedNudge(v_u_24, v_u_25)
			else
				v_u_21:reportBanMessageEvent("Denied")
				v_u_21:reportBanMessageEventV2("Denied", v_u_23, v_u_15, v_u_20)
			end
		end
		local function v37() -- name: onDismiss
			-- upvalues: (ref) v_u_27, (copy) v_u_22, (copy) v_u_18, (copy) v_u_19, (ref) v_u_8, (copy) v_u_16, (copy) v_u_21, (ref) v_u_24, (ref) v_u_25, (ref) v_u_28, (copy) v_u_23, (copy) v_u_15, (copy) v_u_20
			if not v_u_27 then
				v_u_27 = true
				local v32 = v_u_22 == "TemporaryBan" and true or v_u_22 == "NudgeBan"
				if v_u_18 ~= "micTap" and (v32 and v_u_19()) then
					v_u_8.PostInformedOfBan(function(p33, p34, p35)
						-- upvalues: (ref) v_u_16
						return v_u_16:PostRequest(p33, p34, p35)
					end, true)
				end
				if v_u_22 == "Nudge" then
					v_u_21:reportClosedNudge(v_u_24, v_u_25)
					if not v_u_28 then
						v_u_21:reportAcknowledgedNudge(v_u_24, v_u_25)
						return
					end
				elseif not v_u_28 then
					local v36 = v_u_22 == "NudgeBan" and "Understood" or "Acknowledged"
					v_u_21:reportBanMessageEvent(v36)
					v_u_21:reportBanMessageEventV2(v36, v_u_23, v_u_15, v_u_20)
				end
			end
		end
		local v38 = v_u_7.showFeatureRestrictionDirect
		local v39 = v_u_7.AbuseVector.Voice
		local v40 = {
			["onShown"] = v30,
			["onDismiss"] = v37
		}
		if v_u_22 ~= "Nudge" and v_u_22 ~= "NudgeBan" then
			v31 = nil
		end
		v40.onAppeal = v31
		v38(v39, v26, v40)
	end
end