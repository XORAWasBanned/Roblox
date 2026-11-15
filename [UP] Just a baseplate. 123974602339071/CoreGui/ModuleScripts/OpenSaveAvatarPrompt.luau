-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.OpenSaveAvatarPrompt
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Actions.OpenPrompt)
local v_u_3 = require(v1.PromptType)
return function(p_u_4, p_u_5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return function(p6)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) p_u_4, (copy) p_u_5
		local v7 = {
			["humanoidDescription"] = p_u_4,
			["rigType"] = p_u_5
		}
		p6:dispatch(v_u_2(v_u_3.SaveAvatar, v7))
	end
end