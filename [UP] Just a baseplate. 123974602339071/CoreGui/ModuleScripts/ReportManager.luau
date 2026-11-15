-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Utility.ReportManager
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("HttpRbxApiService")
local v3 = v1:WaitForChild("RobloxGui")
local v_u_4 = game:GetService("Players")
local v5 = game:GetService("CorePackages")
local v_u_6 = game:GetService("RunService")
require(v5.Packages.Dash)
local v_u_7 = require(v3.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_8 = require(v3.Modules.VoiceChat.createVoiceAbuseReportRequest)
local v_u_9 = require(v5.Workspace.Packages.CoreScriptsCommon).Url
local v10 = script.Parent.Parent
local v_u_11 = require(v10.Resources.Constants)
local v_u_12 = require(v10.Utility.SendAnalytics)
local v_u_13 = require(v10.Utility.SessionUtility)
function sendAnalytics(p14, p15, p16, p17) -- name: sendAnalytics
	-- upvalues: (copy) v_u_12, (copy) v_u_11
	v_u_12(p14, v_u_11.Analytics.ReportSubmittedName, {
		["reportType"] = p14,
		["reportedEntityId"] = tostring(p15),
		["reportSource"] = v_u_11.Analytics.ReportSourceInGame,
		["reason"] = p16,
		["abuseVector"] = p17
	})
end
function getAbuseVectorFromReportCategory(p18) -- name: getAbuseVectorFromReportCategory
	-- upvalues: (copy) v_u_11
	return p18 == v_u_11.Category.Voice and "voice" or (p18 == v_u_11.Category.Text and "chat" or "other")
end
function submitUserAbuseReport(p_u_19, p_u_20) -- name: submitUserAbuseReport
	-- upvalues: (copy) v_u_11, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_2, (copy) v_u_13
	local v_u_21 = p_u_19.reportCategory == v_u_11.Category.Voice
	local v_u_22 = v_u_4.LocalPlayer
	if v_u_22 then
		local function v30()
			-- upvalues: (copy) p_u_19, (copy) v_u_21, (ref) v_u_8, (ref) v_u_4, (ref) v_u_7, (copy) v_u_22, (ref) v_u_9, (ref) v_u_2, (ref) v_u_11, (ref) v_u_13, (copy) p_u_20
			coroutine.wrap(function()
				-- upvalues: (ref) p_u_19, (ref) v_u_21, (ref) v_u_8, (ref) v_u_4, (ref) v_u_7, (ref) v_u_22, (ref) v_u_9, (ref) v_u_2, (ref) v_u_11, (ref) v_u_13, (ref) p_u_20
				local v23 = getAbuseVectorFromReportCategory(p_u_19.reportCategory)
				if v_u_21 then
					local v24 = v_u_8
					local v25 = v_u_4
					local v26 = v_u_7
					local v27 = {
						["localUserId"] = v_u_22.UserId,
						["abuserUserId"] = p_u_19.abusingPlayer.UserId,
						["abuseComment"] = p_u_19.comment,
						["abuseReason"] = p_u_19.reason
					}
					local v28 = p_u_19.beginningTimestamp * 1000
					v27.inExpMenuOpenedUnixMilli = math.floor(v28)
					v27.sortedPlayerListUserIds = p_u_19.sortedUserIds
					v27.abuseVector = v23
					local v29 = v24(v25, v26, v27)
					if game:GetEngineFeature("AbuseReportV3") then
						v_u_4:ReportAbuseV3(v_u_22, v29)
					else
						v_u_2:PostAsyncFullUrl(v_u_9.APIS_URL .. "/abuse-reporting/v2/abuse-report", v29)
					end
				else
					v_u_4:ReportAbuse(p_u_19.abusingPlayer, p_u_19.reason, p_u_19.comment)
				end
				sendAnalytics(v_u_11.Analytics.ReportTypeUser, p_u_19.abusingPlayer.UserId, p_u_19.reason, v23)
				v_u_13.endAbuseReportSession()
				if p_u_20 then
					p_u_20()
				end
			end)()
		end
		pcall(v30)
	end
end
function submitPlaceAbuseReport(p_u_31, p_u_32) -- name: submitPlaceAbuseReport
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_11, (copy) v_u_13
	if p_u_31.placeName ~= "" then
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_6, (copy) p_u_31, (ref) v_u_4, (ref) v_u_11, (ref) v_u_13, (copy) p_u_32
			if not v_u_6:IsStudio() then
				local v33 = string.format
				local v34 = p_u_31.comment
				local v35 = p_u_31.placeName
				local v36 = p_u_31.placeId
				local v37 = v33("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", v34, v35, tostring(v36), p_u_31.placeDescription)
				v_u_4:ReportAbuse(nil, p_u_31.reason, v37)
			end
			sendAnalytics(v_u_11.Analytics.ReportTypeGame, p_u_31.placeId, p_u_31.reason)
			v_u_13.endAbuseReportSession()
			if p_u_32 then
				p_u_32()
			end
		end)()
	end
end
return {
	["submitUserAbuseReport"] = submitUserAbuseReport,
	["submitPlaceAbuseReport"] = submitPlaceAbuseReport
}