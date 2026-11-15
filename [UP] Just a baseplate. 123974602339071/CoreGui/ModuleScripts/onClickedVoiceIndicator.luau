-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.onClickedVoiceIndicator
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v4 = v2:WaitForChild("RobloxGui")
local v_u_5 = require(v3.Workspace.Packages.VoiceChat).Constants
local v_u_6 = require(v4.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_7 = require(v4.Modules.SelfView.Analytics).new()
return function(p8, p9, p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v11 = v_u_1.LocalPlayer
	if v11 then
		local v12 = v11.UserId
		if p8 == tostring(v12) then
			if p9 == v_u_5.VOICE_STATE.ERROR then
				v_u_6:RejoinPreviousChannel()
				return
			elseif p9 == v_u_5.VOICE_STATE.CONNECTING then
				v_u_6:ShowVoiceChatLoadingMessage()
			else
				v_u_7:setLastCtx("bubbleChatToggle")
				v_u_6:ToggleMic(p10)
			end
		end
		v_u_6:ToggleMutePlayer(tonumber(p8), p10)
	end
end