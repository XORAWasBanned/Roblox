-- Path: CoreGui.RobloxGui.Modules.VoiceChat.createVoiceAbuseReportRequest
local v_u_1 = game:GetService("HttpService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Cryo)
require(script.Parent.VoiceChatServiceManager)
local v_u_4 = require(script.Parent.VoiceUsersByProximity).getSortedPlayers
return function(p5, p6, p7)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
	local v8 = p5:GetPlayerByUserId(p7.abuserUserId)
	local v9
	if v8 and (v8.Character and v8.Character.PrimaryPart) then
		v9 = v8.Character.PrimaryPart.Position
	else
		v9 = nil
	end
	local v10 = #v_u_3.Dictionary.values(p6.participants)
	local v11 = v9 and #v_u_4(p5, p6, v9, 160, nil, v8) or 0
	local v13 = v_u_3.List.map(p7.sortedPlayerListUserIds, function(p12)
		return {
			["data"] = tostring(p12)
		}
	end)
	local v14 = {}
	local v15 = {
		["ENTRY_POINT"] = {
			["valueList"] = {
				{
					["data"] = "in-experience"
				}
			}
		}
	}
	local v16 = {}
	local v17 = {}
	local v18 = {}
	local v19 = p7.localUserId
	v18.data = tostring(v19)
	__set_list(v17, 1, {v18})
	v16.valueList = v17
	v15.SUBMITTER_USER_ID = v16
	local v20 = {}
	local v21 = {}
	local v22 = {}
	local v23 = p7.abuserUserId
	v22.data = tostring(v23)
	__set_list(v21, 1, {v22})
	v20.valueList = v21
	v15.REPORT_TARGET_USER_ID = v20
	v15.REPORTED_ABUSE_CATEGORY = {
		["valueList"] = {
			{
				["data"] = p7.abuseReason
			}
		}
	}
	v15.REPORTER_COMMENT = {
		["valueList"] = {
			{
				["data"] = p7.abuseComment
			}
		}
	}
	v15.IS_PLACE_VOICE_ENABLED = {
		["valueList"] = {
			{
				["data"] = "true"
			}
		}
	}
	v15.VOICE_USER_IDS_FROM_CLIENT = {
		["valueList"] = v13
	}
	local v24 = {}
	local v25 = {}
	local v26 = {}
	local v27 = p7.inExpMenuOpenedUnixMilli
	v26.data = tostring(v27)
	__set_list(v25, 1, {v26})
	v24.valueList = v25
	v15.IN_EXP_MENU_OPENED_UNIX_MILLI = v24
	local v28 = {}
	local v29 = {}
	local v30 = {}
	local v31
	if game:GetEngineFeature("VoiceChatServiceExposesChannelId") then
		v31 = p6.service:GetChannelId()
	else
		v31 = p6.service:GetGroupId()
	end
	v30.data = tostring(v31)
	__set_list(v29, 1, {v30})
	v28.valueList = v29
	v15.VOICE_CHANNEL_ID = v28
	v15.VOICE_USER_COUNT = {
		["valueList"] = {
			{
				["data"] = tostring(v10)
			}
		}
	}
	v15.VOICE_IMPACTED_USER_COUNT = {
		["valueList"] = {
			{
				["data"] = tostring(v11)
			}
		}
	}
	v15.REPORTED_ABUSE_VECTOR = {
		["valueList"] = {
			{
				["data"] = p7.abuseVector
			}
		}
	}
	v14.tags = v15
	return v_u_1:JSONEncode(v14)
end