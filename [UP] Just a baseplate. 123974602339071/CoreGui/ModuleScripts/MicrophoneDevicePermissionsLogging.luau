-- Path: CoreGui.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging
local v_u_1 = game:GetService("RbxAnalyticsService")
local v_u_2 = game:GetService("AvatarChatService")
local v_u_3 = game:DefineFastString("MicrophoneDevicePermissionsLoggingEventName", "microphoneDevicePermissionPrompted")
return {
	["_initialized"] = false,
	["placeId"] = 0,
	["universeId"] = 0,
	["placeVoiceEnabled"] = false,
	["universeVoiceEnabled"] = false,
	["clientSessionId"] = "",
	["UIType"] = nil,
	["UIType"] = {
		["EXPERIENCE_JOIN"] = 0,
		["PROMPT_IMPRESSION"] = 1,
		["PROMPT_INTERACTION"] = 2
	},
	["_init"] = function(p4, p5, p6) -- name: _init
		-- upvalues: (copy) v_u_2
		p4._initialized = true
		p4.placeId = game.PlaceId
		p4.universeId = game.GameId
		p4.placeVoiceEnabled = v_u_2:IsEnabled(p5, Enum.AvatarChatServiceFeature.PlaceAudio)
		p4.universeVoiceEnabled = v_u_2:IsEnabled(p5, Enum.AvatarChatServiceFeature.UniverseAudio)
		p4:logExperienceJoin({
			["didAuthorize"] = p6
		})
	end,
	["_getEventPayload"] = function(p7, p8, p9) -- name: _getEventPayload
		return {
			["uiType"] = p8,
			["uiContext"] = p9.uiContext,
			["didAuthorize"] = p9.didAuthorize,
			["placeId"] = p7.placeId,
			["universeId"] = p7.universeId,
			["placeVoiceEnabled"] = p7.placeVoiceEnabled,
			["universeVoiceEnabled"] = p7.universeVoiceEnabled,
			["clientSessionId"] = p7.clientSessionId
		}
	end,
	["_isReady"] = function(p10) -- name: _isReady
		return p10._initialized
	end,
	["init"] = function(p_u_11, p_u_12) -- name: init
		-- upvalues: (copy) v_u_2
		if v_u_2.ClientFeaturesInitialized then
			p_u_11:_init(v_u_2.ClientFeatures, p_u_12)
		else
			local v_u_13 = nil
			v_u_13 = v_u_2:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
				-- upvalues: (copy) p_u_11, (ref) v_u_2, (copy) p_u_12, (ref) v_u_13
				p_u_11:_init(v_u_2.ClientFeatures, p_u_12)
				v_u_13:Disconnect()
			end)
		end
	end,
	["logExperienceJoin"] = function(p14, p15) -- name: logExperienceJoin
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		if p14:_isReady() then
			v_u_1:SendEventDeferred("client", "voice", v_u_3, p14:_getEventPayload(p14.UIType.EXPERIENCE_JOIN, p15))
		end
	end,
	["logPromptImpression"] = function(p16, p17) -- name: logPromptImpression
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		if p16:_isReady() then
			v_u_1:SendEventDeferred("client", "voice", v_u_3, p16:_getEventPayload(p16.UIType.PROMPT_IMPRESSION, p17))
		end
	end,
	["logPromptInteraction"] = function(p18, p19) -- name: logPromptInteraction
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		if p18:_isReady() then
			v_u_1:SendEventDeferred("client", "voice", v_u_3, p18:_getEventPayload(p18.UIType.PROMPT_INTERACTION, p19))
		end
	end,
	["setClientSessionId"] = function(p20, p21) -- name: setClientSessionId
		if p20:_isReady() and p20.clientSessionId ~= p21 then
			p20.clientSessionId = p21
		end
	end
}