-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Mocks.MockAvatarChatService
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3, p4, p5) -- name: new
	-- upvalues: (copy) v_u_1
	local v6 = v_u_1
	return setmetatable({
		["IsEnabled"] = p2,
		["EnableVoice"] = p3,
		["GetPropertyChangedSignal"] = p4,
		["GetClientFeaturesAsync"] = p5
	}, v6)
end
return v_u_1