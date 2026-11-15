-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.onClickedCameraIndicator
local v_u_1 = game:GetService("FaceAnimatorService")
local v2 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_3 = require(v2.SelfView.Analytics).new()
local v_u_4 = require(v2.SelfView.publicApi)
local v_u_5 = require(v2.SelfView.toggleSelfViewSignal)
return function()
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	if v_u_1 and v_u_1:IsStarted() then
		v_u_1.VideoAnimationEnabled = not v_u_1.VideoAnimationEnabled
		v_u_3:setLastCtx("bubbleChatToggle")
		local v6 = v_u_4.getSelfViewIsOpenAndVisible()
		if v_u_1.VideoAnimationEnabled and not v6 then
			v_u_5:fire()
		end
	end
end