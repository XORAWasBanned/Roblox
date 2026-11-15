-- Path: CoreGui.RobloxGui.Modules.VoiceChat.ReportAbuseLogic
require(script.Parent.VoiceChatServiceManager)
local v_u_1 = {
	["voice"] = "voice",
	["text"] = "text",
	["other"] = "other"
}
function GetDefaultMethodOfAbuse(p2, p3) -- name: GetDefaultMethodOfAbuse
	-- upvalues: (copy) v_u_1
	if p2 then
		local v4 = p3:getRecentUsersInteractionData()
		local v5 = p2.UserId
		if v4[tostring(v5)] then
			return v_u_1.voice
		else
			return v_u_1.text
		end
	elseif p3:GetMutedAnyone() then
		return v_u_1.voice
	else
		return v_u_1.text
	end
end
return {
	["MethodsOfAbuse"] = v_u_1,
	["GetDefaultMethodOfAbuse"] = GetDefaultMethodOfAbuse
}