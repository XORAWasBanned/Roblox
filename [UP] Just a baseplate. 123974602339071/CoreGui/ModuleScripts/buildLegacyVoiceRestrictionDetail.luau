-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Helpers.buildLegacyVoiceRestrictionDetail
local v1 = game:GetService("CorePackages")
require(v1.Workspace.Packages.ModerationCommon.Types)
require(v1.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
return function(p2) -- name: buildLegacyVoiceRestrictionDetail
	local v3 = p2.settings
	local v4 = p2.format
	local v5 = ""
	local v6, v7, v8
	if v3 then
		if v3.bannedUntil then
			local v9 = (v3.bannedUntil.Seconds - p2.now) / 60
			local v10 = math.ceil(v9)
			local v11 = math.max(1, v10)
			v6 = v4("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Suspended")
			v7 = v4(v11 == 1 and "Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Suspended.Minute" or "Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Suspended.Minutes", {
				["abuseVector"] = v4("Feature.UniversalFeatureRestrictions.AbuseVector.LabelName.Voice"),
				["number"] = v11
			})
			v5 = DateTime.fromUnixTimestamp(v3.bannedUntil.Seconds):ToIsoDate()
			v8 = "timeout"
		else
			v6 = v4("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Banned")
			v7 = v4("Feature.UniversalFeatureRestrictions.Generic.DialogTitle.Banned", {
				["abuseVector"] = v4("Feature.UniversalFeatureRestrictions.AbuseVector.Lowercase.LabelName.Voice")
			})
			v8 = "ban"
		end
	else
		v6 = v4("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Nudge")
		v7 = v4("Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Nudge", {
			["abuseVector"] = v4("Feature.UniversalFeatureRestrictions.AbuseVector.Lowercase.LabelName.Voice")
		})
		v8 = "nudge"
	end
	return {
		["punishmentId"] = 0,
		["punishedUserId"] = nil,
		["interventionId"] = "",
		["messageToUser"] = "",
		["title"] = nil,
		["body"] = nil,
		["punishmentTypeDescription"] = nil,
		["acknowledgeable"] = false,
		["beginDate"] = "",
		["endDate"] = nil,
		["badUtterances"] = nil,
		["context"] = nil,
		["verificationCategory"] = "",
		["consequenceTransparencyMessage"] = "",
		["showAppealsProcessLink"] = false,
		["isForeshadowingConsequenceEnabled"] = false,
		["showUGCAvatarGuidelinesLink"] = false,
		["labelTranslationKey"] = "",
		["punishedUserId"] = p2.userId,
		["title"] = v7,
		["body"] = v6,
		["punishmentTypeDescription"] = v8,
		["endDate"] = v5,
		["badUtterances"] = {},
		["context"] = {}
	}
end