-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.OpenSetFavoritePrompt
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("MarketplaceService")
local v_u_4 = require(v2.Packages.Promise)
local v5 = script.Parent.Parent
local v_u_6 = require(v5.Actions.OpenPrompt)
local v_u_7 = require(v5.PromptType)
return function(p_u_8, p_u_9, p_u_10)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_1
	return function(p_u_11)
		-- upvalues: (ref) v_u_4, (copy) p_u_9, (ref) v_u_3, (copy) p_u_8, (ref) v_u_6, (ref) v_u_7, (copy) p_u_10, (ref) v_u_1
		return v_u_4.new(function(p12, p13)
			-- upvalues: (ref) p_u_9, (ref) v_u_3, (ref) p_u_8, (copy) p_u_11, (ref) v_u_6, (ref) v_u_7, (ref) p_u_10, (ref) v_u_1
			local v_u_14
			if p_u_9 == Enum.AvatarItemType.Asset then
				v_u_14 = Enum.InfoType.Asset
			else
				v_u_14 = Enum.InfoType.Bundle
			end
			local function v15()
				-- upvalues: (ref) v_u_3, (ref) p_u_8, (ref) v_u_14
				return v_u_3:GetProductInfoAsync(p_u_8, v_u_14)
			end
			local v16, v17 = pcall(v15)
			if v16 then
				p_u_11:dispatch(v_u_6(v_u_7.SetFavorite, {
					["itemId"] = p_u_8,
					["itemName"] = v17.Name,
					["itemType"] = p_u_9,
					["shouldFavorite"] = p_u_10
				}))
				p12()
			else
				v_u_1:SignalSetFavoriteFailed()
				p13()
			end
		end)
	end
end