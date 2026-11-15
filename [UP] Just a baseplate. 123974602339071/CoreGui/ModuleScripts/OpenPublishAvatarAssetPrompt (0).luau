-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Thunks.OpenPublishAvatarAssetPrompt
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Actions.OpenPublishAvatarAssetPrompt)
local v_u_3 = require(v1.PromptType)
return function(p_u_4, p_u_5, p_u_6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return function(p7)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) p_u_4, (copy) p_u_5, (copy) p_u_6
		p7:dispatch(v_u_2(v_u_3.PublishAvatarAsset, p_u_4, p_u_5, p_u_6))
	end
end