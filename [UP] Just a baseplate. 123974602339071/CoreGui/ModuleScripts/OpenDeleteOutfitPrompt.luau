-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.OpenDeleteOutfitPrompt
local v_u_1 = game:GetService("AvatarEditorService")
game:GetService("CorePackages")
game:GetService("HttpRbxApiService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.OpenPrompt)
local v_u_4 = require(v2.Network.GetOutfitName)
local v_u_5 = require(v2.PromptType)
return function(p_u_6)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_1
	return function(p_u_7)
		-- upvalues: (ref) v_u_4, (copy) p_u_6, (ref) v_u_3, (ref) v_u_5, (ref) v_u_1
		v_u_4(p_u_6):andThen(function(p8)
			-- upvalues: (copy) p_u_7, (ref) v_u_3, (ref) v_u_5, (ref) p_u_6
			local v9 = {
				["outfitId"] = p_u_6,
				["outfitName"] = p8
			}
			p_u_7:dispatch(v_u_3(v_u_5.DeleteOutfit, v9))
		end, function(_)
			-- upvalues: (ref) v_u_1
			v_u_1:SignalDeleteOutfitFailed()
		end)
	end
end