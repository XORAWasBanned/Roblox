-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.PerformCreateOutfit
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.CloseOpenPrompt)
local v_u_4 = require(v2.GetConformedHumanoidDescription)
return function(p_u_5)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
	return function(p6)
		-- upvalues: (ref) v_u_4, (ref) v_u_1, (copy) p_u_5, (ref) v_u_3
		v_u_4(p6:getState().promptInfo.humanoidDescription, false):andThen(function(p7)
			-- upvalues: (ref) v_u_1, (ref) p_u_5
			v_u_1:PerformCreateOutfitWithDescription(p7, p_u_5)
		end, function(_)
			-- upvalues: (ref) v_u_1
			v_u_1:SignalCreateOutfitFailed()
		end)
		p6:dispatch(v_u_3())
	end
end