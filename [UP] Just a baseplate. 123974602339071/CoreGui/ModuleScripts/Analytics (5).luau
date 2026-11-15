-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Analytics
local v_u_1 = game:GetService("RbxAnalyticsService")
game:DefineFastInt("LuaVoiceChatAnalyticsPointsThrottle", 0)
game:DefineFastFlag("LuaVoiceChatAnalyticsUsePointsV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsUseCounterV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsUseEventsV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsBanMessage", true)
game:DefineFastFlag("LuaVoiceChatReconnectMissedSequence", false)
local v_u_2 = {}
v_u_2.__index = v_u_2
v_u_2.INFO = "info"
v_u_2.WARNING = "warning"
v_u_2.ERROR = "error"
function v_u_2.new(p3) -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v4 = p3 or v_u_1
	assert(v4, "Analytics impl must not be nil.")
	local v5 = v_u_2
	return setmetatable({
		["_impl"] = v4
	}, v5)
end
local function v_u_6() -- name: stub end
function v_u_2.stubService() -- name: stubService
	-- upvalues: (copy) v_u_6
	return {
		["SetRBXEvent"] = v_u_6,
		["SetRBXEventStream"] = v_u_6,
		["SendEventDeferred"] = v_u_6,
		["ReportCounter"] = v_u_6,
		["ReportStats"] = v_u_6,
		["ReportInfluxSeries"] = v_u_6
	}
end
function v_u_2.setImpl(p7, p8) -- name: setImpl
	p7._impl = p8
end
function v_u_2._report(p9, p10, p11, p12, p13) -- name: _report
	local v14 = p10 .. "-" .. p11
	if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
		p9._impl:ReportInfluxSeries(v14, p13, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"))
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
		if p12 then
			v14 = v14 .. "-" .. p12
		end
		if p13 and p13.result then
			v14 = v14 .. "-" .. p13.result
		end
		p9._impl:ReportCounter(v14, 1)
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
		p9._impl:SendEventDeferred("client", p10, p11, p13)
	end
end
function v_u_2.reportVoiceChatJoinResult(p15, p16, p17, p18) -- name: reportVoiceChatJoinResult
	-- upvalues: (copy) v_u_2
	p15:_report("voiceChat", "defaultChannelJoinResults", p17, {
		["success"] = p16,
		["result"] = p17,
		["logLevel"] = p18 or v_u_2.INFO
	})
end
function v_u_2.reportBanMessageEvent(p19, p20) -- name: reportBanMessageEvent
	if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
		p19._impl:ReportCounter("voiceChat-reportBanMessage" .. p20, 1)
	end
end
function v_u_2.reportBanMessageEventV2(p21, p22, p23, p24, p25) -- name: reportBanMessageEventV2
	p21:_report("voiceChat", "reportBanEvent", nil, {
		["eventType"] = p22,
		["banReason"] = p23,
		["userId"] = p24,
		["voiceSessionId"] = p25
	})
end
function v_u_2.reportReconnectDueToMissedSequence(p26) -- name: reportReconnectDueToMissedSequence
	if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
		p26._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1)
	end
end
function v_u_2.reportOutOfOrderSequence(p27) -- name: reportOutOfOrderSequence
	p27._impl:ReportCounter("voiceChat-outOfOrderSequence", 1)
end
function v_u_2.reportClosedNudge(p28, p29, p30) -- name: reportClosedNudge
	p28._impl:ReportCounter("voicechat-closednudge", 1)
	p28._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		["userId"] = nil,
		["voiceSessionId"] = nil,
		["closeType"] = "CLOSED",
		["userId"] = p29,
		["voiceSessionId"] = p30
	})
end
function v_u_2.reportAcknowledgedNudge(p31, p32, p33) -- name: reportAcknowledgedNudge
	p31._impl:ReportCounter("voicechat-acknowledgednudge", 1)
	p31._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		["userId"] = nil,
		["voiceSessionId"] = nil,
		["closeType"] = "ACKNOWLEDGED",
		["userId"] = p32,
		["voiceSessionId"] = p33
	})
end
function v_u_2.reportDeniedNudge(p34, p35, p36) -- name: reportDeniedNudge
	p34._impl:ReportCounter("voicechat-deniednudge", 1)
	p34._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		["userId"] = nil,
		["voiceSessionId"] = nil,
		["closeType"] = "DENIED",
		["userId"] = p35,
		["voiceSessionId"] = p36
	})
end
function v_u_2.reportVoiceMuteIndividual(p37, p38) -- name: reportVoiceMuteIndividual
	p37._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
		["user_id"] = p38.userId,
		["client_session_id"] = p38.clientSessionId,
		["target_user_id"] = p38.targetUserId,
		["channel_id"] = p38.channelId,
		["context"] = p38.context,
		["muted"] = p38.muted
	})
end
function v_u_2.reportVoiceMuteGroup(p39, p40) -- name: reportVoiceMuteGroup
	p39._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
		["user_id"] = p40.userId,
		["client_session_id"] = p40.clientSessionId,
		["channel_id"] = p40.channelId,
		["context"] = p40.context,
		["group_type"] = p40.groupType,
		["muted"] = p40.muted
	})
end
function v_u_2.reportVoiceMuteSelf(p41, p42) -- name: reportVoiceMuteSelf
	p41._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
		["user_id"] = p42.userId,
		["client_session_id"] = p42.clientSessionId,
		["channel_id"] = p42.channelId,
		["context"] = p42.context,
		["muted"] = p42.muted
	})
end
function v_u_2.reportJoinVoiceButtonEvent(p43, p44, p45, p46, p47, p48, p49) -- name: reportJoinVoiceButtonEvent
	p43._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		["eventType"] = p44,
		["universeId"] = p45,
		["placeId"] = p46,
		["playSessionId"] = p47,
		["buttonContext"] = p48,
		["buttonConsequence"] = p49
	})
end
function v_u_2.reportJoinVoiceButtonEventWithVoiceSessionId(p50, p51, p52, p53, p54, p55, p56, p57) -- name: reportJoinVoiceButtonEventWithVoiceSessionId
	p50._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		["eventType"] = p51,
		["universeId"] = p52,
		["placeId"] = p53,
		["playSessionId"] = p54,
		["voiceSessionId"] = p55,
		["buttonContext"] = p56,
		["buttonConsequence"] = p57
	})
end
function v_u_2.reportLeaveVoiceButtonEvent(p58, p59, p60, p61, p62, p63) -- name: reportLeaveVoiceButtonEvent
	p58._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
		["eventType"] = p59,
		["universeId"] = p60,
		["placeId"] = p61,
		["playSessionId"] = p62,
		["voiceSessionId"] = p63
	})
end
function v_u_2.reportInExpConsent(p64, p65, p66, p67, p68, p69) -- name: reportInExpConsent
	p64._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
		["eventType"] = p65,
		["entry"] = p66,
		["universeId"] = p67,
		["placeId"] = p68,
		["playSessionId"] = p69
	})
end
function v_u_2.reportDevicePermissionsModalEvent(p70, p71, p72, p73, p74, p75) -- name: reportDevicePermissionsModalEvent
	local v76 = #p75 - 1
	local v77 = {
		["eventType"] = p71,
		["universeId"] = p73,
		["placeId"] = p74,
		["playSessionId"] = string.sub(p75, 2, v76),
		["voiceSessionId"] = p72
	}
	p70._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", v77)
end
function v_u_2.reportConnectDisconnectEvents(p78, p79, p80) -- name: reportConnectDisconnectEvents
	p78._impl:SendEventDeferred("client", "voiceChat", p79, p80)
end
return v_u_2