-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.PerformSaveAvatar
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.CloseOpenPrompt)
local v_u_4 = require(v2.GetConformedHumanoidDescription)
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
	local v_u_6 = p5:getState().analyticsInfo.addedAssets or {}
	local v_u_7 = p5:getState().analyticsInfo.removedAssets or {}
	v_u_4(p5:getState().promptInfo.humanoidDescription, false):andThen(function(p8)
		-- upvalues: (ref) v_u_1, (copy) v_u_6, (copy) v_u_7
		v_u_1:PerformSaveAvatarWithDescription(p8, v_u_6, v_u_7)
	end, function(_)
		-- upvalues: (ref) v_u_1
		v_u_1:SignalSaveAvatarFailed()
	end)
	p5:dispatch(v_u_3())
end