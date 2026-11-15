-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.PerformUpdateOutfit
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.CloseOpenPrompt)
local v_u_4 = require(v2.GetConformedHumanoidDescription)
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
	v_u_4(p5:getState().promptInfo.humanoidDescription, false):andThen(function(p6)
		-- upvalues: (ref) v_u_1
		v_u_1:PerformUpdateOutfit(p6)
	end, function(_)
		-- upvalues: (ref) v_u_1
		v_u_1:SignalUpdateOutfitFailed()
	end)
	p5:dispatch(v_u_3())
end