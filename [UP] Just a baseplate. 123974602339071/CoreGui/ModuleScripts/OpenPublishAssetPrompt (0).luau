-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Thunks.OpenPublishAssetPrompt
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Actions.OpenPublishAssetPrompt)
local v_u_3 = require(v1.PromptType)
return function(p_u_4, p_u_5, p_u_6, p_u_7)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return function(p8)
		-- upvalues: (ref) p_u_4, (ref) v_u_2, (ref) v_u_3, (copy) p_u_5, (copy) p_u_6, (copy) p_u_7
		if p_u_4:IsA("Accessory") then
			local v9 = Instance.new("Model")
			v9.Parent = p_u_4.Parent
			p_u_4.Parent = v9
			local v10 = p_u_4:FindFirstChildWhichIsA("BasePart", true)
			if v10 == nil then
				print("Error: accessory to be published does not contain a BasePart")
			else
				v9.PrimaryPart = v10
				p_u_4 = v9
			end
		end
		p8:dispatch(v_u_2(v_u_3.PublishAssetSingleStep, p_u_4, p_u_5, p_u_6, p_u_7))
	end
end