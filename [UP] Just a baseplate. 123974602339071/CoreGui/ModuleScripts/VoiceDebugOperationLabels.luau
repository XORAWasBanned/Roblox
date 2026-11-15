-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.VoiceDebugOperationLabels
local v_u_1 = {
	["ice"] = "ICE",
	["sdp"] = "SDP",
	["ssrc"] = "SSRC",
	["acs"] = "ACS",
	["rtc"] = "RTC"
}
local v_u_2 = { "State", "Operation", "Event" }
local function v_u_6(p3) -- name: stripTrailingSuffix
	-- upvalues: (copy) v_u_2
	for _, v4 in v_u_2 do
		local v5 = #p3 - #v4
		if v5 <= 0 or p3:sub(v5 + 1) ~= v4 then
			continue
		end
		return p3:sub(1, v5)
	end
	return p3
end
local function v_u_15(p7) -- name: splitPascalCase
	local v8 = ""
	local v9 = {}
	for v10 = 1, #p7 do
		local v11 = p7:sub(v10, v10)
		local v12 = p7:sub(v10 + 1, v10 + 1)
		v8 = v8 .. v11
		local v13 = v11:match("%u") ~= nil
		local v14 = v12:match("%u") ~= nil
		if v13 or not v14 then
			if not (v13 and (v14 and p7:sub(v10 + 2, v10 + 2):match("%l"))) then
				continue
			end
			v9[#v9 + 1] = v8
			v8 = ""
		else
			v9[#v9 + 1] = v8
			v8 = ""
		end
	end
	if v8 ~= "" then
		v9[#v9 + 1] = v8
	end
	return v9
end
local function v_u_20(p16) -- name: humanizeName
	-- upvalues: (copy) v_u_15, (copy) v_u_6, (copy) v_u_1
	local v17 = v_u_15(v_u_6(p16))
	for v18, v19 in v17 do
		v17[v18] = v_u_1[v19:lower()] or v19
	end
	return table.concat(v17, " ")
end
local v_u_21 = {
	["ClientJoinOperation"] = "Join",
	["ClientLeaveOperation"] = "Leave",
	["ClientPublishOperation"] = "Publish",
	["ClientSubscribeOperation"] = "Subscribe",
	["ClientMuteUnmuteOperation"] = "Mute/Unmute",
	["ClientPeerLocalMuteUnmuteOperation"] = "Peer Local Mute/Unmute",
	["ClientPeerRemoteMuteUnmuteOperation"] = "Peer Remote Mute/Unmute",
	["ClientCullingOperation"] = "Culling",
	["ClientICETrickleOperation"] = "ICE Trickle",
	["ClientTurnAuthOperation"] = "TURN Auth",
	["ClientSubscriberAudioQualityOperation"] = "Subscriber Audio Quality",
	["ClientVoiceRtcStatsOperation"] = "Voice RTC Stats",
	["ClientVoiceRtcStatsMonitorOperation"] = "Voice RTC Stats Monitor",
	["ClientVoiceWebrtcConnectionChangesOperation"] = "WebRTC Connection Changes",
	["ClientRebootOperation"] = "Reboot",
	["ClientContextParsingOperation"] = "Context Parsing",
	["ConnectOperation"] = "Connect"
}
local v_u_22 = {
	["ClientRetryJoin"] = "Client Retry Join",
	["ClientRetryJoinWithConfig"] = "Client Retry Join With Config",
	["VoiceChatplayerMuteStatusChangedEvent"] = "Player Mute Status Changed",
	["SubscribeStateChange"] = "Subscribe State Change",
	["PublishStateChange"] = "Publish State Change",
	["JoinedVoice"] = "Joined Voice",
	["JoinedVoiceV2"] = "Joined Voice V2",
	["PublishingHandshakeAcked"] = "Publishing Handshake Acked",
	["PublishingHandshakeCompleted"] = "Publishing Handshake Completed",
	["PublishingHandshakeInitiated"] = "Publishing Handshake Initiated",
	["PublishingHandshakeInitiatedWithBothSdp"] = "Publishing Handshake Initiated (Both SDP)",
	["PublishingHandshakeAckedWithBothSdp"] = "Publishing Handshake Acked (Both SDP)",
	["PublishingHandshakeInitiatedWithCompressedSdp"] = "Publishing Handshake Initiated (Compressed SDP)",
	["PublishingHandshakeAckedWithCompressedSdp"] = "Publishing Handshake Acked (Compressed SDP)",
	["UpdateTurnAuthInfoRequest"] = "Update TURN Auth Info Request",
	["ACSCleanup"] = "ACS Cleanup",
	["ReJoinedVoice"] = "Rejoined Voice",
	["ReJoinedVoiceV2"] = "Rejoined Voice V2",
	["UserTurnAuth"] = "User TURN Auth",
	["UserTurnAuthV2"] = "User TURN Auth V2",
	["FetchUserTurnAuthOperationFailed"] = "Fetch User TURN Auth Failed",
	["RelayCandidatesGathered"] = "Relay Candidates Gathered",
	["VoiceChatClientVoiceCapability"] = "Client Voice Capability",
	["VoiceChatClientVoiceCapabilityWithConfig"] = "Client Voice Capability (With Config)",
	["VoiceChatPlayerMuteStateChangedClientToServer"] = "Player Mute State Changed (Client to Server)",
	["VoiceChatPlayerMuteStateChangedServerToClient"] = "Player Mute State Changed (Server to Client)",
	["VoiceChatSampleTaggedEventClientToServer"] = "Sample Tagged Event (Client to Server)",
	["VoiceChatSampleTaggedEventServerToClient"] = "Sample Tagged Event (Server to Client)",
	["VoiceSetupFailed"] = "Voice Setup Failed",
	["SubscriptionReset"] = "Subscription Reset",
	["SsrcUserIdMappingUpdate"] = "SSRC/User ID Mapping Update",
	["ClientStreamSwitchAck"] = "Client Stream Switch Ack",
	["SubscriptionHandshakeInitiated"] = "Subscription Handshake Initiated",
	["SubscriptionHandshakeAcked"] = "Subscription Handshake Acked",
	["SubscriptionHandshakeInitiatedWithBothSdp"] = "Subscription Handshake Initiated (Both SDP)",
	["SubscriptionHandshakeAckedWithBothSdp"] = "Subscription Handshake Acked (Both SDP)",
	["SubscriptionHandshakeInitiatedWithCompressedSdp"] = "Subscription Handshake Initiated (Compressed SDP)",
	["SubscriptionHandshakeAckedWithCompressedSdp"] = "Subscription Handshake Acked (Compressed SDP)",
	["SubscriptionHandshakeCompleted"] = "Subscription Handshake Completed",
	["VoiceChatSubscriptionInitialBatchEmpty"] = "Subscription Initial Batch Empty",
	["SubscriptionFeedStarted"] = "Subscription Feed Started",
	["VoiceMigration"] = "Voice Migration",
	["SubscriberAudioQualitySample"] = "Subscriber Audio Quality Sample"
}
return {
	["operationTypeLabels"] = v_u_21,
	["eventNameLabels"] = v_u_22,
	["humanizeName"] = v_u_20,
	["labelForOperationType"] = function(p23) -- name: labelForOperationType
		-- upvalues: (copy) v_u_21, (copy) v_u_20
		return v_u_21[p23] or v_u_20(p23)
	end,
	["labelForEventName"] = function(p24) -- name: labelForEventName
		-- upvalues: (copy) v_u_22, (copy) v_u_20
		return v_u_22[p24] or v_u_20(p24)
	end
}