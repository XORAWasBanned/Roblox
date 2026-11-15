-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.OpenUpdateOutfitPrompt
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.OpenPrompt)
local v_u_4 = require(v2.Network.GetOutfitName)
local v_u_5 = require(v2.PromptType)
return function(p_u_6, p_u_7, p_u_8)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_1
	return function(p_u_9)
		-- upvalues: (ref) v_u_4, (copy) p_u_6, (ref) v_u_3, (ref) v_u_5, (copy) p_u_7, (copy) p_u_8, (ref) v_u_1
		v_u_4(p_u_6):andThen(function(p10)
			-- upvalues: (copy) p_u_9, (ref) v_u_3, (ref) v_u_5, (ref) p_u_6, (ref) p_u_7, (ref) p_u_8
			local v11 = {
				["outfitId"] = p_u_6,
				["outfitName"] = p10,
				["humanoidDescription"] = p_u_7,
				["rigType"] = p_u_8
			}
			p_u_9:dispatch(v_u_3(v_u_5.UpdateOutfit, v11))
		end, function(_)
			-- upvalues: (ref) v_u_1
			v_u_1:SignalUpdateOutfitFailed()
		end)
	end
end