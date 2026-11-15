-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.PerformRenameOutfit
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.CloseOpenPrompt)
return function(p_u_4)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	return function(p5)
		-- upvalues: (ref) v_u_1, (copy) p_u_4, (ref) v_u_3
		v_u_1:PerformRenameOutfit(p_u_4)
		p5:dispatch(v_u_3())
	end
end