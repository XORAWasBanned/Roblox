-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Constants)
return function(p3, p4) -- name: MaybeSendEmoteFailureAnalyticsFromPlayer
	-- upvalues: (copy) v_u_2
	local v5 = p3.Character
	if not v5 then
		p4(v_u_2.ErrorTypes.TemporarilyUnavailable)
		return true
	end
	local v6
	if v5 then
		v6 = v5:FindFirstChildOfClass("Humanoid") or nil
	else
		v6 = nil
	end
	if not v6 then
		p4(v_u_2.ErrorTypes.TemporarilyUnavailable)
		return true
	end
	if v6 and v6.RigType ~= Enum.HumanoidRigType.R15 then
		p4(v_u_2.ErrorTypes.SwitchToR15)
		return true
	end
	local v7 = v5 and v5:FindFirstChild("Animate") or nil
	if not (v7 and (v6 and v6:FindFirstChildOfClass("HumanoidDescription"))) then
		p4(v_u_2.ErrorTypes.NotSupported)
		return true
	end
	local v8 = v7 and v7:FindFirstChild("PlayEmote") or nil
	if v8 and v8:IsA("BindableFunction") then
		return false
	end
	p4(v_u_2.ErrorTypes.NotSupported)
	return true
end