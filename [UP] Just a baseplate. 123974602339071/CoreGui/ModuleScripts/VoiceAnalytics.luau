-- Path: CoreGui.RobloxGui.Modules.Settings.Analytics.VoiceAnalytics
local v_u_1 = require(script.Parent.Parent.Resources.Constants)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3, p4) -- name: new
	-- upvalues: (copy) v_u_2
	local v5 = {
		["_eventStreamImpl"] = nil,
		["_target"] = "EventIngest",
		["_context"] = nil,
		["_eventStreamImpl"] = p3,
		["_context"] = p4 or "SettingsHub"
	}
	local v6 = v_u_2
	setmetatable(v5, v6)
	return v5
end
function v_u_2.onToggleMuteAll(p7, p8) -- name: onToggleMuteAll
	if p8 then
		p7:onMuteAll()
	else
		p7:onUnmuteAll()
	end
end
function v_u_2.onToggleMuteSelf(p9, p10) -- name: onToggleMuteSelf
	if p10 then
		p9:onMuteSelf()
	else
		p9:onUnmuteSelf()
	end
end
function v_u_2.onToggleMutePlayer(p11, p12, p13) -- name: onToggleMutePlayer
	if p13 then
		p11:onMutePlayer(p12)
	else
		p11:onUnmutePlayer(p12)
	end
end
function v_u_2.onMuteSelf(p14) -- name: onMuteSelf
	-- upvalues: (copy) v_u_1
	local v15 = v_u_1.VoiceAnalytics.MuteSelf
	p14._eventStreamImpl:setRBXEventStream(p14._target, p14._context, v15, {})
end
function v_u_2.onUnmuteSelf(p16) -- name: onUnmuteSelf
	-- upvalues: (copy) v_u_1
	local v17 = v_u_1.VoiceAnalytics.UnmuteSelf
	p16._eventStreamImpl:setRBXEventStream(p16._target, p16._context, v17, {})
end
function v_u_2.onMuteAll(p18) -- name: onMuteAll
	-- upvalues: (copy) v_u_1
	local v19 = v_u_1.VoiceAnalytics.MuteAll
	p18._eventStreamImpl:setRBXEventStream(p18._target, p18._context, v19, {})
end
function v_u_2.onUnmuteAll(p20) -- name: onUnmuteAll
	-- upvalues: (copy) v_u_1
	local v21 = v_u_1.VoiceAnalytics.UnmuteAll
	p20._eventStreamImpl:setRBXEventStream(p20._target, p20._context, v21, {})
end
function v_u_2.onMutePlayer(p22, p23) -- name: onMutePlayer
	-- upvalues: (copy) v_u_1
	local v24 = v_u_1.VoiceAnalytics.MutePlayer
	p22._eventStreamImpl:setRBXEventStream(p22._target, p22._context, v24, {
		["mutedUserId"] = p23
	})
end
function v_u_2.onUnmutePlayer(p25, p26) -- name: onUnmutePlayer
	-- upvalues: (copy) v_u_1
	local v27 = v_u_1.VoiceAnalytics.UnmutePlayer
	p25._eventStreamImpl:setRBXEventStream(p25._target, p25._context, v27, {
		["mutedUserId"] = p26
	})
end
return v_u_2